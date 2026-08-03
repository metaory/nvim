#!/usr/bin/env bash
# Install prebuilt vscode-js-debug DAP server as `js-debug-dap` (mirrors AUR vscode-js-debug-bin).
# Usage: .github/scripts/jsdebug.sh [version]
set -euo pipefail

VER="${1:-1.102.0}"
PREFIX="${PREFIX:-$HOME/.local}"
LIB="$PREFIX/lib/js-debug"
BIN="$PREFIX/bin/js-debug-dap"
URL="https://github.com/microsoft/vscode-js-debug/releases/download/v${VER}/js-debug-dap-v${VER}.tar.gz"
TMP="$(mktemp -d)"

cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

command -v node >/dev/null || { echo "node required" >&2; exit 1; }
command -v curl >/dev/null || { echo "curl required" >&2; exit 1; }

mkdir -p "$PREFIX/bin" "$PREFIX/lib"
curl -fsSL "$URL" -o "$TMP/js-debug-dap.tgz"
tar -xzf "$TMP/js-debug-dap.tgz" -C "$TMP"

SRC="$TMP/js-debug/src"
[[ -f "$SRC/dapDebugServer.js" ]] || { echo "unexpected tarball layout" >&2; exit 1; }

grep -q '^#!' "$SRC/dapDebugServer.js" || {
  if sed --version >/dev/null 2>&1; then
    sed -i '1i#!/usr/bin/env node' "$SRC/dapDebugServer.js"
  else
    sed -i '' '1i\
#!/usr/bin/env node
' "$SRC/dapDebugServer.js"
  fi
}
chmod +x "$SRC/dapDebugServer.js"

rm -rf "$LIB"
cp -R "$SRC" "$LIB"
ln -sfn "$LIB/dapDebugServer.js" "$BIN"

echo "installed $BIN -> $LIB/dapDebugServer.js (v$VER)"
case ":$PATH:" in
  *":$PREFIX/bin:"*) ;;
  *) echo "add to PATH: export PATH=\"$PREFIX/bin:\$PATH\"" ;;
esac
