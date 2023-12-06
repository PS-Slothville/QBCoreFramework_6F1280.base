Config = {}
Config.Debug = false
Config.SoloRace = false -- use for debug, if this was pushed as true, please @coffeelot in the discord and call him an idiot

Config.MinimumDistance = 1000 -- This is the minimum distance away a randomly selected waypoint can be
Config.MaximumDistance = 5000 -- This is the minimum distance away a randomly selected waypoint can be
Config.FlareTime = 10000 -- Time the flare is lit, in ms
Config.FinishModel = `prop_flare_01b` -- Prop for flare
Config.InviteDistance = 20 -- Max distance away to get invites
Config.MoneyType = 'cash' -- Type of money used
Config.BuyIns = { 100, 1000, 5000 } -- The pre selected buy ins
Config.InviteTimer = 10000 -- Time until invite is canceled for reciever, in ms
Config.FlashUnderglow = true -- Set to false if you dont want underglow to flash when challenging or accepting

Config.BlackListedJobs = {
    ['police'] = { name = 'police', onlyDuty = false },
    ['taxi'] = { name = 'taxi', onlyDuty = true },
}

Config.Outrun = {
    FarDistance = 1000,
    CatchDistance = 20,
    TimeToOutrun = 10,
    TimeToCatch = 10,
}

