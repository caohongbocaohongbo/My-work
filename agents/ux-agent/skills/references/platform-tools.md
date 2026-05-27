# Platform Tools Compatibility

Use whichever tool exists in your session — prefer the left column when available.

| Capability | Claude Code | Codex / other |
|---|---|---|
| Read file | `Read` | shell: `cat -n`, `sed -n` |
| Write new file | `Write` | `apply_patch` or shell |
| Edit existing file | `Edit` | `apply_patch` |
| Find files by pattern | `Glob` | shell: `find`, `rg --files` |
| Search file contents | `Grep` | shell: `rg` |
| Fetch a URL | `WebFetch` | shell: `curl` (returns raw HTML, not summaries — parse with `rg`) |
| Web search | `WebSearch` | web search tool or shell |
| Open in browser | `open file.html` | `open file.html` (macOS) or print the absolute path for the user |
| Browser DevTools | `mcp__chrome-devtools__*` | MCP if configured, else skip — fall back to URL fetch |
