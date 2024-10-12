# LXRCore Anti-Cheat System

## Overview
The **LXRCore Anti-Cheat System** is a highly flexible anti-cheat solution designed to protect your RedM and FiveM servers from common exploits and cheats. This script works seamlessly with **LXRCore**, **QBRCore**, and **RSGCore**, and can easily be extended to other frameworks. It offers configurable protection layers, including:
- Speed hack detection
- Cheat menu injection prevention
- XSS injection detection
- AFK management and kick features
- Blacklisted commands and keys
- Discord integration for admin notifications

## Framework Support
- **LXRCore** (Primary framework)
- **QBRCore**
- **RSGCore**
- Optional placeholders for other frameworks

## Features
- **Speed Hack Detection:** Automatically detects and handles speed hacks.
- **Resource Injection Prevention:** Prevents unauthorized resource injection or cheat menus from running.
- **AFK Detection:** Kicks players for being AFK based on configurable thresholds.
- **XSS Injection Detection:** Detects and kicks players trying to use malicious scripts through XSS injections.
- **Command Blacklist:** Configure blacklisted commands to prevent the use of cheat commands.
- **Key Blacklist:** Prevents specific key combinations often used to open cheat menus.
- **Discord Integration:** Optionally send alerts to a Discord server when certain exploits are detected.

## Installation

### Step 1: Download the Script
Download the script from the provided link.

### Step 2: Upload to Your Server
1. Upload the script folder to your server's `resources` directory.
2. Rename the folder to `lxrv2-anticheat`.

### Step 3: Modify the `fxmanifest.lua`
Ensure the `fxmanifest.lua` includes support for your framework of choice:
```lua
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'

-- Framework detection logic
if IsDuplicityVersion() then
    framework = 'server'
else
    framework = 'client'
end

if framework == 'client' then
    -- Default to LXRCore, but check if QBRCore or RSGCore should be used
    if GetResourceState('qbr-core') == 'started' then
        Framework = 'qbr-core'
    elseif GetResourceState('lxr-core') == 'started' then
        Framework = 'lxr-core'
    elseif GetResourceState('rsg-core') == 'started' then
        Framework = 'rsg-core'
    else
        -- Optional placeholder for other frameworks
        Framework = 'other_framework'
    end
end
