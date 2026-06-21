# Install

VClaw installs as a single, closed-source binary — no Python, no source code, no build step. The
one-liner downloads it, starts the node in the background, auto-starts it at login, and prints your
admin URL.

## One-line install

**macOS / Linux**
```sh
curl -fsSL https://get.vclaw.ai/install.sh | sh
```

**Windows (PowerShell)**
```powershell
irm https://get.vclaw.ai/install.ps1 | iex
```

Until the custom domain is live, install straight from this repo:
```sh
curl -fsSL https://raw.githubusercontent.com/vkfolio/vclaw_fleet/main/scripts/install.sh | sh
```
```powershell
irm https://raw.githubusercontent.com/vkfolio/vclaw_fleet/main/scripts/install.ps1 | iex
```

## What the installer does
1. Downloads the right binary for your OS/arch from the [latest release](https://github.com/vkfolio/vclaw_fleet/releases/latest):
   `vclaw-windows-x64.exe`, `vclaw-macos-arm64`, `vclaw-macos-x64`, or `vclaw-linux-x64`.
2. Installs it (`~/.local/bin` on macOS/Linux, `%LOCALAPPDATA%\VClaw` on Windows) and puts it on PATH.
3. Runs `vclaw up` — creates an owner on first run and prints the admin panel URL.

## Manage the node
```
vclaw status          # running? autostart enabled? admin URL
vclaw up              # start in the background + autostart at login
vclaw up --lan        # also expose to other devices on your network
vclaw down            # stop + disable autostart
vclaw uninstall       # remove (add --purge to also delete ~/.vclaw data)
```

## Requirements
- A 64-bit machine: Windows 10/11, macOS 13+ (Apple Silicon or Intel), or a modern Linux.
- Internet access for the AI model provider you choose (or run a local model via Ollama).

## Manual download
Prefer not to pipe a script? Grab the binary from the
[releases page](https://github.com/vkfolio/vclaw_fleet/releases/latest), make it executable
(`chmod +x` on macOS/Linux), and run `./vclaw up`.

## First-run notes
- Until the binaries are code-signed, Windows SmartScreen or macOS Gatekeeper may warn on first launch.
  On macOS: right-click → Open, or `xattr -d com.apple.quarantine ./vclaw`.
- By default the node binds to `127.0.0.1` (this machine only). Use `vclaw up --lan` for other devices
  on your network, and set up remote access (WARP) for outside it — see [Security](SECURITY.md).
