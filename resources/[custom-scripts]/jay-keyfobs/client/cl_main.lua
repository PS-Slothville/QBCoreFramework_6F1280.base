local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k, v in pairs(Shared.Zones) do
        exports["ps-zones"]:CreateBoxZone("keyfobs_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

local eventHandler = nil

local MenuItemId = nil

local doorLockStates = {}

local jobType = nil
local PlayerData = nil
local doorlock = nil

RegisterNetEvent("jay-keyfobs:garageDoor", function()
    TriggerEvent("keyfobs", PlayerData, doorlock, jobType)
end)

RegisterNetEvent("keybind:onPress", function(id)
    if id == "keyfobs" then
        print("pressed")
    end
end)

RegisterNetEvent("keybind:onRelease", function(id)
    if id == "keyfobs" then
        print("released")
    end
end)


CreateThread(function()
    exports['ps-utils']:CreateKeybind("keyfobs", true, function()
        TriggerEvent("keyfobs", PlayerData, doorlock, jobType)
    end, function()
        -- Do nothing
        print("test")
    end, "Doors", "Keyfobs")
end)

RegisterCommand("test-fob", function()
    print(exports['ps-utils']:GetKeybind("keyfobs"))
    exports['qb-core']:DrawText(exports['ps-utils']:GetKeybind("keyfobs"))
end)


RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "keyfobs_") then
        if eventHandler then 
            eventHandler = RemoveEventHandler(eventHandler)
        end
        PlayerData = QBCore.Functions.GetPlayerData()
        doorlock = ZoneData.doorlock
        if not doorLockStates[doorlock] then 
            doorLockStates[doorlock] = true
        end
        jobType = ZoneData.jobType
        if jobType == PlayerData.job.type then
            MenuItemId = exports['qb-radialmenu']:AddOption({
                id = 'jay_keyfobs',
                title = 'Key Fob',
                icon = 'key',
                type = 'client',
                event = 'jay-keyfobs:garageDoor',
                shouldClose = true,
            }, MenuItemId)
            eventHandler = AddEventHandler("keyfobs", function(PlayerData, doorlock, jobType)
                local PlayerData = PlayerData
                local doorlock = doorlock
                local jobType = jobType
                if jobType == PlayerData.job.type then
                    doorLockStates[doorlock] = not doorLockStates[doorlock]
                    PlaySoundFrontend(-1, "Enter_On_Foot", "GTAO_ImpExp_Enter_Exit_Garage_Sounds", 1)
                    TriggerServerEvent('qb-doorlock:server:updateState', doorlock, doorLockStates[doorlock], false, false, true, false, false)
                end
            end)
        end
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "keyfobs_") then
        if eventHandler then 
            eventHandler = RemoveEventHandler(eventHandler)
        end
        if MenuItemId ~= nil then
            exports['qb-radialmenu']:RemoveOption(MenuItemId)
            MenuItemId = nil
        end
    end
end)