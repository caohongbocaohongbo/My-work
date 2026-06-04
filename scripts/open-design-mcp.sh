#!/bin/bash
# Dynamically discover Open Design daemon URL and launch MCP CLI
DAEMON_LOG="$HOME/Library/Application Support/Open Design/namespaces/release-stable/logs/daemon/latest.log"

if [ -f "$DAEMON_LOG" ]; then
    DAEMON_URL=$(python3 -c "import json; print(json.load(open('$DAEMON_LOG'))['url'])" 2>/dev/null)
else
    DAEMON_URL=""
fi

if [ -z "$DAEMON_URL" ]; then
    echo "Error: Cannot find Open Design daemon URL" >&2
    exit 1
fi

export OD_DATA_DIR="$HOME/Library/Application Support/Open Design"
export OD_DAEMON_URL="$DAEMON_URL"

exec "/Applications/Open Design.app/Contents/Resources/open-design/bin/node" \
    "/Applications/Open Design.app/Contents/Resources/app/prebundled/daemon/daemon-cli.mjs" \
    mcp \
    --daemon-url "$DAEMON_URL"
