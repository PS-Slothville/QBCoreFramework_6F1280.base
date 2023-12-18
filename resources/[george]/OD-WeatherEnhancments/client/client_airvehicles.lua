QBCore = exports['qb-core']:GetCoreObject()
local CurrentWeather
local ped = PlayerPedId()
local HeliFailure = 0
local PlaneFailure = 0
local HurricaneToggle = 0

RegisterNetEvent('qb-weathersync:client:SyncWeather', function(NewWeather) -- For weather to see if Thunder or Snow
    CurrentWeather = NewWeather
end)

RegisterNetEvent('toggleHurricane')
AddEventHandler('toggleHurricane', function(ToggleValue)
    if CurrentWeather == "THUNDER" then
        HurricaneToggle = 1
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if Config.UseCommand == true then
            if CurrentWeather ~= "THUNDER" then
                HurricaneToggle = 0
            end
        end
        if Config.UseCommand == false then
            if CurrentWeather ~= "THUNDER" then
                HurricaneToggle = 1
            end
        end
    end
end)

CreateThread(function()
    CreateThread(function()
        local Wait_Time = math.random(3000, 10000)
    while true do
    if HurricaneToggle == 1 then
        local vehicle = GetVehiclePedIsUsing(ped)
        local inair = IsEntityInAir(vehicle)
        local inplane = IsPedInAnyPlane(ped)
        local inheli = IsPedInAnyHeli(ped)
        local enginehealth = GetVehicleEngineHealth(vehicle)
        local vehicleclass = GetVehicleClass(vehicle)
        if Config.ThunderAir == true then
            if CurrentWeather == Config.Weather_For_Hurricane then -- if thunder
                if Config.CreateMoreLightning == true then
                    CreateLightningThunder()
                    ForceLightningFlash()
                end
                if vehicleclass == 15 or vehicleclass == 16 then
                    if inair == 1 then -- if air will continue
                        if inplane == 1 then -- if in a plane will carry out
                            if enginehealth > 500 then
                                QBCore.Functions.Notify(Config.Airvehicle_Notification, 'error', 3000)
                                TriggerEvent('OD:PlaneFailure')
                                print("YES")
                            end
                        end
                        if inheli == 1 then -- if in heli will carry out
                            if enginehealth > 500 then
                                QBCore.Functions.Notify(Config.Heli_Notification, 'error', 3000)
                                TriggerEvent('OD:HeliFailure')
                            end
                        end
                    end
                end
                if Config.debug == true then -- prints to know if in air or not
                print(inair, "is in air?")
                print(vehicleclass, "vehicle class?")
                Wait(Wait_Time)
                end
            end
        if Config.SnowAir == true then 
            if CurrentWeather == Config.Weather_For_Blizzard or Config.Weather_For_Blizzard2 then -- if in a billzard or XMAS 
                if vehicleclass == 15 or vehicleclass == 16 then
                    if inair == 1 then -- if in the air will continue
                        if inplane == 1 then -- if only in plane
                            if enginehealth > 500 then
                                QBCore.Functions.Notify(Config.Snow_Plane_Notification, 'error', 3000)
                                TriggerEvent('OD:PlaneFailure')
                            end
                        end
                        if inheli == 1 then -- if only in heli
                            if enginehealth > 500 then
                                QBCore.Functions.Notify(Config.Snow_Heli_Notification, 'error', 3000)
                                TriggerEvent('OD:HeliFailure')
                            end
                        end
                    end
                end
                if Config.debug == true then -- prints to know if in air
                    print(inair, "is in air?")
                    print(vehicleclass, "vehicle class?")
                    print(enginehealth)
                end
            end
        end
        end
        end
    Wait(Wait_Time) end
    end)
end)

