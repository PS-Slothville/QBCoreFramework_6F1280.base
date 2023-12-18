local Current_Gear = 0
local vehicles_Gear = nil
local vehicles_max_gears = 0.0
local originaltopspeed = nil
local hbrake = nil
local CurrentHash = nil
local CachedHash = nil
local Manual = false
local Automatic = true
local readytoshift = false

CreateThread(function()
    while true do
        Wait(5)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped,false)
        CurrentHash = GetEntityModel(vehicle)
        if CurrentHash == CachedHash then
            return
        else
            if CurrentHash == Config.ManualCars then
                Manual = true
            else
                Automatic = true
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1)
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            TriggerEvent('OD-Gears:EnteredVehicle', vehicle)
        end
    end
end)

RegisterNetEvent('OD-Gears:EnteredVehicle', function(vehicle)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        vehicles_max_gears = GetVehicleHandlingFloat(vehicle, "CHandlingData", "nInitialDriveGears")
        vehicles_Gear = GetVehicleCurrentGear(vehicle)
        if vehicle ~= CurrentHash then
            originaltopspeed = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
            hbrake = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce")
        end
    end
end)

RegisterCommand("+shiftup", function()
    ShiftUp()
end, false)

RegisterKeyMapping("+shiftup", "Shift up a gear", "keyboard", "")

RegisterCommand("+shiftdown", function()
    ShiftDown()
end, false)

RegisterKeyMapping("+shiftdown", "Shift down a gear", "keyboard", "")

function ShiftUp()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    CurrentSpeed = GetEntitySpeed(vehicle)
    if Current_Gear < vehicles_max_gears then
        if Current_Gear < vehicles_Gear then
            Current_Gear = Current_Gear + 1
        end
    else
        return
    end
    print("Gears: ".. Current_Gear)
end

function ShiftDown()
    if Current_Gear > 0 then
        Current_Gear = Current_Gear - 1
    else
        return
    end
    print("Gears: ".. Current_Gear)
end

CreateThread(function()
    while true do 
        Wait(1)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        local Vehicle_speed = GetEntitySpeed(vehicle)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if IsControlPressed(0, 76) == false then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
            else
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
            end
            if Current_Gear ~= 0 and Current_Gear ~= 1 and Current_Gear ~= 2 and Vehicle_speed < 10.0 then
                SetVehicleHighGear(vehicle,1)
                ModifyVehicleTopSpeed(vehicle,17)
                SetVehicleEngineOn(vehicle, false, true, true)
            end
            if Current_Gear == 0 and vehicles_Gear == 0 then
                SetVehicleHandbrake(vehicle, true)
                SetVehicleHighGear(vehicle,2)
            elseif Current_Gear == 1 and vehicles_max_gears > 1 and vehicles_Gear == 1 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed/6.4)
                ModifyVehicleTopSpeed(vehicle,30)
                SetVehicleHighGear(vehicle,3)
            elseif Current_Gear == 2 and vehicles_max_gears > 2 and vehicles_Gear == 2 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed/6.4)
                ModifyVehicleTopSpeed(vehicle,30)
                SetVehicleHighGear(vehicle,3)
            elseif Current_Gear == 3 and vehicles_max_gears > 3 and vehicles_Gear == 3 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed/6.7)
                ModifyVehicleTopSpeed(vehicle,50)
                SetVehicleHighGear(vehicle,4)
            elseif Current_Gear == 4 and vehicles_max_gears > 4 and vehicles_Gear == 4 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed/6.3)
                ModifyVehicleTopSpeed(vehicle,60)
                SetVehicleHighGear(vehicle,5)
            elseif Current_Gear == 5 and vehicles_max_gears > 5 and vehicles_Gear == 5 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed/5.7)
                ModifyVehicleTopSpeed(vehicle,80)
                SetVehicleHighGear(vehicle,6)
            elseif Current_Gear == 6 and vehicles_max_gears > 6 and vehicles_Gear == 6 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed/1.2)
                ModifyVehicleTopSpeed(vehicle,80)
                SetVehicleHighGear(vehicle,7)
            elseif Current_Gear == 7 and vehicles_max_gears > 7 and vehicles_Gear == 7 then
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", originaltopspeed)
                ModifyVehicleTopSpeed(vehicle,80)
                SetVehicleHighGear(vehicle,8)
            elseif Current_Gear == 8 and vehicles_max_gears > 8 and vehicles_Gear == 8 then
                ModifyVehicleTopSpeed(vehicle,80)
                SetVehicleHighGear(vehicle,9)
            elseif Current_Gear == 9 and vehicles_max_gears > 9 and vehicles_Gear == 9 then
                ModifyVehicleTopSpeed(vehicle,80)
                SetVehicleHighGear(vehicle,10)
            elseif Current_Gear == 1 and vehicles_max_gears > 10 and vehicles_Gear == 10 then
                ModifyVehicleTopSpeed(vehicle,80)
                SetVehicleHighGear(vehicle,11)
            end
        end
    end
end)