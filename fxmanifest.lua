--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Anti-Cheat System
    Advanced multi-framework protection for RedM servers.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    GitHub:      https://github.com/iBoss21
    Store:       https://theluxempire.tebex.io

    ═══════════════════════════════════════════════════════════════════════════════

    Framework Support:
    - LXR Core  (Primary)
    - RSG Core  (Primary)
    - VORP Core (Supported / Legacy)
    - Standalone (Fallback)

    ═══════════════════════════════════════════════════════════════════════════════

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

fx_version 'cerulean'
game       'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name        'lxr-anticheat'
author      'iBoss21 / The Lux Empire'
description '🐺 LXR Anti-Cheat System — Advanced multi-framework protection for RedM servers | wolves.land'
version     '2.0.0'

lua54 'yes'

client_scripts {
    'client/client.lua',
    'client/injectors.lua',
    'client/mouse.lua',
    'client/net.lua',
    'client/afk.lua',
    'client/speed.lua',
    'client/online.lua',
    'client/resourcestop.lua',
    'client/commands.lua',
    'client/keys.lua',
    'client/texture.lua',
    'client/object.lua',
    'client/player.lua',
    'client/weapon.lua'
}

server_scripts {
    'server/server.lua',
    'server/discord.lua',
    'server/net.lua',
    'server/xss.lua',
    'server/db.lua',
    'server/injectors.lua',
    'server/versioner.lua',
    'server/afk.lua',
    'server/speed.lua',
    'server/online.lua',
    'server/antifx.lua'
}

shared_scripts {
    'config.lua',
    'shared/api/strings.lua'
}
