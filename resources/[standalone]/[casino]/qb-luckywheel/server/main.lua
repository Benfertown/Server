local QBCore = exports['qb-core']:GetCoreObject()
local isRoll = false
local car = false

local cooldowns = {}
local canSpin = false

local weaponsPool = {
    'weapon_assaultrifle', 'weapon_combatshotgun', 'weapon_assaultsmg', 'weapon_mg',
    'weapon_heavysniper', 'weapon_advancedrifle', 'weapon_assaultshotgun', 'weapon_revolver',
}

local ammoPool = {
    'pistol_ammo', 'rifle_ammo', 'smg_ammo',
    'shotgun_ammo', 'mg_ammo', 'snp_ammo'
}

QBCore.Functions.CreateCallback('qb-luckywheel:CheckCanSpin', function(source, cb)
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local chips = xPlayer.Functions.GetItemByName('casino_whitechip')

    local checkTime

    if(cooldowns[xPlayer.PlayerData.citizenid]) == nil then
        checkTime = 3600
    else
        checkTime = (os.time() - cooldowns[xPlayer.PlayerData.citizenid])
    end

    if checkTime >= 3600 then
        if chips and chips.amount >= Config.Amount and isRoll == false then
            cb(0) -- player can spin
        else
            cb(1) -- player cannot afford to spin
        end
    else
        cb(2) -- player has spun too recently
    end

end)

