QBCore = exports['qb-core']:GetCoreObject()
local isDone = false
local HurricaneToggle = 0


RegisterNetEvent("OD:Weather:server:randomLeftRight", function()
    if not isDone then
        isDone = true
        CreateThread(function()
            Wait(60000)
            isDone = false
        end)
        local toggle = "right"
        if math.random(1,2) == 2 then
            toggle = "left"
        end

        TriggerClientEvent("OD:Weather:randomLeftRight", toggle)
    end
end)

QBCore.Commands.Add(Config.Command, "Enable Hurricane Weather", {}, false, function(source)
        TriggerClientEvent('toggleHurricane', -1, HurricaneToggle)
end, 'admin')

RegisterNetEvent('OD:Weather:HurricaneToggle', function ()
    local Command = "Weather Thunder"
    ExecuteCommand(Command)
    Wait(3400)
    TriggerClientEvent('toggleHurricane', -1, HurricaneToggle)
    Wait(3400)
end)

QBCore.Commands.Add('StartThunderAndHurricane', "Enable Hurricane Weather", {}, false, function(source)
    TriggerEvent('OD:Weather:HurricaneToggle')
end, 'admin')


