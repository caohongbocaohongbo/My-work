#!/usr/bin/env python3
"""为视频 Skill 创建隔离的临时软链接租约，并安全回收过期挂载。"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import sys
import time
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
CATALOG_PATH = SCRIPT_DIR.parent / "references" / "layer-catalog.json"
DEFAULT_MAX_IDLE = 1200


def safe_name(value: str) -> str:
    cleaned = re.sub(r"[^A-Za-z0-9._-]+", "-", value).strip(".-")
    if not cleaned or cleaned in {".", ".."}:
        raise ValueError("agent/session 名称不能为空，且只能包含可安全归一化的字符")
    return cleaned[:96]


def runtime_root() -> Path:
    return Path(f"/tmp/video-production-mounts-{os.getuid()}")


def load_catalog() -> dict:
    return json.loads(CATALOG_PATH.read_text(encoding="utf-8"))


def session_dir(agent: str, session: str) -> Path:
    return runtime_root() / safe_name(agent) / safe_name(session)


def lease_path(agent: str, session: str) -> Path:
    return session_dir(agent, session) / "lease.json"


def write_lease(agent: str, session: str, layers: list[str], links: dict[str, str]) -> dict:
    now = int(time.time())
    payload = {
        "schema": 1,
        "agent": safe_name(agent),
        "session": safe_name(session),
        "layers": layers,
        "links": links,
        "last_touch": now,
        "expires_at": now + DEFAULT_MAX_IDLE,
    }
    path = lease_path(agent, session)
    path.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return payload


def ensure_sources(catalog: dict, layers: list[str]) -> dict[str, Path]:
    known = catalog["layers"]
    unknown = sorted(set(layers) - set(known))
    if unknown:
        raise ValueError(f"未知层: {', '.join(unknown)}")

    root = Path(catalog["archive_root"]).resolve()
    links: dict[str, Path] = {}
    for layer in layers:
        for name, rel in known[layer].items():
            source = (root / rel).resolve()
            if root not in source.parents:
                raise ValueError(f"来源越界: {source}")
            if not (source / "SKILL.md").is_file():
                raise FileNotFoundError(f"缺少 SKILL.md: {source}")
            previous = links.get(name)
            if previous and previous != source:
                raise ValueError(f"挂载名冲突: {name}")
            links[name] = source
    return links


def command_mount(args: argparse.Namespace) -> int:
    catalog = load_catalog()
    if args.layers == "all":
        layers = list(catalog["layers"])
    else:
        layers = [item.strip() for item in args.layers.split(",") if item.strip()]
    links = ensure_sources(catalog, layers)
    target = session_dir(args.agent, args.session)
    skills = target / "skills"
    skills.mkdir(parents=True, exist_ok=True)

    expected = set(links)
    for entry in skills.iterdir():
        if entry.name not in expected:
            if entry.is_symlink() or entry.is_file():
                entry.unlink()
            else:
                shutil.rmtree(entry)

    serialized: dict[str, str] = {}
    for name, source in sorted(links.items()):
        link = skills / name
        if link.is_symlink() and link.resolve() == source:
            pass
        else:
            if link.exists() or link.is_symlink():
                if link.is_dir() and not link.is_symlink():
                    shutil.rmtree(link)
                else:
                    link.unlink()
            link.symlink_to(source, target_is_directory=True)
        serialized[name] = str(source)

    payload = write_lease(args.agent, args.session, layers, serialized)
    print(json.dumps({"skills_dir": str(skills), "lease": payload}, ensure_ascii=False, indent=2))
    return 0


def command_touch(args: argparse.Namespace) -> int:
    path = lease_path(args.agent, args.session)
    if not path.is_file():
        raise FileNotFoundError(f"租约不存在: {path}")
    payload = json.loads(path.read_text(encoding="utf-8"))
    payload = write_lease(args.agent, args.session, payload["layers"], payload["links"])
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return 0


def remove_session(target: Path) -> None:
    root = runtime_root().resolve()
    resolved_parent = target.parent.resolve()
    if root != resolved_parent and root not in resolved_parent.parents:
        raise ValueError(f"拒绝回收越界目录: {target}")
    if target.exists():
        shutil.rmtree(target)


def command_release(args: argparse.Namespace) -> int:
    target = session_dir(args.agent, args.session)
    remove_session(target)
    print(json.dumps({"released": str(target)}, ensure_ascii=False))
    return 0


def command_reap(args: argparse.Namespace) -> int:
    root = runtime_root()
    if not root.exists():
        print(json.dumps({"reaped": [], "root": str(root)}, ensure_ascii=False))
        return 0
    now = int(time.time())
    reaped: list[str] = []
    kept: list[str] = []
    for path in root.glob("*/*/lease.json"):
        try:
            payload = json.loads(path.read_text(encoding="utf-8"))
            last_touch = int(payload.get("last_touch", 0))
        except (OSError, ValueError, TypeError):
            last_touch = 0
        target = path.parent
        if now - last_touch >= args.max_idle:
            remove_session(target)
            reaped.append(str(target))
        else:
            kept.append(str(target))
    print(json.dumps({"reaped": reaped, "kept": kept, "max_idle": args.max_idle}, ensure_ascii=False, indent=2))
    return 0


def command_status(args: argparse.Namespace) -> int:
    root = runtime_root()
    leases = []
    for path in root.glob("*/*/lease.json") if root.exists() else []:
        try:
            leases.append(json.loads(path.read_text(encoding="utf-8")))
        except (OSError, ValueError):
            leases.append({"invalid": str(path)})
    print(json.dumps({"runtime_root": str(root), "leases": leases}, ensure_ascii=False, indent=2))
    return 0


def parser() -> argparse.ArgumentParser:
    result = argparse.ArgumentParser(description=__doc__)
    sub = result.add_subparsers(dest="command", required=True)
    mount = sub.add_parser("mount")
    mount.add_argument("--agent", required=True)
    mount.add_argument("--session", required=True)
    mount.add_argument("--layers", default="all")
    mount.set_defaults(func=command_mount)
    touch = sub.add_parser("touch")
    touch.add_argument("--agent", required=True)
    touch.add_argument("--session", required=True)
    touch.set_defaults(func=command_touch)
    release = sub.add_parser("release")
    release.add_argument("--agent", required=True)
    release.add_argument("--session", required=True)
    release.set_defaults(func=command_release)
    reap = sub.add_parser("reap")
    reap.add_argument("--max-idle", type=int, default=DEFAULT_MAX_IDLE)
    reap.set_defaults(func=command_reap)
    status = sub.add_parser("status")
    status.set_defaults(func=command_status)
    return result


def main() -> int:
    try:
        args = parser().parse_args()
        return args.func(args)
    except Exception as exc:  # CLI 边界统一输出，便于定时器记录。
        print(json.dumps({"error": str(exc)}, ensure_ascii=False), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
