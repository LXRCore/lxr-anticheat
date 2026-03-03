--[[
    🐺 LXR Anti-Cheat — Network Heartbeat (Client)
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

RegisterNetEvent('heartbeat:Client')
AddEventHandler('heartbeat:Client', function()
	TriggerServerEvent('heartbeat:Server')
end)