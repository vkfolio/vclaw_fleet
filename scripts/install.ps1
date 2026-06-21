# VClaw one-line installer for Windows (PowerShell).
#   irm https://get.vclaw.ai/install.ps1 | iex
#
# Downloads a single, closed-source VClaw binary (no source code ships), installs it to your user
# profile, puts it on PATH, and brings the node up (background + autostart at login).
$ErrorActionPreference = "Stop"
function Say($m) { Write-Host "> $m" -ForegroundColor Magenta }

# Where the prebuilt binary lives. Override with $env:VCLAW_BASE_URL to use your own host (e.g. an
# R2 bucket behind https://get.vclaw.ai). Default: the latest GitHub release asset.
$base  = if ($env:VCLAW_BASE_URL) { $env:VCLAW_BASE_URL } else { "https://github.com/vkfolio/vclaw_fleet/releases/latest/download" }
$asset = "vclaw-windows-x64.exe"
$dir   = Join-Path $env:LOCALAPPDATA "VClaw"
$exe   = Join-Path $dir "vclaw.exe"

# 1. Download the binary.
Say "Downloading VClaw…"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$tmp = "$exe.download"
Invoke-WebRequest -Uri "$base/$asset" -OutFile $tmp -UseBasicParsing
Move-Item -Force $tmp $exe

# 2. Put it on PATH for this user (so `vclaw` works in new shells).
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$dir*") {
  [Environment]::SetEnvironmentVariable("Path", "$dir;$userPath", "User")
}
$env:Path = "$dir;$env:Path"

# 3. Bring the node up (creates an owner on first run and prints the admin URL).
Say "Starting VClaw…"
& $exe up

Write-Host ""
Write-Host "VClaw is installed and running." -ForegroundColor Green
Write-Host "  - Open the admin panel URL printed above to pair a device."
Write-Host "  - Manage it with:  vclaw status | vclaw down | vclaw up | vclaw uninstall"
Write-Host "  - For other devices on your network:  vclaw down; vclaw up --lan"
