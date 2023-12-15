local QBCore = exports['qb-core']:GetCoreObject()

-- MAKE BETTER LOL THIS SHIT JAY IS SHIT DEV
QBCore.Functions.CreateUseableItem("anti", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.RemoveItem('anti', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['anti'], "remove")
	TriggerClientEvent('sickness:frisk', source)
end)