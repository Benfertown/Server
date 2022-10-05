QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ss-boombox:addSong")
AddEventHandler("ss-boombox:addSong", function(data)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local identifier = xPlayer.PlayerData.citizenid
    MySQL.update('INSERT INTO `ss-boombox` (owner,songname,author,imageurl,songurl) VALUES (@owner, @songname, @author, @imageurl, @songurl)'
        , {
        ['@owner'] = identifier,
        ['@songname'] = data.name,
        ['@author'] = data.author,
        ['@imageurl'] = data.image,
        ['@songurl'] = data.url
    })
end)

RegisterNetEvent("ss-boombox:delSong")
AddEventHandler("ss-boombox:delSong", function(data)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local identifier = xPlayer.PlayerData.citizenid
    MySQL.update('DELETE FROM `ss-boombox` WHERE owner = @owner and songurl= @songurl'
        , {
        ['@owner'] = identifier,
        ['@songurl'] = data.url
    })
end)

QBCore.Functions.CreateCallback('ss-redeem:getusersongs', function(source, cb)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local identifier = xPlayer.PlayerData.citizenid
    MySQL.query('SELECT * FROM `ss-boombox` WHERE owner= @owner', { ['@owner'] = identifier }, function(result)
        if result then
            cb(result)
        end
    end)
end)
