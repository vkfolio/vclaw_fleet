# Getting started

After [installing](INSTALL.md), `vclaw up` prints your admin URL (e.g. `http://127.0.0.1:18789/admin`).
Open it and set an owner password — that's your console.

## 1. Add your AI model
In **Models**, pick a provider (Claude, OpenAI, Kimi, or local Ollama) and paste an API key. Keys are
stored on the node with locked-down permissions and are never sent to the model or to programs it runs.

## 2. Pair your other devices
In **Devices**, generate a pairing code / QR. On the other machine (or phone), scan it to join the
fleet. Each device gets its own **capability allowlist** — grant only what you trust it to do, and
revoke any device instantly.

## 3. Chat with a machine
Open **Chat** and ask it to do real work. Pick a **mode**:
- **Ask** — read-only; answers questions, no changes.
- **Plan** — proposes a plan, doesn't execute.
- **Edit** — does the work, but waits for your **Approve/Deny** on anything risky.
- **Auto** — autonomous; asks only when genuinely ambiguous.

When the agent needs a decision it renders **interactive controls** (confirm, multi-select, forms,
sliders…) right in the chat — tap to answer. You can also attach screenshots and files.

## 4. Take the controls
- **Remote desktop** — view and control a machine's screen (WebRTC), low-latency.
- **Terminal** — a full shell in the console.
- **Quick actions** — one-tap reboot / lock / screenshot, plus your own saved commands. Reboot a
  machine and it comes back online on its own.

## 5. Teach it skills
In **Skills**, create reusable, multi-page playbooks (the AI can draft one from a sentence). Export or
drag-and-drop install `.vcskill` packages to move skills between machines.

## 6. Reach it from anywhere
For access outside your network, set up a private **Cloudflare WARP** mesh (or a gated tunnel) so your
fleet is reachable from your phone without exposing anything to the public internet. See
[Security](SECURITY.md).

## Native app
A native iOS app (Android & desktop to follow) talks to the same node — pairing, streaming chat with
approvals via push, remote desktop, files, and a terminal.
