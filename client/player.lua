--[[
    🐺 LXR Anti-Cheat — Player Status / Health Hack (Client)
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

if Config.PlayerStatus.active then
    -- Anti Health
    CreateThread(function()
        while true do
            Wait(1)
            local health = GetEntityHealth(PlayerPedId())
            if health > Config.PlayerStatus.health then
                TriggerServerEvent("ac:kick", Config.PlayerStatus.lang.kickreason)
            end
        end
    end)
end
