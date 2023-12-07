QBCore = exports['qb-core']:GetCoreObject()
local CurrentWeather
local ped = PlayerPedId()
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
    while true do
        local vehicle = GetVehiclePedIsUsing(ped)
        local vehicleclass = GetVehicleClass(vehicle)
        if HurricaneToggle == 1 then
            if Config.ThunderLand == true then
                if CurrentWeather == "THUNDER" then 
                    TriggerEvent('OD:Vehicle:Malfunction')
                end
            elseif Config.SnowLand == false then
                if CurrentWeather == "XMAS" or CurrentWeather == "BLIZZARD" then
                    TriggerEvent('OD:Vehicle:Malfunction')
                end
            end
            if Config.Debug == true then
                print(vehicleclass)
            end
        end
        Wait(1000)
    end
end)

AddEventHandler('OD:Vehicle:Malfunction', function()  -- Events for plane falure
    local vehicle = GetVehiclePedIsUsing(ped)
    if IsPedInVehicle(ped, vehicle, true) then
        local enginehealth = GetVehicleEngineHealth(vehicle)
        local vehicle_clutch = GetVehicleClutch(vehicle)
        local clutch_change = vehicle_clutch - math.random(1, 5)
        local vehicle_speed = GetEntitySpeed(vehicle)
        local MPH = vehicle_speed * 2.236936
        if MPH > Config.SlidyIceMPH then
            SetVehicleReduceGrip(vehicle, true)
            if Config.Debug == true then
                print("Slideeeee")
            end
        end
        if enginehealth < 250 then
            if MPH == 55 then
                if vehicle_clutch == 60 then
                    SetVehicleClutch(vehicle , clutch_change)
                end
            end
            SetVehicleWheelIsPowered(vehicle, 2, false)
        end
    end
end)

CreateThread(function ()
    while true do
        local vehicle = GetVehiclePedIsUsing(ped)
        local vehicle_speed = GetEntitySpeed(vehicle)
        local MPH = vehicle_speed * 2.236936
        if MPH < Config.SlidyIceMPHStop then
            SetVehicleReduceGrip(vehicle, false)
            if Config.Debug == true then
                print("No Slide!")
            end
        end
        Wait(1500)
    end
end)