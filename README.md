<p align="center">
  <img src="docs/assets/logo.svg" width="78" alt="VClaw"/>
</p>

<h1 align="center">VClaw</h1>

<p align="center"><b>A local-first fleet of AI-controlled machines.</b><br/>
Install a node on each computer you own — then chat with its AI, drive its screen, and run commands
from one console, anywhere. Runs on your hardware. You hold the keys and the kill switch.</p>

---

## Install

**macOS / Linux**
```sh
curl -fsSL https://get.vclaw.ai/install.sh | sh
```

**Windows (PowerShell)**
```powershell
irm https://get.vclaw.ai/install.ps1 | iex
```

> Not on a custom domain yet? Use the repo directly:
> `curl -fsSL https://raw.githubusercontent.com/vkfolio/vclaw_fleet/main/scripts/install.sh | sh`
> &nbsp;·&nbsp; `irm https://raw.githubusercontent.com/vkfolio/vclaw_fleet/main/scripts/install.ps1 | iex`

The installer downloads a single, **closed-source binary** (no Python, no source code), starts the
node in the background, auto-starts it at login, and prints your admin URL. Manage it with:

```
vclaw status      # running? autostart? admin URL
vclaw down        # stop + disable autostart
vclaw up --lan    # expose to other devices on your network
vclaw uninstall   # remove (add --purge to delete all data)
```

## What it is

VClaw turns the computers you already own into a fleet you command from one place:

- **One console, every machine** — pair each device with a QR code; live status, per-device permissions.
- **AI that acts** — chat with each machine's agent; it uses real tools and renders interactive
  controls, under a mode you choose (Ask / Plan / Edit / Auto).
- **Skills studio** — teach the agent reusable, multi-page playbooks; share them as `.vcskill` files.
- **Remote desktop** — Teams-grade WebRTC screen + keyboard/mouse control.
- **Quick actions & terminal** — one-tap reboot/lock/screenshot/custom commands, plus a live PTY shell.
- **Memory, MCP, scheduling** — vector recall, pluggable MCP tools, proactive cron/interval tasks.
- **Private remote access** — reach your fleet from anywhere over a private Cloudflare WARP mesh.

## Why it exists

Tools that wire a personal AI through a Telegram/WhatsApp bot or a hosted service make two trades:
your data flows through someone else's servers, and your assistant dies when their service does. VClaw
removes the middleman — the agent runs on **your** hardware, reachable privately from anywhere, with
**you** approving anything risky. [Read the full story →](https://get.vclaw.ai)

## Security

- **Local-first** — your data, keys, and the kill switch stay on your machines.
- **Capability-gated** — each device gets an allowlist; risky actions wait for your Approve/Deny tap.
- **Secrets stay secret** — API keys live on the node with locked-down permissions; never sent to the
  model or to programs it runs.
- **Private by default** — remote access rides a private mesh or a gated tunnel; nothing public.

## Links

- **Website / story:** https://get.vclaw.ai
- **Docs:** [`docs/`](docs/) — [Install](docs/INSTALL.md) · [Getting started](docs/GETTING_STARTED.md) · [Security](docs/SECURITY.md) · [FAQ](docs/FAQ.md)
- **Releases:** [latest binaries](https://github.com/vkfolio/vclaw_fleet/releases/latest)

## License

VClaw is **closed-source**. The binaries are free for personal use. This repository hosts the
website, docs, and release binaries — not the source. © 2026 Vignesh. All rights reserved.
