local QBCore = exports['qb-core']:GetCoreObject()

local netIds = {}

local function SpawnGuard(source, type, model, weapon, category)
    local src = source
	if netIds[category] then 
		print("need to do a timeout for it to work again")
		return
	end

	netIds[category] = {}
	for route, data in pairs(Config.Routes[category]) do 
		local Guard = CreatePed(type, model, data.Points[0].x, data.Points[0].y, data.Points[0].z, data.Points[0].w, true, false)
		while not DoesEntityExist(Guard) do Wait(0) end
	
		SetPedRandomComponentVariation(Guard, 0)
		SetPedRandomProps(Guard)
		GiveWeaponToPed(Guard, weapon, -1, true, true)
		SetPedConfigFlag(ped, 132, true)
	
		netId = NetworkGetNetworkIdFromEntity(Guard)
		netIds[#netIds+1] = netId
		TriggerClientEvent('aj-patrols:server:catchGuard', -1, src, netId, category, 'miss_'..category.."_"..route)
	end
end
exports("SpawnGuard", SpawnGuard)

RegisterCommand('patrol', function(source, args)
    SpawnGuard(source, 6, `G_M_M_Goons_01`, `WEAPON_PISTOL`, 'powerstation')
end)


AddEventHandler('onResourceStop', function(res)
    if GetCurrentResourceName() ~= res then return end
    for k, v in pairs(netIds) do
        DeleteEntity(NetworkGetEntityFromNetworkId(v))
    end
end)