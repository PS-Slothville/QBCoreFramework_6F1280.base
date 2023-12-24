local resetSnow = false

CreateThread(function()
    while true do
        -- print(GlobalState.AlwaysSnow)
        if GlobalState.AlwaysSnow then
            ForceSnowPass(true)
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
            resetSnow = true
            if not HasNamedPtfxAssetLoaded("core_snow") then
                RequestNamedPtfxAsset("core_snow")

                while not HasNamedPtfxAssetLoaded("core_snow") do
                    Wait(0)
                end
            end

            UseParticleFxAssetNextCall("core_snow")
        else 
            if resetSnow then 
                resetSnow = false
                ForceSnowPass(false)
                SetForceVehicleTrails(false)
                SetForcePedFootstepsTracks(false)
            end
            RemoveNamedPtfxAsset("core_snow")
        end

        Wait(1000)
    end
end)

RegisterCommand("lightning", function()
    ForceLightningFlash()
end)