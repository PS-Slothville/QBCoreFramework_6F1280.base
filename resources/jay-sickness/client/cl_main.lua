local QBCore = exports['qb-core']:GetCoreObject()

local Sick = false

local function GetSick()
    if Sick then 
        return
    end
    Sick = true
    QBCore.Functions.Notify('You are feeling sick, Take some medicine', 'error', 2500)
    CreateThread(function()
        repeat
            local ms = math.random(30000, 60000)
            Wait(ms)
            local ped = PlayerPedId()
            --Cough animation
            RequestAnimDict("timetable@gardener@smoking_joint")
            while not HasAnimDictLoaded("timetable@gardener@smoking_joint") do
                Wait(100)
            end
            TaskPlayAnim(ped, "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
            Wait(3000)
            ClearPedSecondaryTask(ped)
            local health = GetEntityHealth(ped)
            SetEntityHealth(ped, health-1)
        until not Sick
    end)
end
exports('GetSick', GetSick)
RegisterNetEvent("sickness:GetSick", GetSick)

local function NoSick()
    Sick = false
end
RegisterNetEvent("sickness:NoSick", NoSick)
exports('NoSick',NoSick)

CreateThread(function()
    while true do
        Wait(60000)
        local chanceill = math.random(1, 100)
        if chanceill <= chance then
            GetSick()
        end
    end
end)


