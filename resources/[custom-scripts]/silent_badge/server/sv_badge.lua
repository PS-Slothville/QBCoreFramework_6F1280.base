local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("governmentbadge", function(source, item)
  local playerCoords = GetEntityCoords(GetPlayerPed(source))

  TriggerClientEvent('silent_badge:client:ShowBadgeAnimation', source)

  for _,v in ipairs(GetPlayers()) do
    if #(playerCoords - GetEntityCoords(GetPlayerPed(v))) < Config.DisplayDistance then
      TriggerClientEvent('silent_badge:client:ShowBadgeUI', v, item)
    end
  end
end)

function getProfileURL(citizenid)
  local row = MySQL.single.await('SELECT mugshot FROM mdt_profiles WHERE citizenid = ?', {citizenid})
  if row then
      return row.mugshot
  else
      return nil
  end
end

RegisterNetEvent('silent_badge:server:getBadge', function()
  local Player = QBCore.Functions.GetPlayer(source)
  if not Player then return end

  local firstName = Player.PlayerData.charinfo.firstname or 'John'
  local lastName = Player.PlayerData.charinfo.lastname or 'Lastname'
  local jobName = Player.PlayerData.job.grade.name
  local badgeNumber = Player.PlayerData.metadata.callsign
  local citizenid = Player.PlayerData.citizenid
  local imgurl = getProfileURL(citizenid)

  local info = {
    firstName = firstName,
    lastName = lastName,
    jobName = jobName,
    badgeNumber = badgeNumber,
    badgeImage = "sheriff", -- "ranger" | "lspd" | "sheriff" | "state"
    portraitImage = imgurl or ""
  }

  Player.Functions.AddItem("governmentbadge", 1, nil, info)
end)