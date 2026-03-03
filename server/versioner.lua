--[[
    🐺 LXR Anti-Cheat — Version Checker
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

Versioner = {}

Versioner.checkRelease = function(resourcename, repo)
    repo = repo:gsub("https://github.com/", "")

    local current = {
        version = GetResourceMetadata(resourcename, 'version')
    }
    PerformHttpRequest('https://api.github.com/repos/' .. repo .. '/releases/latest', function(err, text, headers)
        if not text then return end
        local ok, response = pcall(json.decode, text)
        if not ok or not response then return end

        local latest = {
            url     = response.html_url or '',
            body    = response.body or '',
            version = response.tag_name or '0.0.0'
        }
        local uptodate = false
        local overdate = false

        if current.version > latest.version then
            overdate = true
        elseif current.version < latest.version then
            uptodate = false
        else
            uptodate = true
        end

        if uptodate then
            print('^2[LXR-AC] ✅ Up to Date! (Current Version ' .. current.version .. ')^0')
        elseif overdate then
            print('^3[LXR-AC] ⚠️  Unsupported build! (Version ' .. current.version .. ')^0')
            print('^4[LXR-AC] Latest Version ^2(' .. latest.version .. ') ^3<' .. latest.url .. '>^0')
        else
            print('^1[LXR-AC] ❌ Outdated! (Version ' .. current.version .. ')^0')
            print('^4[LXR-AC] New Version ^2(' .. latest.version .. ') ^3<' .. latest.url .. '>^0')
            print('^4[LXR-AC] Changelog —^0\r\n' .. latest.body)
        end
    end, 'GET', '', { ['Content-Type'] = 'application/json' })
end

Versioner.checkRelease(GetCurrentResourceName(), 'https://github.com/LXRCore/lxr-anticheat')

exports('versioner', function()
    return Versioner
end)