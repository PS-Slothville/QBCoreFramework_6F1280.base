Shared = {}
Shared.Debug = true

Shared.Lang = {
    ["cannotdothat"] = "You cannot do that",
}

-- Notify Functions
if IsDuplicityVersion() then
    Shared.Notify = function(source, message, type, time)
        TriggerClientEvent('QBCore:Notify', source, message, type, time)
    end
else
    Shared.Notify = function(message, type, time)
        TriggerEvent('QBCore:Notify', message, type, time)
    end
end

-- No Ox Support Yet

Shared.Inventory = "qb-inventory" -- "lj-inventory", "qb-inventory", "ps-inventory"
Inventory = exports[Shared.Inventory]

Shared.PedBuffs = {
    [`ig_stix`] = 100,
    [`ig_oozi`] = 25,
}

Shared.DependencyList = {
    ["ps-hud"] = true,
    [Shared.Inventory] = true,
}

CreateThread(function()
    for resource in pairs(Shared.DependencyList) do
        if GetResourceState(resource) == 'missing' then 
            print(("[%s] is missing, You will experience major issues"):format(resource))
        end
    end
    print("Passed Dependency Check")
    -- if not IsDuplicityVersion() then 
    --     print("Passed Export Check")
    -- end
end)