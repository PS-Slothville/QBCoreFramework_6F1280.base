local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("jay-bennys:server:repair", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local bank = Player.Functions.GetMoney("bank")
    local cash = Player.Functions.GetMoney("cash")
    if Config.Pay then
        if bank >= Config.Price then
            if Player.Functions.RemoveMoney("bank", Config.Price, "bennys") then
                TriggerClientEvent("jay-bennys:client:repair", source)
            end
        elseif cash >= Config.Price then
            if Player.Functions.RemoveMoney("cash", Config.Price) then
                TriggerClientEvent("jay-bennys:client:repair", source)
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have enough money", "error")
        end
    else
        TriggerClientEvent("jay-bennys:client:repair", source)
    end
end)