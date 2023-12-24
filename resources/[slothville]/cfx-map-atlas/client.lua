local EnableCayoMiniMap = true

CreateThread(function()
    SetMapZoomDataLevel(0, 2.75, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 2.8, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.0, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 20.0, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 35.0, 0.9, 0.08, 0.0, 0.0) -- Level 4
    SetMapZoomDataLevel(5, 55.0, 0.0, 0.1, 2.0, 1.0) -- ZOOM_LEVEL_GOLF_COURSE
    SetMapZoomDataLevel(6, 450.0, 0.0, 0.1, 1.0, 1.0) -- ZOOM_LEVEL_INTERIOR
    SetMapZoomDataLevel(7, 4.5, 0.0, 0.0, 0.0, 0.0) -- ZOOM_LEVEL_GALLERY
    SetMapZoomDataLevel(8, 11.0, 0.0, 0.0, 2.0, 3.0) -- ZOOM_LEVEL_GALLERY_MAXIMIZE
end)

-- CreateThread(function()
--     while true do
-- 		Wait(80)
--         local ped = PlayerPedId()
-- 		if IsPedOnFoot(ped) then
-- 			SetRadarZoom(1200) -- default 1100
-- 		elseif IsPedInAnyVehicle(ped, true) then
-- 			SetRadarZoom(1200) -- default 1100
-- 		end
--     end
-- end)

CreateThread(function()
    RequestStreamedTextureDict('dock_yacht_backgrounds', true)
    while not HasStreamedTextureDictLoaded("dock_yacht_backgrounds") do
        Wait(100)
    end
    while true do
        if IsPauseMenuActive() then
            SetScriptGfxDrawBehindPausemenu(true)
            DrawSprite("dock_yacht_backgrounds", "yacht_bg_lighting", 0.5, 0.5, 10.0, 10.0, 0, 0, 255, 179, 100)
        else
            SetStreamedTextureDictAsNoLongerNeeded('dock_yacht_backgrounds')
        end
      Wait(0)
    end
end)

if EnableCayoMiniMap then
    CreateThread(function()
        while true do
            SetRadarAsExteriorThisFrame()
            local coords = vec(4700.0, -5145.0)
            SetRadarAsInteriorThisFrame(`h4_fake_islandx`, coords.x, coords.y, 0, 0)
            Wait(0)
        end
    end)
end