# FAQ

**Is it open source?**
No — VClaw ships as a closed-source compiled binary. This repo hosts the website, docs, and release
binaries. The binaries are free for personal use.

**Where does my data go?**
Nowhere you don't control. The agent runs on your own machines; there's no hosted VClaw service in the
middle. The only outbound calls are to the AI model provider you configure (or none, if you run a local
model with Ollama).

**Do I need to expose ports to the internet?**
No. By default the node is local-only. For remote access, VClaw uses a private Cloudflare WARP mesh —
nothing is published to the public internet.

**Which AI models work?**
Claude (Anthropic), OpenAI, Kimi (Moonshot), and local models via Ollama. You bring your own key (or
run local).

**What can the agent actually do?**
Answer questions, read/write files, run shell commands, control the system, take screenshots, drive
the remote desktop, run scheduled tasks, and use any MCP tools you connect — each gated by the
capabilities you grant and your approvals.

**Does it survive a reboot?**
Yes. The node auto-starts at login. You can even reboot a machine from the console and watch it come
back online.

**How do I update?**
Re-run the installer to pull the latest binary, or download it from the
[releases page](https://github.com/vkfolio/vclaw_fleet/releases/latest).

**Which platforms?**
Windows 10/11, macOS 13+ (Apple Silicon & Intel), and modern Linux (x64). A native iOS app is in
development; Android and desktop apps will follow.

**How do I remove it?**
`vclaw uninstall` (add `--purge` to also delete the `~/.vclaw` data directory).

**Something's wrong / I have a question.**
Email **vigneshaiml@gmail.com**.
