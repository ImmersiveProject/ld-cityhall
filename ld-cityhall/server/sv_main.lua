local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ld-cityhall:setjob', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.SetJob(data.job, data.grade)
    end
end)

RegisterServerEvent('ld-cityhall:giveitem', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if QBCore.Functions.HasItem(src, data.item, 1) then
        QBCore.Functions.Notify(src, 'You already have '..data.label..'!')
    else
        local info = {}
        if data.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif data.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(data.item, 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], 'add')
        Player.Functions.RemoveMoney('cash', data.price)
    end
end)