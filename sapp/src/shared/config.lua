-- BEGIN_IMPORT
-- import core.objects.Location end
-- import core.objects.Profession end
-- import core.objects.Weapon end
-- END_IMPORT

FREE_GUN_TO_DISTRIBUTE = "remington"
FREE_CAR_TO_DISTRIBUTE = "countach"
FREE_MONEY_TO_DISTRIBUTE = 10000

MAX_MONEY = 9999999
MAX_KARMA = 2.0
MAX_AMMO_PRICE = 750
LOADOUT_CHANGE_PRICE = 500



LOCATIONS = {
    ["dealership_1"] = Location:new():setName("Camel"):setType("dealership"),
    ["dealership_2"] = Location:new():setName("yonder"):setType("anarchist dealership"),
    ["garage_5"] = Location:new():setName("Camel"):setType("garage"),
    ["apartments"] = Location:new():setName("Camel"):setType("apartments"),
    ["gunstore_3"] = Location:new():setName("Camel"):setType("ammunation"),
    ["garage_1"] = Location:new():setName("Cottontail"):setType("garage"),
    ["garage_2"] = Location:new():setName("Foxtown"):setType("garage"),
    ["garage_3"] = Location:new():setName("Scropion Claw"):setType("garage"), 
    ["garage_4"] = Location:new():setName("Scropion Tail"):setType("garage"),
    ["gunstore_1"] = Location:new():setName("Foxtown"):setType("ammunation"),
    ["gunstore_2"] = Location:new():setName("Scropion"):setType("ammunation"),
    ["recruiter"] = Location:new():setName("Camel"):setType("recruiter")
}

PROFESSIONS = {
    ["sheriff"] = Profession:new():setKey("sheriff"):setTitle("Sheriff"):setSalary(10000),
    ["deputy"] = Profession:new():setKey("deputy"):setTitle("Deputy"):setSalary(7500),
    ["officer"] = Profession:new():setKey("officer"):setTitle("Officer"):setSalary(5000),
    ["civilian"] = Profession:new():setKey("civilian"):setTitle("Civilian"):setSalary(1500),
    ["criminal"] = Profession:new():setKey("criminal"):setTitle("Criminal"):setSalary(0)
}

COMMAND_NAMES = {
    ["drive"] = "drive",
    ["park"] = "park",
    ["pay"] = "pay",
    ["save"] = "save",
    ["buy"] = "buy",
    ["drop"] = "drop",
    ["wallet"] = "wallet"
}

WEAPONS = {
    ["remington"] = Weapon:new():setKey("remington"):setLabel("Remington"):setPrice(800):setTagReference("gta_halo\\weapons\\remington 870\\remington870"),
    ["m249"]= Weapon:new():setKey("m249"):setLabel("M-249 Machine Gun"):setPrice(5000):setTagReference("gta_halo\\weapons\\m249\\m249saw"),
    ["mg36"] = Weapon:new():setKey("mg36"):setLabel("MG-36"):setPrice(4000):setTagReference("gta_halo\\weapons\\mg36\\mg36"),
    ["benelli"] = Weapon:new():setKey("benelli"):setLabel("Benelli"):setPrice(1000):setTagReference("gta_halo\\weapons\\benelli_shotgun\\benelli_shotgun"),
    ["g36"] = Weapon:new():setKey("g36"):setLabel("G-36"):setPrice(1400):setTagReference("gta_halo\\weapons\\cod4\\weapons\\g36\\g36"),
    ["m16"] = Weapon:new():setKey("m16"):setLabel("M-16"):setPrice(1500):setTagReference("gta_halo\\weapons\\cod4\\weapons\\m16\\m16"),
    ["mp5sd"] = Weapon:new():setKey("mp5sd"):setLabel("MP5-SD"):setPrice(1000):setTagReference("gta_halo\\weapons\\cod4\\weapons\\mp5\\mp5sd"),
    ["aa12"] = Weapon:new():setKey("aa12"):setLabel("AA-12"):setPrice(2000):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\aa12\\aa12"),
    ["as50"] = Weapon:new():setKey("as50"):setLabel("AS-50"):setPrice(2000):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\as-50\\as-50"),
    ["g17"] = Weapon:new():setKey("g17"):setLabel("G-17"):setPrice(400):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\g17\\g17"),
    ["kdw"] = Weapon:new():setKey("kdw"):setLabel("KDW"):setPrice(600):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\kdw\\gta_kdw"),
    ["m4"] = Weapon:new():setKey("m4"):setLabel("M-4"):setPrice(1700):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\m4\\m4"),
    ["mp5k"] = Weapon:new():setKey("mp5k"):setLabel("MP5-K"):setPrice(900):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\mp5k\\mp5k"),
    ["revolver"] = Weapon:new():setKey("revolver"):setLabel("Revolver"):setPrice(1200):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\mr96\\mr96revolver"),
    ["ak47"] = Weapon:new():setKey("ak47"):setLabel("AK-47"):setPrice(1600):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\ak47"),
    ["sniper"] = Weapon:new():setKey("sniper"):setLabel("Sniper Rifle"):setPrice(2500):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\sniper"),
    ["uzi"] = Weapon:new():setKey("uzi"):setLabel("Uzi"):setPrice(800):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\uzi"),
    ["m27"] = Weapon:new():setKey("m27"):setLabel("M-27"):setPrice():setTagReference("gta_halo\\weapons\\sideffect\\weapons\\m27\\m27"),
    ["mrifle"] = Weapon:new():setKey("mrifle"):setLabel("Marksman Rifle"):setPrice(1600):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\marksman_rifle\\marksman_rifle"),
    ["shotgun"] = Weapon:new():setKey("shotgun"):setLabel("Shotgun"):setPrice(1800):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\shotgun\\shotgun"),
    ["smg"] = Weapon:new():setKey("smg"):setLabel("SMG"):setPrice(1100):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\smg\\smg"),
    ["usp"] = Weapon:new():setKey("usp"):setLabel("USP"):setPrice(600):setTagReference("gta_halo\\weapons\\mw\\weapons\\hk-usp\\mw2-usp"),
    ["m4a1"] = Weapon:new():setKey("m4a1"):setLabel("M4-A1"):setPrice(1400):setTagReference("gta_halo\\weapons\\m4a1\\m4a1")
}
