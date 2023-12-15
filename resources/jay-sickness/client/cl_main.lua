local QBCore = exports['qb-core']:GetCoreObject()

local chance = 6

local Sick = false

local SicknessLevel = 0

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
            SicknessLevel = SicknessLevel + math.random(1,10)/10
            TriggerEvent('hud:client:BuffEffect', {
                buffName = "sickness",
                display = true,
                iconName = "atom",
                iconColor = "#9FB710",
                progressColor = "#9FB710",
                progressValue = SicknessLevel,
            })
            local damage = math.random(1,10)+SicknessLevel
            SetEntityHealth(ped, health-damage)
        until not Sick
    end)
end
exports('GetSick', GetSick)
RegisterNetEvent("sickness:GetSick", GetSick)

local function NoSick()
    Sick = false
    SicknessLevel = 0
    TriggerEvent('hud:client:BuffEffect', {
        display = false,
        buffName = "sickness",
    })
end
RegisterNetEvent("sickness:NoSick", NoSick)
exports('NoSick',NoSick)

CreateThread(function()
    while true do
        Wait(60000)
        local chanceill = math.random(1, 100)
        if chanceill <= Config.Chance then
            GetSick()
        end
    end
end)


