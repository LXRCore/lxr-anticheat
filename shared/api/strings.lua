--[[
    🐺 LXR Anti-Cheat — Shared String Utilities
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

exports('strings', function()
    local self = {}

    self.xss = function (str) 
        local cname = str:gsub("%s+", "")

        if string.find(cname, "<" or ">") then
            return true
        else
            return false
        end
    end

    return self
end)