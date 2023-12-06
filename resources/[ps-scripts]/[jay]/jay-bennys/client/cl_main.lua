local QBCore = exports['qb-core']:GetCoreObject()
local inBennys = false
local menuBennyRepair = nil

RegisterNetEvent("jay-bennys:client:repair", function()
    SendNUIMessage({sound = "wrench", volume = 1.0})
    QBCore.Functions.Progressbar("repair_car", "Repairing Vehicle...", Config.RepairTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local plyPed = PlayerPedId()
        local plyVeh = GetVehiclePedIsIn(plyPed, false)
        local getFuel = GetVehicleFuelLevel(plyVeh)

        SetVehicleFixed(plyVeh)
        SetVehicleDirtLevel(plyVeh, 0.0)
        SetVehiclePetrolTankHealth(plyVeh, 4000.0)
        SetVehicleFuelLevel(plyVeh, getFuel)

        for i = 0,5 do SetVehicleTyreFixed(plyVeh, i) end
    end)
end)


function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end
CreateThread(function()
    for k, v in pairs(Config.RepairZones) do
        exports["ps-zones"]:CreateBoxZone("repair_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    local ped = PlayerPedId()
    if string.starts(ZoneName, "repair_") then
        inBennys = true
        local vehicle = GetVehiclePedIsIn(ped)
        if vehicle then 
            if not menuBennyRepair then
                menuBennyRepair = exports['qb-radialmenu']:AddOption({
                    id = 'customs',
                    title = 'Bennys Repair',
                    icon = 'wrench',
                    type = 'server',
                    event = 'jay-bennys:server:repair',
                    shouldClose = true
                })
            end
        end
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "repair_") then
        inBennys = false
        if menuBennyRepair then
            exports['qb-radialmenu']:RemoveOption(menuBennyRepair)
            menuBennyRepair = nil
        end
    end
end)

RegisterNetEvent('baseevents:enteredVehicle', function(vehicle, CurrentSeat, name, class, model)
    print(CurrentSeat)
    if CurrentSeat == -1 then 
        if inBennys then 
            if not menuBennyRepair then
                menuBennyRepair = exports['qb-radialmenu']:AddOption({
                    id = 'customs',
                    title = 'Bennys Repair',
                    icon = 'wrench',
                    type = 'server',
                    event = 'jay-bennys:server:repair',
                    shouldClose = true
                })
            end
        end
    end
end)

RegisterNetEvent('baseevents:leftVehicle', function(PreviousVehicle, PreviousSeat, name, class, model)
    if inBennys then 
        if menuBennyRepair then
            exports['qb-radialmenu']:RemoveOption(menuBennyRepair)
            menuBennyRepair = nil
        end
    end
end)
