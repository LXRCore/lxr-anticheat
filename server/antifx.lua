--[[
    🐺 LXR Anti-Cheat — Anti Particle FX
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

if Config.FX.active then
    local fxCounts = {}

    local function isInTable(tbl, value)
        for _, v in ipairs(tbl) do
            if v == value then
                return true
            end
        end
        return false
    end

    local function tableToString(tbl)
        local result = "{"
        for k, v in pairs(tbl) do
            if type(v) == "table" then
                v = tableToString(v)
            else
                v = tostring(v)
            end
            result = result .. string.format("[%s] = %s, ", tostring(k), v)
        end
        if result ~= "{" then
            result = result:sub(1, -3)
        end
        return result .. "}"
    end

    AddEventHandler('ptFxEvent', function(sender, eventName, eventData)
        local eventDataString = (type(eventData) == "table") and tableToString(eventData) or tostring(eventData)

        if not isInTable(Config.FX.fxWhitelist, eventName) then
            fxCounts[sender] = (fxCounts[sender] or 0) + 1

            if fxCounts[sender] > Config.FX.limit then
                CancelEvent()
                DropPlayer(sender, string.format(Config.FX.lang.kickreason, sender, eventName, eventDataString))
            end
        end
    end)
end