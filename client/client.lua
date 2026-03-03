--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Anti-Cheat — Client Entry Point
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 FRAMEWORK BRIDGE — LXR-Core | RSG-Core | VORP Core
-- ═══════════════════════════════════════════════════════════════════════════════

local ACFramework = nil
local ACFrameworkName = 'standalone'

-- Global compatibility shim — used by afk.lua and mouse.lua
VORPcore = {
    NotifyCenter = function(msg, duration)
        -- Overridden below once the framework is detected
        print('^3[LXR-AC]^0 ' .. tostring(msg))
    end
}

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
        -- Shim: map VORPcore.NotifyCenter (ms) → LXR-Core Notify (seconds, type 'inform')
        -- LXR-Core/RSG-Core use seconds; VORP uses milliseconds — convert accordingly.
        VORPcore.NotifyCenter = function(msg, duration)
            ACFramework.Functions.Notify(msg, 'inform', math.floor((duration or 4000) / 1000))
        end
        print('^2[LXR-AC]^0 Framework: LXR-Core loaded.')

    elseif detected == 'rsg-core' then
        ACFramework = exports['rsg-core']:GetCoreObject()
        -- Shim: map VORPcore.NotifyCenter (ms) → RSG-Core Notify (seconds, type 'inform')
        VORPcore.NotifyCenter = function(msg, duration)
            ACFramework.Functions.Notify(msg, 'inform', math.floor((duration or 4000) / 1000))
        end
        print('^2[LXR-AC]^0 Framework: RSG-Core loaded.')

    elseif detected == 'vorp' then
        TriggerEvent("getCore", function(core)
            ACFramework = core
            VORPcore = core
            -- VORPcore.NotifyCenter is native on the real core object
            print('^2[LXR-AC]^0 Framework: VORP Core loaded.')
        end)

    else
        print('^3[LXR-AC]^0 Framework: Standalone (no framework detected).')
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 CHARACTER LOAD — start checks on player ready (all frameworks)
-- ═══════════════════════════════════════════════════════════════════════════════

local checksStarted = false

local function onPlayerReady()
    if checksStarted then return end
    checksStarted = true

    if Config.AFK.active then
        startAFKChecks()
    end

    if Config.SpamClick.active then
        startMouseSpamCheck()
    end
end

-- VORP Core
RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    onPlayerReady()
end)

-- LXR-Core
RegisterNetEvent("lxr-core:client:PlayerLoaded")
AddEventHandler("lxr-core:client:PlayerLoaded", function()
    onPlayerReady()
end)

-- RSG-Core
RegisterNetEvent("RSGCore:Client:OnPlayerLoaded")
AddEventHandler("RSGCore:Client:OnPlayerLoaded", function()
    onPlayerReady()
end)