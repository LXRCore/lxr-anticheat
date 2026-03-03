--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Anti-Cheat System — Configuration
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

    Version: 2.0.0
    Framework Support:
    - LXR Core  (Primary)
    - RSG Core  (Primary)
    - VORP Core (Supported / Legacy)
    - Standalone (Fallback)

    ═══════════════════════════════════════════════════════════════════════════════

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-anticheat"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[

        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════

        Expected: %s
        Got:      %s

        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.

        🐺 wolves.land — The Land of Wolves

        ═══════════════════════════════════════════════════════════════════════════════

    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name      = 'The Land of Wolves 🐺',
    developer = 'iBoss21 / The Lux Empire',
    website   = 'https://www.wolves.land',
    discord   = 'https://discord.gg/CrKcWdfd3A',
    github    = 'https://github.com/iBoss21',
    store     = 'https://theluxempire.tebex.io',
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core  (Primary)
    2. RSG-Core  (Primary)
    3. VORP Core (Supported / Legacy)
    4. Standalone (Fallback)

    Set to 'auto' to detect automatically, or manually specify:
    'lxr-core' | 'rsg-core' | 'vorp' | 'standalone'
]]
Config.Framework = 'auto'

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DISCORD WEBHOOK ███████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Discord = {
    active = false,
    webhookavatar = "https://cdn2.iconfinder.com/data/icons/frosted-glass/256/Danger.png",
    webhookname = "Anti Cheat",
    webhook = "",
    lang = {
        kick = "Kicked for: "
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DATABASE ROLE CHECK ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- This is a Role DB check. Alerts if a role has changed. (VORP specific — disable if not using VORP)
Config.DB = {
    active = true,
    adminpingrate = 50000,
    rolechecks = {
        "admin", "mod"
    },
    lang = {
        discord = {
            title = "DB Group Change",
            description = "Players group has been changed to admin!",
            playername = "Player name",
            steam = "Steam identifier",
            character = "Character identifier"
        }
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ XSS PROTECTION ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.XSS = {
    active = true,
    lang = {
        reason = "XSS Injection Attempt Detected",
        update = "Validating Steam Username",
        kick = "You cant join due to your username"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SPEED HACK DETECTION ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Speed = {
    active = true,
    lang = {
        reason = "Speed Hacking"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ RESOURCE INJECTION ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ResourceInject = {
    active = true,
    lang = {
        reason = "Cheat Menu Detected"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ NETWORK HEARTBEAT ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Net = {
    active = true,
    allowedoffenses = 2,
    checkinrate = 5000, -- Milliseconds
    kickrate = 20000,
    lang = {
        kickreason = "You must be connected to the internet."
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ AFK DETECTION ██████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.AFK = {
    active = true,
    kicktime = 1800, -- Seconds
    warntime = 1500, -- Seconds
    lang = {
        kick = "You will be kicked in ",
        kick2 = " for AFK",
        hours = " hours",
        minutes = " minutes",
        seconds = " seconds",
        kickreason = "AFK",
        whitelist = {
            id = "You must include a user id",
            wladded = "User Added to Whitelist",
            wlremoved = "User Removed from Whitelist",
            err = "An Error has Occurred"
        }
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SPAM CLICK DETECTION ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.SpamClick = {
    active = true,
    infractions = 0,
    maxspaminfractions = 5,
    spamsensitivity = 250, -- Higher is less sensitive
    lang = {
        kickreason = "Spam Clicking",
        warning = "You are spam clicking! This will lead to being kicked."
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ RESOURCE STOP DETECTION ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.KickOnResourceStop = {
    active = true,
    lang = {
        kickreason = "Stop Resource Detected",
        warning = "Stopping resources is not allowed"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ ANTI SPAWN OBJECT █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Objects = {
    active = false,

    --- Add more objects
    --- Example: [GetHashKey("p_benchnbx02x")],
    --- You can view the objects here https://redlookup.com/objects
    blacklist = {}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ INFINITE AMMO PROTECTION ██████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- A check to ensure no one is using Infinite ammo
Config.InfiniteAmmo = {
    active = true
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ WEAPON BLACKLIST ███████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Weapons = {
    active = false,

    --- Add more weapons
    --- Example: [GetHashKey("weapon_revolver_navy")],
    --- You can view the weapons here https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
    blacklistlist = {}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ PLAYER STATUS / HEALTH HACK ████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.PlayerStatus = {
    active = true,
    health = 600,       -- Default Value (2088 = Golden Core Health)
    lang = {
        kickreason = "Player health hack detected"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ PARTICLE FX LIMITER ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.FX = {
    active = false,
    limit = 5, -- Default Value (5)
    fxWhitelist = {
        -- "EXAMPLE",
        -- Add other fx event names here
    },
    lang = {
        kickreason = 'Player %s caused event %s too many times with data %s'
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BLACKLISTED COMMANDS ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Commands = {
    active = true,
    list = {
        "lynx",
        "test:exp",
        "get:playerid",
        "test",
        "bomb",
        "test:aimbot",
        "kms"
    },
    lang = {
        kickreason = "Cheat command detected"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BLACKLISTED KEYS ███████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Keys = {
    active = true,
    list = {
        {{47, 21}, "Shift + G Keys"},
        {{0x4AF4D473}, "Cheat Menu"} -- Delete key
    },
    lang = {
        kickreason = "Cheat Menu detected"
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ TEXTURE DETECTION ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Textures = {
    active = false,
    list = {},
    lang = {
        kickreason = "Cheat texture detected"
    }
}
