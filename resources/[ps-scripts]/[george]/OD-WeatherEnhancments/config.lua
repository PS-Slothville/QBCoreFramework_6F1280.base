Config = {
    debug = false,
    --- Misc
    UseCommand = false, --(Only Authrised for perm admin+)
    Command = "Hurricane",
    Weather_For_Hurricane = "THUNDER",
    Weather_For_Blizzard = "BLIZZARD",
    Weather_For_Blizzard2 = "XMAS",
    CreateMoreLightning = true, -- More thunder and lighting
    PS_Dispatch = true, -- True if use PS_Dispatch
    --- Air Vehicles Effected By Weather 
    ThunderAir = true,
    VehicleAreDestoryed = true,
    Plane_Notification = "Your Engine is struggling againts the high winds!",
    Heli_Notification = "You Notice That Your Helicopter is Struggling Against The High Winds!",
    SnowAir = true,
    Snow_Plane_Notification = "Your Engine is struggling againts the high winds!",
    Snow_Heli_Notification = "You Notice That Your Helicopter is Struggling Against The High Winds!",
    --- Land Vehicles Effected By Weather
    ThunderLand = true,
    SnowLand = true,
    --- MPH Sliding
    SlidyIceMPH = 119, -- When will the vehicle start to enter the slide state (400 = disabled)
    SlidyIceMPHStop = 118,
    -- Any Props that are effected
    AnyProp = true,
    
    -- PropEnhancment
    direction = "left",
}

-- x = left right, y = north south, z = up down

Config.Props =  {
    [`prop_dumpster_01a`] = { forceLeft = vector3(-420.0, 1.6, 40.0), forceRight = vector3(520.0, 1.7, 50.0) },
    [`prop_dumpster_02b`] = { forceLeft = vector3(-420.0, 1.6, 40.0), forceRight = vector3(520.0, 1.7, 50.0) },
    [`prop_rub_binbag_03b`] = true,
    [`prop_rub_binbag_05`] = true,
    [`prop_rub_boxpile_04`] = true,
    [`prop_rub_boxpile_09`] = true,
    [`prop_rub_binbag_04`] = true,
    [`prop_bin_05a`] = { forceLeft = vector3(-520.0, 1.6, 40.0), forceRight = vector3(520.0, 1.7, 50.0) },
    [`prop_bin_01a`] = true,
    [`prop_news_disp_02a`] = true,
    [`prop_rub_binbag_06`] = true,
    [`prop_news_disp_01a`] = true,
    [`prop_bikerack_1a`] = true,
    [`prop_news_disp_03a`] = true,
    [`prop_rub_trolley01a`] = { forceLeft = vector3(-320.0, 1.3, 50), forceRight = vector3(320.0, 1.3, 50.0) },
    [`prop_rub_cardpile_03`] = true,
    [`prop_rub_cardpile_05`] = true,
    [`prop_bin_08a`] = true,
    [`prop_rub_couch03`] = true,
    [`prop_table_03b_chr`] = true,
    [`prop_bin_07a`] = true,
    [`prop_rub_pile_03`] = true,
    [`prop_rub_boxpile_01`] = true,
    [`prop_rub_boxpile_02`] = true,
    [`prop_roadcone02b`] = true,
    [`prop_wheel_tyre`] = true,
    [`prop_rub_boxpile_05`] = true,
    [`prop_rub_boxpile_05a`] = true,
    [`prop_boxpile_06b`] = { forceLeft = vector3(-3120.0, 1.38, 40.0), forceRight = vector3(3220.0, 1.24, 40.0) },
    [`prop_sacktruck_02b`] = true,
    [`prop_rub_trolley03a`] = true,
    [`prop_rub_cage01b`] = { forceLeft = vector3(-327, 1.64, 40.0), forceRight = vector3(327, 1.64, 40.0) },
    [`prop_cratepile_02a`] = true,
    [`prop_cratepile_01a`] = true,
    [`prop_roadcone01a`] = true,
    [`prop_table_03b`] = true,
    [`prop_cratepile_05a`] = true,
    [`prop_rub_binbag_03`] = true,
    [`prop_shopsign_01`] = true,
    [`prop_shopsign_02`] = true,
    [`prop_barrel_pile_03`] = true,
    [`prop_rub_binbag_01b`] = true,
    [`prop_cratepile_07`] = true,
    [`prop_cablespool_01a`] = true,
    [`prop_bench_05`] = { forceLeft = vector3(-2910.0, 1.34, 1510), forceRight = vector3(2910.0, 1.34, 1510.0) },
    [`prop_bench_09`] = { forceLeft = vector3(-3910.0, 1.34, 1510), forceRight = vector3(3910.0, 1.34, 1510.0) },
    [`prop_bench_1a`] = { forceLeft = vector3(-2910.0, 1.34, 1510), forceRight = vector3(2910.0, 1.34, 1510.0) },
    [`prop_wheelbarrow02a`] = { forceLeft = vector3(-140.3, 1.34, 1510), forceRight = vector3(140.3, 1.34, 1510.0) },
    
    ------ Props in interiors
    [`prop_keyboard_01a`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
    [`v_ret_gc_folder1`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
    [`v_ret_gc_folder2`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
    [`v_res_paperfolders`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
    [`prop_fire_exting_1a`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
    [`prop_fax_01`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
    [`v_corp_cd_chair`] = { forceLeft = vector3(0,0,0), forceRight = vector3(0,0,0) },
}

--------------------------------------------------- PS DISPATCH 
-------- Client/alerts.lua
-- local function PilotinDestress(class)
--     local coords = GetEntityCoords(cache.ped)
--     local vehicle = GetVehicleData(cache.vehicle)

--     local dispatchData = {
--         message = locale('pilotindestress'),
--         codeName = 'PilotinDestress',
--         code = '911',
--         icon = 'fas fa-plane',
--         priority = 2,
--         coords = coords,
--         vehicle = vehicle.name,
--         plate = vehicle.plate,
--         color = vehicle.color,
--         class = class,
--         street = GetStreetAndZone(coords),
--         jobs = { 'leo'}
--     }

--     TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
-- end
-- exports('PilotinDestress', PilotinDestress)


--------- Config/Config.Blips
-- ['PilotinDestress'] = {
--     radius = 15.0,
--     sprite = 16,
--     color = 1,
--     scale = 1.5,
--     length = 2,
--     sound = 'panicbutton',
--     offset = false,
--     flash = false
-- },