AddEventHandler('OD:HeliFailure', function() -- Events for helicopter failure
    local vehicle = GetVehiclePedIsUsing(ped)
    if HeliFailure == 0 then
        HeliFailure = 1
        local Stage1 = math.random(75, 84)
        local Stage2 = math.random(29, 75)
        local Stage3 = math.random(13, 23)
        local Stage4Blade = math.random(0, 15)
        local Stage4Engine = math.random(0, 17)
        local class = "Helicopter"

        print("Stage 1")
        if Config.VehicleAreDestoryed == true then
            SetHeliMainRotorHealth(vehicle, Stage1)
        end
        SetAirDragMultiplierForPlayersVehicle(vehicle , 1.0)
        Wait(10000)

        print("Stage 2")
        if Config.VehicleAreDestoryed == true then
            SetHeliMainRotorHealth(vehicle, Stage2)
            SetVehicleEngineHealth(vehicle, 70)
        end
        SetHelicopterRollPitchYawMult(vehicle,0.8)
        if Config.VehicleAreDestoryed == true then
            TaskVehicleTempAction(ped,vehicle,9, 4000)
        end
        Wait(6000)
        Wait(10000)
        
        print("Stage 3")
        if Config.VehicleAreDestoryed == true then
        SetHeliMainRotorHealth(vehicle, 20)
        end
        SetVehicleControlsInverted(vehicle, true)
        SetHeliBladesSpeed(vehicle, Stage3)
        Wait(math.random(1,1))

        if Config.VehicleAreDestoryed == true then
            print("Engine = Dead")
            QBCore.Functions.Notify('The Rotors have failed!', 'error', 3000)
            SetHeliMainRotorHealth(vehicle, 3)
            SetHeliBladesSpeed(vehicle, Stage4Blade)
            SetVehicleEngineHealth(vehicle, Stage4Engine)
            if Config.PS_Dispatch == true then
                exports['ps-dispatch']:PilotinDestress(class)
            end
        else
            HeliFailure = 0
        end
    end 
end)

AddEventHandler('OD:PlaneFailure', function()  -- Events for plane falure
    local vehicle = GetVehiclePedIsUsing(ped)
    if PlaneFailure == 0 then
        PlaneFailure = 1
        local Stage1 = math.random(75, 84)
        local Stage2 = math.random(30, 75)
        local Stage3 = math.random(13, 23)
        local Stage4Propeller = math.random(0, 15)
        local Stage4Engine= math.random(0, 17)
        local class = "PlaneFailure"

        print(Stage1)
        print("Stage 1")
        SetPlaneTurbulenceMultiplier(vehicle, 2)
        if Config.VehicleAreDestoryed == true then
            SetPlanePropellersHealth(vehicle, Stage1)
        end
        Wait(10000)

        print("Stage 2")
        if Config.VehicleAreDestoryed == true then
        SetPlanePropellersHealth(vehicle, 50)
        end
        SetVehicleEngineOn(vehicle, false, true, false)
        Wait(5000)
        SetVehicleEngineOn(vehicle, false, true, false)
        Wait(5000)
        SetVehicleEngineOn(vehicle, false, true, false)
        Wait(5000)
        if Config.VehicleAreDestoryed == true then
            TaskVehicleTempAction(ped,vehicle,9, 4000)
        end
        Wait(6000)
        SetAirDragMultiplierForPlayersVehicle(vehicle , 1.0)
        SetVehicleClutch(vehicle,100)
        if Config.VehicleAreDestoryed == true then
            SetVehicleEngineHealth(vehicle, Stage2)
        end
        Wait(10000)
        
        print("Stage 3")
        ModifyVehicleTopSpeed(vehicle, Stage3)
        Wait(math.random(1000,10000))
        
        if Config.VehicleAreDestoryed == true then
            QBCore.Functions.Notify('The Engine has failed!', 'error', 3000)
            print("failure")
            SetPlaneTurbulenceMultiplier(vehicle, 4.0)
            SetPlanePropellersHealth(vehicle, Stage4Propeller)
            DisableIndividualPlanePropeller(vehicle, 1)
            SetPlaneEngineHealth(vehicle, Stage4Engine)
            SetVehicleEngineHealth(vehicle, Stage4Engine)
            if Config.PS_Dispatch == true then
                exports['ps-dispatch']:PilotinDestress(class)
            end
        else
            PlaneFailure = 0
        end
    end
end)

CreateThread(function() -- Will clear and make loop able to be used ONLY if you get out of the vehicle
    while true do
        local inheli = IsPedInAnyHeli(ped)
        if inheli == false then
            HeliFailure = 0
        end
        Wait(2000)
    end
end)

CreateThread(function() -- Will clear and make loop able to be used ONLY if you get out of the vehicle
    while true do
        local inplane = IsPedInAnyPlane(ped)
        if inplane == false then
            PlaneFailure = 0
        end
        Wait(2000)
    end
end)