-- All possible locations you can be sent to. Add more if you want. use /impdebug to see them on the map
Config.Finishes = {
    -- Elysian
    vector3(178.38, -3143.98, 5.16),
    -- North city etc
    vector3(-984.45, -222.35, 37.21),
    vector3(-693.78, -52.67, 37.06),
    vector3(-759.95, 216.91, 75.04),
    vector3(-1081.42, 265.65, 63.26),
    vector3(-1297.47, 288.18, 64.14),
    vector3(-1434.16, 50.05, 51.78),
    vector3(-1536.7, -30.57, 57.03),
    vector3(-1414.69, -172.45, 46.92),
    vector3(-1495.97, -257.55, 49.69),
    vector3(-1177.66, -123.95, 39.48),
    vector3(-863.47, -285.66, 39.72),
    vector3(-869.98, -225.48, 38.77),
    vector3(-832.08, -212.6, 36.93),
    vector3(-502.56, -127.34, 38.3),
    vector3(-265.8, -89.06, 47.77),
    vector3(-44.97, 32.58, 71.55),
    vector3(32.92, 254.66, 108.93),
    vector3(22.4, 362.64, 111.95),
    vector3(366.53, 311.45, 102.9),
    vector3(394.92, 234.63, 102.41),
    vector3(337.23, 72.22, 95.85),
    vector3(279.31, -82.86, 69.51),
    vector3(229.83, -219.25, 53.36),
    vector3(71.44, -162.67, 54.42),
    vector3(-105.47, -225.34, 44.15),
    vector3(-679.96, -577.37, 24.64), -- underground
    vector3(-783.21, -576.54, 29.46),
    vector3(-639.73, -953.39, 20.92),
    vector3(-769.6, -1113.19, 10.04),
    vector3(-1102.22, -1309.6, 4.92),
    vector3(-1149.75, -1492.0, 3.74),
    vector3(-1159.11, -1762.57, 3.31),
    vector3(-957.34, -1531.34, 4.51),
    vector3(-1358.58, -997.27, 7.68),
    vector3(-1611.31, -909.21, 8.32),
    vector3(-1174.13, -841.8, 13.66),
    vector3(-283.98, -662.55, 32.59),
    vector3(169.29, -819.95, 30.5),
    vector3(220.47, -1037.72, 28.69),
    vector3(399.46, -995.68, 28.78),
    vector3(784.31, -1005.44, 25.47),
    vector3(-153.63, 1051.92, 230.1),
    vector3(-390.33, 933.26, 234.03),
    vector3(-714.89, 988.18, 237.34),
    vector3(-407.52, 1183.03, 324.88),
    vector3(-191.78, 1489.92, 288.37),
    vector3(973.36, 156.24, 80.28),
    vector3(362.17, -678.61, 28.61),
    vector3(-421.39, -381.09, 31.97),
    vector3(-444.78, -513.24, 24.45),
    vector3(696.31, 634.61, 128.24),
    -- Hills
    vector3(239.05, 1351.93, 238.17),
    vector3(136.99, 1653.62, 228.26),
    vector3(-161.6, 1886.41, 197.59),
    vector3(-1352.64, 740.74, 183.77),
    vector3(-2309.1, 416.86, 173.8),
    vector3(624.07, 781.87, 203.53),

    -- Mid area
    vector3(721.54, 2202.78, 57.12),
    vector3(1192.15, 2682.43, 37.16),
    vector3(1192.15, 2682.43, 37.16),
    vector3(-464.8, 2801.84, 38.42),
    vector3(-475.58, 2838.02, 33.31),
    vector3(-416.25, 2850.33, 37.58),
    vector3(-801.99, 1828.04, 165.45),
    vector3(-781.66, 1656.13, 201.17),
    vector3(-1861.99, 2031.94, 137.2),
    vector3(859.34, 1299.61, 357.09),
    vector3(2581.97, 387.52, 107.79),
    vector3(2539.39, 1992.61, 19.47),
    vector3(2035.14, 2599.94, 53.23),
    vector3(2689.26, 3273.05, 54.57),
    vector3(2790.02, 3393.5, 55.21),
    vector3(2710.53, 4748.39, 43.67),
    -- North
    vector3(1499.16, 6444.59, 21.77),
    vector3(141.86, 6521.05, 30.93),
    vector3(-175.52, 6358.92, 30.84),
    vector3(-362.06, 6172.54, 30.71),
    vector3(-417.26, 5952.65, 31.27),
    vector3(-2225.81, 4292.79, 46.93),
    vector3(-3114.06, 1090.6, 19.79),
    vector3(-2454.31, 1040.22, 192.62),
    vector3(-2649.09, 1504.9, 118.12),
    vector3(-2184.84, -351.07, 12.51),
    vector3(1667.17, 4932.49, 41.45),
    vector3(283.79, 2634.94, 44.0),

    -- Southside
    vector3(1448.79, -2581.63, 47.59),
    vector3(912.71, -2328.01, 29.86),
    vector3(1239.95, -1356.67, 34.5),
    vector3(1296.6, -1644.04, 50.43),
    vector3(76.45, -1915.8, 20.58),
    vector3(35.75, -1813.17, 24.52),
    vector3(-76.21, -1725.15, 28.67),
    vector3(-153.4, -2009.87, 22.19),
    vector3(149.86, -2041.79, 17.65),
    vector3(142.48, -2190.37, 5.33),
    vector3(-379.21, -2763.54, 5.33),
    vector3(333.01, -2473.43, 5.08),
    vector3(298.21, -2002.72, 19.84),
    vector3(522.82, -1692.65, 28.71),
    vector3(64.12, -1507.01, 28.67),
    vector3(322.27, -1516.13, 28.66),
    vector3(355.98, -1693.34, 31.86),
    vector3(-92.08, -1364.75, 28.76),
    vector3(-229.16, -1440.34, 30.69),
    vector3(230.49, -1297.08, 28.63),
    vector3(-182.01, -1610.63, 33.14),
    vector3(278.94, -1675.06, 28.68),
    vector3(-397.82, -1726.28, 18.69),
    vector3(-1025.68, -2706.01, 13.08),
    vector3(-504.18, -2140.76, 8.38),
    vector3(-1095.7, -1975.85, 12.5),
    vector3(-310.04, -1755.04, 0.38),
    vector3(1157.02, -3319.21, 5.26),
    vector3(881.88, -3168.28, 5.27),
    vector3(645.43, -1378.15, 9.06),
    vector3(613.17, -738.07, 11.37),
    vector3(715.79, -293.36, 57.84),
    vector3(1202.53, -370.43, 68.16),
    vector3(1307.6, -555.16, 70.77),
    vector3(1343.02, -731.84, 66.29),
    vector3(1151.16, -760.25, 57.11),
    vector3(921.43, -599.87, 56.79),
    vector3(591.81, -763.88, 10.4),
    vector3(791.39, -1099.88, 28.24),
    vector3(827.12, -1748.33, 28.82),
    vector3(441.09, -1293.13, 29.6),
    vector3(-318.81, -1525.99, 26.88),
    vector3(-320.2, -1444.86, 30.2),
    vector3(60.92, -1265.36, 28.67),
    vector3(456.05, -1633.11, 28.62),
    vector3(10.48, -1742.05, 28.63),
    vector3(192.6, -2404.6, 6.47),
    vector3(741.94, -2467.22, 19.58),
    vector3(2402.21, -693.01, 62.45),
}