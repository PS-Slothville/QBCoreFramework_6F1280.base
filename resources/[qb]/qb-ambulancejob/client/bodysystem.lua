-- ---- Laststand Vaiables ----
-- Laststand = Laststand or {}
-- InLaststand = false
-- LaststandTime = 0
-- lastStandDict = 'combat@damage@writhe'
-- lastStandAnim = 'writhe_loop'
-- isEscorted = false
-- local isEscorting = false

-- ---- Wounding Vaiables ----
-- local prevPos = nil
-- onPainKillers = false
-- local painkillerAmount = 0

-- ---- System Vaiables ----

-- local Head = nil
-- local Body = nil
-- local LeftArm = nil
-- local RightArm = nil
-- local LeftHand = nil
-- local RightHand = nil

-- local LeftLeg = nil
-- local RightLeg = nil
-- local LeftFoot = nil
-- local RightFoot = nil

-- function Head()
--     local head = "IP"
--     print(head)
-- end

-- function Body()
--     local body = "IP"
--     print(body)
-- end

-- function LeftArm()
--     local leftArm = "IP"
--     print(leftArm)
-- end

-- function RightArm()
--     local rightArm = "IP"
--     print(rightArm)
-- end

-- function LeftLeg()
--     local leftLeg = "IP"
--     print(leftLeg)
-- end

-- local function BleedAlert(level)
--     if not isDead and tonumber(isBleeding) then
--         print("Calm")
--     end
-- end

-- local function ApplyBleedingLevel(level)
--     if isBleeding ~= 0 then
--         isBleeding = 0
--     else
--         isBleeding = isBleeding - level
--     end
--     BleedAlert()
-- end

-- local function RemoveAllBleed(level)
--     if isBleeding ~= 0 then
--         if isBleeding - level < 0 then
--             isBleeding = 0
--         else
--             isBleeding = isBleeding - level
--         end
--     end
-- end

-- -- Events

-- RegisterNetEvent('hospital:client:UseIfaks', function()
--     if QBCore.Player.Data.Jobname == "ambulance" then
--         local otherplayer = QBCore.Functions.GetPlayer(source)
--         TriggerServerEvent('hospital:server:UseIfaks', (otherplayer))
--     else
--         print("You are not a Trained to use this and have no Idea what to do with it.")
--         QBCore.Functions.Notify(Lang:t('error.not_ambulance'), 'error')
--     end
-- end)

-- RegisterNetEvent('hospital:client:UseBandage', function()
--     if QBCore.Player.Data.Jobname == "ambulance" then
--         local otherplayer = QBCore.Functions.GetPlayer(source)
--         TriggerServerEvent('hospital:server:UseBandage', (otherplayer))
--     else
--         QBCore.Functions.Notify(Lang:t('error.not_ambulance'), 'error')
--     end
-- end)

-- RegisterNetEvent('hospital:client:UsePainkillers', function()
--     if QBCore.Player.Data.Jobname == "ambulance" then
--         -- Make EMS able to interact and apply Painkillers to body
--     else
--         -- Able for the user thats non EMS to use painkillers
--     end
-- end)

-- --- Sum Thread shit

-- function PainKillerLoop(pkAmount)
--     if not onPainKillers then
--             if pkAmount then
--                 painkillerAmount = pkAmount
--             end
--         onPainKillers = true
--         while onPainKillers do
--             Wait(1) -- Prevent Crash
--             painkillerAmount = painkillerAmount + 1
--             Wait(Config.PainkillerInterval * 1000)
--             if painkillerAmount <= 0 then
--                 painkillerAmount = 0
--                 onPainKillers = false
--             end
--         end
--     end
-- end

-- exports('PainKillerLoop', PainKillerLoop)

-- CreateThread(function() -- Note : Rewrite this shit
--     while true do
--         if #injured > 0 then
--             local level = 0
--             for _, v in pairs(injured) do
--                 if v.severity > level then
--                     level = v.severity
--                 end
--             end
--             SetPedMoveRateOverride(PlayerPedId(), Config.MovementRate[level])
--             Wait(5)
--         else
--             Wait(1000)
--         end
--     end
-- end)

-- CreateThread(function() -- Notes : Rewrite this shit
--     Wait(2500)
--     prevPos = GetEntityCoords(PlayerPedId(), true)
--     while true do
--         Wait(1000)
--         if isBleeding > 0 and not onPainKillers then
--             local player = PlayerPedId()
--             if bleedTickTimer >= Config.BleedTickRate and not isInHospitalBed then
--                 if not isDead and not InLaststand then
--                     if isBleeding > 0 then
--                         if fadeOutTimer + 1 == Config.FadeOutTimer then
--                             if blackoutTimer + 1 == Config.BlackoutTimer then
--                                 SetFlash(0, 0, 100, 7000, 100)
--                                 if not IsPedRagdoll(player) and IsPedOnFoot(player) and not IsPedSwimming(player) then
--                                     ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08) -- change this float to increase/decrease camera shake
--                                     SetPedToRagdollWithFall(player, 7500, 9000, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
--                                 end
--                                 Wait(1500)
--                                 blackoutTimer = 0
--                             else
--                                 if isBleeding > 3 then
--                                     blackoutTimer = blackoutTimer + 2
--                                 else
--                                     blackoutTimer = blackoutTimer + 1
--                                 end
--                             end

--                             fadeOutTimer = 0
--                         else
--                             fadeOutTimer = fadeOutTimer + 1
--                         end

--                         local bleedDamage = tonumber(isBleeding) * Config.BleedTickDamage
--                         ApplyDamageToPed(player, bleedDamage, false)
--                         DoBleedAlert()
--                         playerHealth = playerHealth - bleedDamage
--                         local randX = math.random() + math.random(-1, 1)
--                         local randY = math.random() + math.random(-1, 1)
--                         local coords = GetOffsetFromEntityInWorldCoords(player, randX, randY, 0)
--                         TriggerServerEvent('evidence:server:CreateBloodDrop', QBCore.Functions.GetPlayerData().citizenid, QBCore.Functions.GetPlayerData().metadata['bloodtype'], coords)

--                         if advanceBleedTimer >= Config.AdvanceBleedTimer then
--                             ApplyBleed(1)
--                             advanceBleedTimer = 0
--                         else
--                             advanceBleedTimer = advanceBleedTimer + 1
--                         end
--                     end
--                 end
--                 bleedTickTimer = 0
--             else
--                 if math.floor(bleedTickTimer % (Config.BleedTickRate / 10)) == 0 then
--                     local currPos = GetEntityCoords(player, true)
--                     local moving = #(vector2(prevPos.x, prevPos.y) - vector2(currPos.x, currPos.y))
--                     if (moving > 1 and not IsPedInAnyVehicle(player)) and isBleeding > 2 then
--                         advanceBleedTimer = advanceBleedTimer + Config.BleedMovementAdvance
--                         bleedTickTimer = bleedTickTimer + Config.BleedMovementTick
--                         prevPos = currPos
--                     else
--                         bleedTickTimer = bleedTickTimer + 1
--                     end
--                 end
--                 bleedTickTimer = bleedTickTimer + 1
--             end
--         end
--     end
-- end)