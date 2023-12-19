Config = Config or {}
Config.Debug = true

--[[
    Points - The Sets of points the ped will rotate to / from (MUST START THE FIRST ONE AT 0!!!)
    Scenario - The Scenario that the ped will play when he gets to a point
    Timeout - How long the ped stays at each point (set to -1 if you want the ped to not stop)
    CustomLookAt - Set true if you want the ped to look a specific way at each point
    LookAt - The coords the ped will look at if 'CustomLookAt' is true (Must be the same abount as 'Points')
]]

Config.Routes = {
    ["powerstation"] = {
        ['powerstation_walk'] = {
            Points = {
                [0] = vector3(715.51947, 152.1751, 80.754478),
                [1] = vector3(716.53137, 135.57301, 80.754486),
            },
            Scenario = 'Walk',
            Timeout = -1,
            CustomLookAt = false,
            LookAt = {
                [0] = vector3(123.123, 123.123, 123.123),
                [1] = vector3(123.123, 123.123, 123.123),
            }
        },
        ['powerstation_test'] = {
            Points = {
                [0] = vector3(710.38739, 142.77922, 80.754531),
                [1] = vector3(706.2694, 143.6425, 80.754531),
                [2] = vector3(707.35748, 151.22193, 80.754531),
                [3] = vector3(711.18652, 150.91535, 80.754531),
            },
            Scenario = 'WORLD_HUMAN_BINOCULARS',
            Timeout = 5000,
            CustomLookAt = false,
            LookAt = {
                [0] = vector3(123.123, 123.123, 123.123),
                [1] = vector3(123.123, 123.123, 123.123),
                [2] = vector3(123.123, 123.123, 123.123),
                [3] = vector3(123.123, 123.123, 123.123),
            }
        },
        ['powerstation_test_2'] = {
            Points = {
                [0] = vector3(723.77203, 144.18099, 80.754493),
                [1] = vector3(734.35345, 137.61517, 80.754493),
                [2] = vector3(736.98571, 141.43772, 80.754943),
                [3] = vector3(728.49102, 146.64961, 80.754493),
            },
            Scenario = 'Walk',
            Timeout = 5000,
            CustomLookAt = false,
            LookAt = {
                [0] = vector3(123.123, 123.123, 123.123),
                [1] = vector3(123.123, 123.123, 123.123),
                [2] = vector3(123.123, 123.123, 123.123),
                [3] = vector3(123.123, 123.123, 123.123),
            }
        },
    }
}