Config = {}

local vehicle_pool = {
    `thrax`, `zentorno`, `vacca`, `tempesta2`, `lp700`,
    `db11`, `c7`, `911r`, `urus`, `t20`
}

local vehicle_pool_strings = {
    "thrax", "zentorno", "vacca", "tempesta2", "lp700",
    "db11", "c7", "911r", "urus", "t20",

    -- electric cars
    "teslax", "tr22", "terzo",

    -- whatever
    "2013rs7", "rs5", "Speedster", "monza", "avj", "z32",
    "lpi8004", "lp770", "lp610", "laferrari", "458it",
    "lp670sv",
}

local num = math.random( # vehicle_pool )
local chosenVehicle = vehicle_pool_strings[num]

Config.WheelModel = `vw_prop_vw_luckywheel_02a`
Config.Vehicle = vehicle_pool[num]
Config.VehicleName = chosenVehicle                        -- Model name for vehicle to win/on display
Config.Amount = 100                                       -- Amount of chips needed to spin wheel
Config.WheelPos = vector3(949.6968, 45.06157, 70.9)       -- Position for wheel
Config.VehPos = vector4(935.11, 42.61, 71.525, 0.0)       -- Position for vehicle
Config.UseThirdEyeInteraction = false
Config.GiveCarOnWin = true

-- CASINO_DIA_PL    - Falling Diamonds
-- CASINO_HLW_PL    - Falling Skulls
-- CASINO_SNWFLK_PL - Falling Snowflakes
Config.VideoType = 'CASINO_DIA_PL'