RegisterNetEvent('qb-luckywheel:server:getLucky', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)

    cooldowns[xPlayer.PlayerData.citizenid] = os.time()

    if not isRoll then
        if xPlayer then
            local chips = xPlayer.Functions.GetItemByName('casino_whitechip')
            if chips and chips.amount >= Config.Amount then
                xPlayer.Functions.RemoveItem('casino_whitechip', Config.Amount)
                isRoll = true

                local _randomPrice = math.random(1, 100)
                if _randomPrice == 1 then
                    _priceIndex = 19
                    -- idk what the previous dev was doing here but it's like they programmed the player to be able to win the car, but then never wanted them to ever get it
                    -- -- Win car
                    -- local _subRan = math.random(1,1000)
                    -- if _subRan <= 1 then
                    --     _priceIndex = 19
                    -- else
                    --     _priceIndex = 3
                    -- end
                elseif _randomPrice > 1 and _randomPrice <= 6 then
                    -- Win skin AK Gold
                    _priceIndex = 12
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _priceIndex = 12
                    else
                        _priceIndex = 7
                    end
                elseif _randomPrice > 6 and _randomPrice <= 15 then
                    -- Hacker stuff
                    -- 4, 8, 11, 16
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _priceIndex = 4
                    elseif _sRan == 2 then
                        _priceIndex = 8
                    elseif _sRan == 3 then
                        _priceIndex = 11
                    else
                        _priceIndex = 16
                    end
                elseif _randomPrice > 15 and _randomPrice <= 25 then
                    -- Win 300,000$
                    local _subRan = math.random(1,20)
                    if _subRan <= 2 then
                        _priceIndex = 5
                    else
                        _priceIndex = 20
                    end
                elseif _randomPrice > 25 and _randomPrice <= 40 then
                    -- 1, 9, 13, 17
                    local _sRan = math.random(1, 4)
                    if _sRan == 1 then
                        _priceIndex = 1
                    elseif _sRan == 2 then
                        _priceIndex = 9
                    elseif _sRan == 3 then
                        _priceIndex = 13
                    else
                        _priceIndex = 17
                    end
                elseif _randomPrice > 40 and _randomPrice <= 60 then
                    local _itemList = {}
                    _itemList[1] = 2
                    _itemList[2] = 6
                    _itemList[3] = 10
                    _itemList[4] = 14
                    _itemList[5] = 18
                    _priceIndex = _itemList[math.random(1, 5)]
                elseif _randomPrice > 60 and _randomPrice <= 100 then
                    local _itemList = {}
                    _itemList[1] = 3
                    _itemList[2] = 7
                    _itemList[3] = 15
                    _itemList[4] = 20
                    _priceIndex = _itemList[math.random(1, 4)]
                end

                SetTimeout(6000, function()
                    isRoll = false
                    -- Give Price
                    if _priceIndex == 1 or _priceIndex == 9 or _priceIndex == 13 or _priceIndex == 17 then
                        xPlayer.Functions.AddItem('casino_whitechip', 25000)
                        TriggerClientEvent('QBCore:Notify', source, 'You Won 25,000 Casino Chips!', 'success')
                    
                    elseif _priceIndex == 2 or _priceIndex == 6 or _priceIndex == 10 or _priceIndex == 14 or _priceIndex == 18 then
                        xPlayer.Functions.AddItem('sandwich', 5)
                        xPlayer.Functions.AddItem('water_bottle', 5)
                        TriggerClientEvent('QBCore:Notify', source, 'You Won....Sandwich and Water?', 'success')
                    
                    elseif _priceIndex == 3 or _priceIndex == 7 or _priceIndex == 15 then
                        local _money = 0
                        if _priceIndex == 3 then
                            _money = 5000
                        elseif _priceIndex == 7 then
                            _money = 10000
                        elseif _priceIndex == 15 then
                            _money = 20000
                        end
                        xPlayer.Functions.AddMoney('cash', _money)
                        TriggerClientEvent('QBCore:Notify', source, 'You Won $'.._money..'!', 'success')
                    
                    elseif _priceIndex == 20 then
                        local ammo = ammoPool[math.random( # ammoPool)]
                        xPlayer.Functions.AddItem(ammo, 20)
                        TriggerClientEvent('QBCore:Notify', source, 'You Won Ammunition!', 'success')
                    
                    elseif _priceIndex == 4 or _priceIndex == 8 or _priceIndex == 11 or _priceIndex == 16 then
                        local amount = 0
                        if _priceIndex == 4 then
                            amount = 1
                        elseif _priceIndex == 8 then
                            amount = 2
                        elseif _priceIndex == 11 then
                            amount = 3
                        elseif _priceIndex == 16 then
                            amount = 4
                        end
                        xPlayer.Functions.AddItem('trojan_usb', amount)
                        xPlayer.Functions.AddItem('electronickit', amount)
                        TriggerClientEvent('QBCore:Notify', source, 'You Won WATCH_DOGS Starter kit!', 'success')
                    
                    elseif _priceIndex == 5 then
                        xPlayer.Functions.AddMoney('cash', 300000)
                        TriggerClientEvent('QBCore:Notify', source, 'You Won $300,000 Cash!', 'success')
                    
                    elseif _priceIndex == 12 then
                        local weapon = weaponsPool[math.random( # weaponsPool )]
                        xPlayer.Functions.AddItem(weapon, 1)
                        TriggerClientEvent('QBCore:Notify', source, 'Whoa, a gun!', 'success')
                    
                    elseif _priceIndex == 19 then
                        if Config.GiveCarOnWin then 
                            TriggerClientEvent('qb-luckywheel:client:winCar', source)
                            car = true
                        else
                            TriggerClientEvent('qb-luckywheel:client:winCarEmail', source)
                        end
                    end
                    TriggerClientEvent('qb-luckywheel:client:rollFinished', -1)
                end)
                TriggerClientEvent('qb-luckywheel:client:doRoll', -1, _priceIndex)
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Need '..Config.Amount..' White Chips To Spin!', 'error')
            end
        end
    end
end)

RegisterNetEvent('qb-luckywheel:server:carRedeem', function(vehicleProps)
    local source = source

    local xPlayer = QBCore.Functions.GetPlayer(source)
    
    -- local plate = 'CSNO'
    -- local getPlate = true
    -- local plateAvailable = ''
    -- while getPlate do
    --     Citizen.Wait(0)
    --     local plateNumbers = math.random(1000,9999)
    --     local testplate = plate..plateNumbers
    --     local result = exports.oxmysql:scalarSync('SELECT * from player_vehicles WHERE plate = ?', {plate})
    --         if result[1] == nil then
    --             plateAvailable = 'not_available'
    --         else
    --             plateAvailable = result[1]
    --     if plateAvailable == 'not_available' then
    --         vehicleProps.plate = testplate
    --         getPlate = false
    --     end
    -- end
    local vehiclePropsjson = json.encode(vehicleProps)
    if car then
        car = false 
        TriggerClientEvent('QBCore:Notify', source, 'You won a car!', 'success')
        TriggerClientEvent('qb-luckywheel:client:winCarEmail', source)
        -- MySQL.insert(
        --     'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        --         xPlayer.PlayerData.license,
        --         xPlayer.PlayerData.citizenid, 
        --         Config.VehicleName,
        --         GetHashKey(Config.Vehicle),
        --         vehiclePropsjson,
        --         tostring(math.random(1000,9999)),
        --         'motelgarage',
        --         0
        -- })
        exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            xPlayer.PlayerData.license,
            xPlayer.PlayerData.citizenid,
            Config.VehicleName,
            GetHashKey(Config.Vehicle),
            -- `Config.Vehicle`,
            vehiclePropsjson,
            -- vehicleProps.plate,
            tostring(math.random(1000,9999)),
            'motelgarage',
            1
        })
    else
        --can ban here, would be a modder triggering event to get a free car
    end
end)
