#!/bin/sh
# VClaw one-line installer for macOS / Linux.
#   curl -fsSL https://get.vclaw.ai/install.sh | sh
#
# Downloads a single, closed-source VClaw binary (no source code ships), installs it to
# ~/.local/bin, and brings the node up (background + autostart at login).
set -e

say() { printf '\033[1;35m> %s\033[0m\n' "$1"; }

# Pick the right asset for this OS/arch.
os=$(uname -s); arch=$(uname -m)
case "$os" in
  Darwin) plat="macos" ;;
  Linux)  plat="linux" ;;
  *) echo "Unsupported OS: $os" >&2; exit 1 ;;
esac
case "$arch" in
  arm64|aarch64) cpu="arm64" ;;
  x86_64|amd64)  cpu="x64" ;;
  *) echo "Unsupported arch: $arch" >&2; exit 1 ;;
esac
asset="vclaw-${plat}-${cpu}"

# Where the prebuilt binary lives. Override VCLAW_BASE_URL to use your own host (e.g. an R2 bucket
# behind https://get.vclaw.ai). Default: the latest GitHub release asset.
base="${VCLAW_BASE_URL:-https://github.com/vkfolio/vclaw_fleet/releases/latest/download}"
dest="$HOME/.local/bin"
exe="$dest/vclaw"

# 1. Download the binary.
say "Downloading VClaw ($asset)…"
mkdir -p "$dest"
curl -fsSL "$base/$asset" -o "$exe.download"
chmod +x "$exe.download"
mv -f "$exe.download" "$exe"

# 2. Make sure ~/.local/bin is on PATH for new shells.
case ":$PATH:" in
  *":$dest:"*) ;;
  *)
    for rc in "$HOME/.zshrc" "$HOME/.bashrc" "$HOME/.profile"; do
      [ -f "$rc" ] && ! grep -q '.local/bin' "$rc" && \
        printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$rc"
    done
    export PATH="$dest:$PATH" ;;
esac

# 3. Bring the node up (creates an owner on first run and prints the admin URL).
say "Starting VClaw…"
"$exe" up

cat <<'EOF'

VClaw is installed and running.
  - Open the admin panel URL printed above to pair a device.
  - Manage it with:  vclaw status | vclaw down | vclaw up | vclaw uninstall
  - For other devices on your network, run:  vclaw down && vclaw up --lan
EOF
