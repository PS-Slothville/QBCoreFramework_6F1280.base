local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData() or {}

RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
    PlayerData = val
end)


-- Functions
local function Debug (...)
    if Config.Debug then
        print(...)
    end
end

CreateThread(function()
    for category, tbl in pairs(Config.Routes) do
        for route, data in pairs(tbl) do 
            OpenPatrolRoute('miss_'..category.."_"..route) -- Seems if it dsoent start with 'miss_', its hardcoded not to work
            for i = 0, #data.Points do
                if data.CustomLookAt then
                    AddPatrolRouteNode(i, data.Scenario, data.Points[i], data.LookAt[i], data.Timeout)
                    Debug('AddPatrolRouteNode('..i.. ', '..data.Scenario..', '..data.LookAt[i]..', '..data.Points[i]..', '..data.Timeout)
                else
                    AddPatrolRouteNode(i, data.Scenario, data.Points[i], data.Points[i], data.Timeout)
                    Debug('AddPatrolRouteNode('..i.. ', '..data.Scenario..', '..data.Points[i]..', '..data.Points[i]..', '..data.Timeout)
                end
                if i  < #data.Points then
                    AddPatrolRouteLink(i, (i + 1))
                    Debug('AddPatrolRouteLink('..i..', '..(i + 1)..')')
                else
                    AddPatrolRouteLink(i, 0)
                    Debug('AddPatrolRouteLink('..i..', '..'0'..')')
                end
            end
            ClosePatrolRoute()
            CreatePatrolRoute()

            if Config.Debug then
                CreateThread(function()
                    while true do
                        Wait(1)
                        for i = 0, #data.Points do
                            DrawMarker(28, data.Points[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.1, 0, 100, 255, 255, false)
                            if i  < #data.Points then
                                DrawLine(data.Points[i], data.Points[i + 1], 0, 255, 0, 255)
                            else
                                DrawLine(data.Points[i], data.Points[0], 0, 255, 0, 255)
                            end
                            if data.CustomLookAt then
                                DrawLine(data.Points[i], data.LookAt[i], 255, 0, 0, 255)
                            end
                        end
                    end
                end)
            end
        end
    end
end)

local function IsDead()
    if PlayerData.metadata['isdead'] then 
        return true
    elseif PlayerData.metadata['inlaststand'] then 
        return true
    elseif IsEntityDead(PlayerPedId()) then 
        return true
    end
    return false
end

RegisterNetEvent('aj-patrols:server:catchGuard', function(src, pID, category, route)
    while NetworkGetEntityFromNetworkId(pID) == 0 do Wait(0) end
    local ped = NetworkGetEntityFromNetworkId(pID)
    while not DoesEntityExist(ped) do Wait(0) end
    Debug('Got Ped: '..pID, DoesEntityExist(ped))
    -- if GetPlayerServerId(PlayerId()) == src then
    --     print("Test")
    --     SetPedDesiredMoveBlendRatio(ped, 0.0)
    --     SetPedDropsWeaponsWhenDead(ped, false)
    --     SetPedKeepTask(ped, true)
    --     TaskPatrol(ped, route, 1, false, true)
    -- end

    SetPedDesiredMoveBlendRatio(ped, 0.0)
    SetPedDropsWeaponsWhenDead(ped, false)
    SetPedKeepTask(ped, true)
    SetCanAttackFriendly(ped, false, true)
    SetPedCombatAttributes(ped, 46, true)
    SetPedCombatAttributes(ped, 0, false)
    SetPedCombatAbility(ped, 100)
    SetPedAsCop(ped, true)
    SetPedAlertness(ped, 3)
    TaskPatrol(ped, route, 1, false, true)
    CreateThread(function()
        while not IsEntityDead(ped) do
            Wait(1000)
            local me = PlayerPedId()
            local coords = GetEntityCoords(me)
            local guard = GetEntityCoords(ped)
            local dist = #(coords-guard)
            -- print(IsDead())
            if dist < 20 and not IsDead() then
                SetPedRelationshipGroupHash(ped, `HATES_PLAYER`)
                SetPedAccuracy(ped, 60)
                SetPedFleeAttributes(ped, 0, 0)
                SetBlockingOfNonTemporaryEvents(ped, true)
                TaskCombatPed(ped, me, 0, 16)
            elseif IsDead() then
                SetBlockingOfNonTemporaryEvents(ped, false)
                if GetPlayerServerId(PlayerId()) == src then
                    TaskPatrol(ped, route, 1, false, true)
                end
                -- TaskPatrol(ped, route, 1, false, true)
            end
        end
    end)
end)

AddEventHandler('onResourceStop', function(res)
    if GetCurrentResourceName() ~= res then
        return
    end

    for category, tbl in pairs(Config.Routes) do
        for route, data in pairs(tbl) do 
            Debug('^1Deleted '..'miss_'..category.."_"..route..'^7')
            DeletePatrolRoute('miss_'..category.."_"..route)
        end
    end
end)