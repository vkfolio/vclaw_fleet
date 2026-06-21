# Security & privacy

VClaw is built so you stay in control. The whole design assumes the agent is powerful, so the guard
rails are the point.

## Local-first
The agent runs on **your** hardware. Your conversations, files, and API keys never pass through a
third-party chat platform or a hosted VClaw service — because there isn't one. If your machine is on,
your assistant is up; if it's off, nothing of yours is sitting on someone else's server.

## Capability allowlists
Every paired device gets an explicit allowlist of **capabilities** (read files, write files, shell,
system control, remote desktop, …). A device can only do what you've granted it, and you can change or
revoke that at any time from the admin console.

## Approve every risk
Risky actions — running a shell command, controlling the system, writing files — don't just happen.
The agent asks, and you tap **Approve** or **Deny**. When you're away, approvals can arrive as a push
notification. You can pre-authorize a trusted device per capability (`auto`) for one-tap actions, or
keep it on `ask` so everything routes through an approval.

## Secrets stay secret
API keys and other secrets live on the node in an owner-only store with locked-down file permissions.
They are **never** sent to the language model and **never** injected into programs the agent runs.

## Private remote access
To reach your fleet from outside your network, VClaw uses a **private Cloudflare WARP mesh** (or a
gated tunnel) — your devices talk to each other over a private network. Nothing is exposed to the
public internet; there's no open port and no public bot to find or hijack.

## Locked-down web access
A device joined over the web (a browser PWA) is clamped to safe, read-only behavior server-side. Full
power requires the native app with explicit approvals.

## Binaries
Releases are compiled (no source ships). Until they're code-signed, your OS may warn on first launch —
see [INSTALL](INSTALL.md). Verify you're downloading from
[github.com/vkfolio/vclaw_fleet/releases](https://github.com/vkfolio/vclaw_fleet/releases).

## Reporting an issue
Found a security problem? Email **vigneshaiml@gmail.com** rather than opening a public issue.
