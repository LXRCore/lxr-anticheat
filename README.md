# 🐺 LXR Anti-Cheat System
**wolves.land — The Land of Wolves**
*Developer: iBoss21 / The Lux Empire | [wolves.land](https://www.wolves.land) | [Store](https://theluxempire.tebex.io)*

---

## Overview
The **LXR Anti-Cheat System** is a production-grade, multi-framework anti-cheat solution designed to protect your RedM server from common exploits and cheats. It works seamlessly with **LXR-Core** (primary), **RSG-Core**, and **VORP Core**, with a standalone fallback. It offers configurable protection layers, including:

- Speed hack detection
- Cheat menu / resource injection prevention
- XSS injection detection
- AFK management and automatic kicks
- Blacklisted commands and key combinations
- Particle FX abuse limiter
- Infinite ammo & health hack protection
- Weapon blacklisting
- Discord webhook integration for admin alerts

## Framework Support
| Framework  | Status              |
|------------|---------------------|
| LXR-Core   | ✅ Primary           |
| RSG-Core   | ✅ Primary           |
| VORP Core  | ✅ Supported/Legacy  |
| Standalone | ✅ Fallback          |

## Features
- **Speed Hack Detection** — Automatically detects and handles speed hacks.
- **Resource Injection Prevention** — Prevents unauthorized resource injection or cheat menus from running.
- **AFK Detection** — Kicks players for being AFK based on configurable thresholds.
- **XSS Injection Detection** — Detects and kicks players attempting XSS injections via username.
- **Command Blacklist** — Configure blacklisted commands to prevent cheat menu commands.
- **Key Blacklist** — Prevents specific key combinations often used to open cheat menus.
- **Particle FX Limiter** — Blocks abusive particle FX event spamming.
- **Health Hack Protection** — Kicks players with abnormal health values.
- **Discord Integration** — Optionally send alerts to a Discord webhook.

## Installation

### Step 1: Download the Resource
Download or clone the resource from [GitHub](https://github.com/LXRCore/lxr-anticheat).

### Step 2: Upload to Your Server
1. Upload the folder to your server's `resources` directory.
2. The folder **must** be named `lxr-anticheat` (the resource name is enforced at runtime).

### Step 3: Add to `server.cfg`
```
ensure lxr-anticheat
```

### Step 4: Configure
Edit `config.lua` to enable/disable modules and configure your Discord webhook, thresholds, and blacklists.

Set `Config.Framework` to `'auto'` (recommended) or manually to `'lxr-core'`, `'rsg-core'`, `'vorp'`, or `'standalone'`.

## fxmanifest.lua
The manifest is pre-configured for RedM (Tebex escrow compliant):
```lua
fx_version 'cerulean'
game       'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name    'lxr-anticheat'
author  'iBoss21 / The Lux Empire'
version '2.0.0'
lua54   'yes'
```

## Support
- **Discord:** https://discord.gg/CrKcWdfd3A
- **Website:** https://www.wolves.land
- **Store:** https://theluxempire.tebex.io

---
*© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved*
