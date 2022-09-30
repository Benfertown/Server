local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-burgershot:bill:player")
AddEventHandler("qb-burgershot:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'burgershot' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBurger', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local lettuce = Player.Functions.GetItemByName("burger-lettuce")
    local meat = Player.Functions.GetItemByName("burger-meat")
    local bun = Player.Functions.GetItemByName("burger-bun")
    local tomato = Player.Functions.GetItemByName("burger-tomato")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientTorpedo', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    if meat ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMeatfree', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMurderMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local heartstopper = Ply.Functions.GetItemByName("burger-heartstopper")
    local software = Ply.Functions.GetItemByName("burger-softdrink")
    if fries ~= nil and heartstopper ~= nil and software ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-burgershot:server:cookPatty', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-raw', 1)
    xPlayer.Functions.AddItem('burger-meat', 1)
end)

RegisterNetEvent('qb-burgershot:server:cookFries', function() 
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-potato', 1)
    xPlayer.Functions.AddItem('burger-fries', 4)
end)

RegisterNetEvent('qb-burgershot:server:makeMeal-moneyshot', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-meat', 2)
    xPlayer.Functions.RemoveItem('burger-lettuce', 1)
    xPlayer.Functions.RemoveItem('burger-tomato', 1)
    xPlayer.Functions.RemoveItem('burger-bun', 1)
    xPlayer.Functions.AddItem('burger-moneyshot', 1)
end)

RegisterNetEvent('qb-burgershot:server:makeMeal-meatfree', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-lettuce', 1)
    xPlayer.Functions.RemoveItem('burger-tomato', 1)
    xPlayer.Functions.RemoveItem('burger-bun', 1)
    xPlayer.Functions.AddItem('burger-meatfree', 1)
end)

RegisterNetEvent('qb-burgershot:server:makeMeal-bleeder', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-meat', 1)
    xPlayer.Functions.RemoveItem('burger-lettuce', 1)
    xPlayer.Functions.RemoveItem('burger-tomato', 1)
    xPlayer.Functions.RemoveItem('burger-bun', 1)
    xPlayer.Functions.AddItem('burger-bleeder', 1)
end)

RegisterNetEvent('qb-burgershot:server:makeMeal-heartstopper', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-meat', 10)
    xPlayer.Functions.RemoveItem('burger-lettuce', 1)
    xPlayer.Functions.RemoveItem('burger-tomato', 1)
    xPlayer.Functions.RemoveItem('burger-bun', 1)
    xPlayer.Functions.AddItem('burger-heartstopper', 1)
end)

RegisterNetEvent('qb-burgershot:server:makeMeal-torpedo', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-meat', 1)
    xPlayer.Functions.RemoveItem('burger-bun', 1)
    xPlayer.Functions.AddItem('burger-torpedo', 1)
end)

RegisterNetEvent('qb-burgershot:server:makeMeal-murder', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-heartstopper', 1)
    xPlayer.Functions.RemoveItem('burger-fries', 1)
    xPlayer.Functions.RemoveItem('burger-softdrink', 1)
    xPlayer.Functions.AddItem('burger-murdermeal', 1)
end)

RegisterNetEvent('qb-burgershot:server:makeSoftDrink', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-sodasyrup', 1)
    xPlayer.Functions.AddItem('burger-softdrink', 4)
end)

RegisterNetEvent('qb-burgershot:server:makeMilkshake', function()
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end

    xPlayer.Functions.RemoveItem('burger-mshakeformula', 1)
    xPlayer.Functions.AddItem('burger-mshake', 2)
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:CheckPatties', function(source, cb)
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local patties = xPlayer.Functions.GetItemByName('burger-meat')

    if patties then
        cb(patties.amount)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:openMealBox', function(source, cb)
    local source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)

    xPlayer.Functions.AddItem('burger-heartstopper')
    xPlayer.Functions.AddItem('burger-fries')
    xPlayer.Functions.AddItem('burger-softdrink')

    local getToy = math.random(1, 10)

    if getToy > 4 then
        cb(false)
    else
        local toy = math.random(1, 2)
        if toy == 1 then
            xPlayer.Functions.AddItem('burger-toy1')
        else
            xPlayer.Functions.AddItem('burger-toy2')
        end
        cb(true)
    end
end)