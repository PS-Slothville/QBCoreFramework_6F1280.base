local haveShownBadge = false

local function showBadgeUI(item)
  if not item or not item.info then
    haveShownBadge = false
    return 
  end
  -- Send message to svelte event handler
  SendNUIMessage({ 
    action = "open",
    data = {
      badgeImage = item.info.badgeImage or "ranger",
      portraitImage = item.info.portraitImage or "https://i.imgur.com/vCHcKtp.png",
      jobName = item.info.jobName or "Ranger",
      firstName = item.info.firstName or "Tom",
      lastName = item.info.lastName or "Hardy",
      badgeNumber = item.info.badgeNumber or 523,
      showDuration = 5000,
    }
  })
end

local function showBadgeAnimation()
  local model = `prop_fib_badge`
  local anim = { dictionary = "paper_1_rcm_alt1-9", animation = "player_one_dual-9" }
  RequestModel(model)
  while not HasModelLoaded(model) do
      RequestModel(model)
      Wait(10)
  end
  RequestAnimDict(anim.dictionary)
  while not HasAnimDictLoaded(anim.dictionary) do
      Wait(100)
  end
  local ped = PlayerPedId()
  local coords = GetEntityCoords(ped)
  local badgeProp = CreateObject(model, coords.x, coords.y, coords.z + 0.2, true, true, true)
  local boneIndex = GetPedBoneIndex(ped, 28422)
  
  AttachEntityToEntity(badgeProp, ped, boneIndex, 0.15, 0.030, -0.025, 90.0, -1.90, 140.0, true, true, false, true, 1, true)
  TaskPlayAnim(ped, anim.dictionary, anim.animation, 8.0, -8, 10.0, 49, 0, 0, 0, 0)
  Wait(3000)
  ClearPedSecondaryTask(ped)
  DeleteObject(badgeProp)
end

RegisterCommand('givebadge', function()
  TriggerServerEvent('silent_badge:server:getBadge')
end)

RegisterNetEvent('silent_badge:client:ShowBadgeAnimation', function()
  if haveShownBadge then return end

  showBadgeAnimation()
end)

RegisterNetEvent('silent_badge:client:ShowBadgeUI', function(item)
  if haveShownBadge then return end

  haveShownBadge = true
  showBadgeUI(item)
end)

RegisterNUICallback('closeUI', function(_, cb)
  cb('ok')
  haveShownBadge = false
end)

RegisterCommand('showImageURL', function()
  TriggerServerEvent('silent_badge:server:printImageURL')
end)