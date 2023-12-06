function CreateKeybind(command, press, release, category, description, device, bind)
    local invokingResource = GetInvokingResource()
    
    local alreadyExist = Storage.Keybind[command]
    if not alreadyExist then 
        Storage.Keybind[command] = invokingResource
    elseif alreadyExist then 
        return print(("[%s] Keybind %s exists in %s"):format(invokingResource, command, alreadyExist))
    end

    if not command then 
        return print(("[%s] Invalid Usage (No Command)"):format(invokingResource))
    end

    if not press then 
        print(("[%s] Invalid Usage (No Press Function) | YOU CAN IGNORE THIS ERROR"):format(invokingResource))
    end
    
    if not release then 
        print(("[%s] Invalid Usage (No Release Function) | YOU CAN IGNORE THIS ERROR"):format(invokingResource))
    end

    if not category then
        return print(("[%s] Invalid Usage (No Category)"):format(invokingResource))
    end

    if not description then
        return print(("[%s] Invalid Usage (No Description)"):format(invokingResource))
    end

    if not device then device = "keyboard" end
    
    local str_command = ('(%s) %s'):format(category, description)
    local keybindPress = ("+ps_util__%s"):format(command)
    local keybindRelease = ("-ps_util__%s"):format(command)

    RegisterCommand(keybindPress, press)
    TriggerEvent('chat:removeSuggestion', keybindPress)

    RegisterCommand(keybindRelease, release)
    TriggerEvent('chat:removeSuggestion', keybindRelease)

    RegisterKeyMapping(keybindPress, str_command, device, bind)
end exports("CreateKeybind", CreateKeybind)

function GetKeybind(command)
    local keybindPress = ("+ps_util__%s"):format(command)
    local keybind = pBindString(2, GetHashKey(keybindPress) | 0x80000000, true)
    return keybind
end exports("GetKeybind", GetKeybind)

CreateThread(function()
    exports['ps-utils']:CreateKeybind("test", function()
        print("key press: " .. exports['ps-utils']:GetKeybind("test"))
    end, function()
        print("key release: " .. exports['ps-utils']:GetKeybind("test"))
    end, "Dev", "Test Command", "keyboard", "O")
end)
