-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(447.97, -973.38, 30.69),
    },
    ['ambulance'] = {
        vector3(304.94, -598.48, 43.29),
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(900.51, -172.34, 74.08),
    },
    ['cardealer'] = {
        vector3(-1249.74, -345.3, 37.33),
    },
    ['mechanic'] = {
        vector3(985.6, -144.63, 74.27),
    },
    ['burgershot'] = {
        vector3(-1198.56, -902.41, 14.0)
    },
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(447.97, -973.38, 30.69), length = 0.35, width = 0.45, heading = 351.0, minZ = 30.58, maxZ = 31.20 } ,
    },
    ['ambulance'] = {
        { coords = vector3(304.94, -598.48, 43.29), length = 1.2, width = 0.6, heading = 341.0, minZ = 42.90, maxZ = 43.73 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(900.51, -172.34, 74.08), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-1249.74, -345.3, 37.33), length = 2.4, width = 1.05, heading = 340.0, minZ = 37.07, maxZ = 37.67 },
    },
    ['mechanic'] = {
        { coords = vector3(985.6, -144.63, 74.27), length = 1.15, width = 2.6, heading = 353.0, minZ = 74.0, maxZ = 75 },
    },
    ['burgershot'] = {
        { coords = vector3(-1198.56, -902.41, 14.0), length = 1.15, width = 2.6, heading = 353.0, minZ = 13.80, maxZ = 14.20 },
    
    },
}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(975.71, -98.42, 74.87),
    },
    ['ballas'] = {
        vector3(0,0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    ['lostmc'] = {
        { coords = vector3(975.71, -98.42, 74.87), length = 1.15, width = 2.6, heading = 353.0, minZ = 74.80, maxZ = 75.20 },
    
    },
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
