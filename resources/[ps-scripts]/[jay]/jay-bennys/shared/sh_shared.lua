Config = {}

Config.RepairTime = 15 --[[ In Seconds ]]  * 1000

Config.Showzone = false

Config.Pay = true

Config.Price = 2500

Config.RepairZones = {
    [1] = {
        name = "police_repair", 
        coords = vector3(463.02, -1017.18, 27.42),
        length = 9.0,
        width = 7.0,
        data = {
            debugPoly = Config.Showzone,
            heading = 0,
            minZ = 26.42,
            maxZ = 30.42,
            data = {}
        }
    }
}
