--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Anti-Cheat — Server Entry Point
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 FRAMEWORK BRIDGE — LXR-Core | RSG-Core | VORP Core
-- ═══════════════════════════════════════════════════════════════════════════════

ACFramework     = nil
ACFrameworkName = 'standalone'

-- VorpCore alias kept for backward-compat with server/afk.lua and server/db.lua
VorpCore = {}

Citizen.CreateThread(function()
    local detected = Config.Framework

    if detected == 'auto' then
        if GetResourceState('lxr-core') == 'started' then
            detected = 'lxr-core'
        elseif GetResourceState('rsg-core') == 'started' then
            detected = 'rsg-core'
        elseif GetResourceState('vorp_core') == 'started' then
            detected = 'vorp'
        else
            detected = 'standalone'
        end
    end

    ACFrameworkName = detected

    if detected == 'lxr-core' then
        ACFramework = exports['lxr-core']:GetCoreObject()
        print('^2[LXR-AC]^0 Framework: LXR-Core loaded.')

    elseif detected == 'rsg-core' then
        ACFramework = exports['rsg-core']:GetCoreObject()
        print('^2[LXR-AC]^0 Framework: RSG-Core loaded.')

    elseif detected == 'vorp' then
        TriggerEvent("getCore", function(core)
            ACFramework = core
            VorpCore = core
            print('^2[LXR-AC]^0 Framework: VORP Core loaded.')
        end)

    else
        print('^3[LXR-AC]^0 Framework: Standalone (no framework detected).')
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 KICK HANDLER
-- ═══════════════════════════════════════════════════════════════════════════════

RegisterServerEvent("ac:kick")
AddEventHandler("ac:kick", function(reason)
    local _source = source
    Discord.sendMessage(_source, Config.Discord.lang.kick .. reason)
    DropPlayer(_source, Config.Discord.lang.kick .. reason)
end)