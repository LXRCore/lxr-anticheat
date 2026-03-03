--[[
    🐺 LXR Anti-Cheat — Speed Hack Detection (Client)
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

if Config.Speed.active then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(30000)
			TriggerServerEvent("ac:spdr")
		end
	end)
end