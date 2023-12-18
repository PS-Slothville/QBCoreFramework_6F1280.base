QBCore = exports['qb-core']:GetCoreObject()
local CurrentWeather
local WindDirection = "right"

RegisterNetEvent('qb-weathersync:client:SyncWeather', function(NewWeather)
    CurrentWeather = NewWeather
    if CurrentWeather == "THUNDER" then
        TriggerServerEvent("OD:Weather:server:randomLeftRight")
    end
end)

RegisterNetEvent("OD:Weather:randomLeftRight", function(toggle)
    WindDirection = toggle
end)

local cache_prop_id = {}

RegisterNetEvent('toggleHurricane')
AddEventHandler('toggleHurricane', function(ToggleValue)
    if CurrentWeather == "THUNDER" then
        HurricaneToggle = 1
    end
end)

CreateThread(function()
    while true do
        Wait(1000) -- Wait for 1 second before applying force to props again
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
        Wait(1000) -- Wait for 1 second before applying force to props again
        for _, obj in ipairs(GetGamePool("CObject")) do
            if not IsEntityAPed(obj) and IsEntityAnObject(obj) then
                local propHash = GetEntityModel(obj)
                if Config.Props[propHash] or Config.AnyProp then
                    cache_prop_id[obj] = propHash
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(100)
        if HurricaneToggle == 1 then
            if CurrentWeather == "THUNDER" then 
                for obj, hash in pairs(cache_prop_id) do 
                    if Config.Props[hash] or Config.AnyProp then
                        -- print(hash)
                        local PropInfo = {forceLeft = nil, forceRight = nil}
                        if Config.Props[hash] and type(Config.Props[hash]) == "table" then
                            PropInfo.forceLeft = Config.Props[hash].forceLeft
                            PropInfo.forceRight = Config.Props[hash].forceRight
                        end

                        local force = vector3(0, 0, 0)
                        if WindDirection == "left" then
                            force = PropInfo.forceLeft or vector3(-90.0, 5.0, 25.0)
                        elseif WindDirection == "right" then
                            force = PropInfo.forceRight or vector3(90.0, 5.0, 25.0)
                        end
                        -- ApplyForceToEntityCenterOfMass(obj, 1, force.x, force.y, force.z, 0.0, 0.0, 0.0, 0, true, true, true, true, true)
                        local rando = math.random(1, 100)
                        -- print(rando)
                        if rando > 50 then
                            ApplyForceToEntityCenterOfMass(obj, 1, force.x, force.y, force.z+20, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        else
                            ApplyForceToEntityCenterOfMass(obj, 1, force.x, force.y, force.z, 0.0, 0.0, 0.0, 0, true, true, true, true, true)
                        end
                    end
                end
            else
                Wait(10000)
            end
        end
    end
end)

