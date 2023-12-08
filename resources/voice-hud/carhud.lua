AddStateBagChangeHandler('proximity', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(bagName, key, value)
	SendNUIMessage({
		type = "updateStatusHud",
		varSetVoice = value,
		is_talking = NetworkIsPlayerTalking(PlayerId())
	})

end)

CreateThread(function()
	local currentTalking = false
	while true do
		local isTalking = NetworkIsPlayerTalking(PlayerId())
		if isTalking and not currentTalking then
			SendNUIMessage({type = "talkingStatus", is_talking = true})
		elseif not isTalking and currentTalking then 
			SendNUIMessage({type = "talkingStatus", is_talking = false})
		end

		currentTalking = isTalking
		Wait(250)
	end
end)