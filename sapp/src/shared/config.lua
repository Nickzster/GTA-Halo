-- BEGIN_IMPORT
-- import core.objects.Location end
-- import core.objects.Profession end
-- import core.objects.Item end
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
    ["remington"] = Item:new():setKey("remington"):setLabel("Remington"):setPrice(800):setTagReference("gta_halo\\weapons\\remington 870\\remington870"),
    ["m249"]= Item:new():setKey("m249"):setLabel("M-249 Machine Gun"):setPrice(5000):setTagReference("gta_halo\\weapons\\m249\\m249saw"),
    ["mg36"] = Item:new():setKey("mg36"):setLabel("MG-36"):setPrice(4000):setTagReference("gta_halo\\weapons\\mg36\\mg36"),
    ["benelli"] = Item:new():setKey("benelli"):setLabel("Benelli"):setPrice(1000):setTagReference("gta_halo\\weapons\\benelli_shotgun\\benelli_shotgun"),
    ["g36"] = Item:new():setKey("g36"):setLabel("G-36"):setPrice(1400):setTagReference("gta_halo\\weapons\\cod4\\weapons\\g36\\g36"),
    ["m16"] = Item:new():setKey("m16"):setLabel("M-16"):setPrice(1500):setTagReference("gta_halo\\weapons\\cod4\\weapons\\m16\\m16"),
    ["mp5sd"] = Item:new():setKey("mp5sd"):setLabel("MP5-SD"):setPrice(1000):setTagReference("gta_halo\\weapons\\cod4\\weapons\\mp5\\mp5sd"),
    ["aa12"] = Item:new():setKey("aa12"):setLabel("AA-12"):setPrice(2000):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\aa12\\aa12"),
    ["as50"] = Item:new():setKey("as50"):setLabel("AS-50"):setPrice(2000):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\as-50\\as-50"),
    ["g17"] = Item:new():setKey("g17"):setLabel("G-17"):setPrice(400):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\g17\\g17"),
    ["kdw"] = Item:new():setKey("kdw"):setLabel("KDW"):setPrice(600):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\kdw\\gta_kdw"),
    ["m4"] = Item:new():setKey("m4"):setLabel("M-4"):setPrice(1700):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\m4\\m4"),
    ["mp5k"] = Item:new():setKey("mp5k"):setLabel("MP5-K"):setPrice(900):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\mp5k\\mp5k"),
    ["revolver"] = Item:new():setKey("revolver"):setLabel("Revolver"):setPrice(1200):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\mr96\\mr96revolver"),
    ["ak47"] = Item:new():setKey("ak47"):setLabel("AK-47"):setPrice(1600):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\ak47"),
    ["sniper"] = Item:new():setKey("sniper"):setLabel("Sniper Rifle"):setPrice(2500):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\sniper"),
    ["uzi"] = Item:new():setKey("uzi"):setLabel("Uzi"):setPrice(800):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\uzi"),
    ["m27"] = Item:new():setKey("m27"):setLabel("M-27"):setPrice():setTagReference("gta_halo\\weapons\\sideffect\\weapons\\m27\\m27"),
    ["mrifle"] = Item:new():setKey("mrifle"):setLabel("Marksman Rifle"):setPrice(1600):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\marksman_rifle\\marksman_rifle"),
    ["shotgun"] = Item:new():setKey("shotgun"):setLabel("Shotgun"):setPrice(1800):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\shotgun\\shotgun"),
    ["smg"] = Item:new():setKey("smg"):setLabel("SMG"):setPrice(1100):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\smg\\smg"),
    ["usp"] = Item:new():setKey("usp"):setLabel("USP"):setPrice(600):setTagReference("gta_halo\\weapons\\mw\\weapons\\hk-usp\\mw2-usp"),
    ["m4a1"] = Item:new():setKey("m4a1"):setLabel("M4-A1"):setPrice(1400):setTagReference("gta_halo\\weapons\\m4a1\\m4a1")
}


VEHICLES={
    ["911"] = Item:new():setKey("911"):setLabel(""):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\porsche"),
    ["aventador"] = Item:new():setKey("aventador"):setLabel("Lamborghini Aventador"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\aventador"),
    ["ccx"]  = Item:new():setKey("ccx"):setLabel("Koenigsegg CCX"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\ccx"),
    ["charger"] = Item:new():setKey("charger"):setLabel("Dodge Charger"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\charger"),
    ["murcielago"] = Item:new():setKey("murcielago"):setLabel("Lamborghini Murcielago"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\lp640"),
    ["reventon"] = Item:new():setKey("reventon"):setLabel("Lamborghini Reventon"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\reventon"),
    ["rx7"] = Item:new():setKey("rx7"):setLabel("Mazda RX7"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\rx"),
    ["veyron"] = Item:new():setKey("veyron"):setLabel("Bugatti Veyron"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\veyron"),
    ["zonda"] = Item:new():setKey("zonda"):setLabel("Pagani Zonda"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\zonda\\zonda"),
    ["gtr"] = Item:new():setKey("gtr"):setLabel("Nissian GTR"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\gtr\\gtr"),
    ["countach"] = Item:new():setKey("countach"):setLabel("Lamborghini Countach"):setPrice(1000):setTagReference("altis\\crashday\\judge\\judge"),
    ["towtruck"] = Item:new():setKey("towtruck"):setLabel("Junkyard Dog"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v2\\junkyarddog\\junkyarddog"),
	["crimsonfury"] = Item:new():setKey("crimsonfury"):setLabel("Crimson Fury"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v2\\crimsonfury\\crimsonfury"),
	["interceptor"] = Item:new():setKey("interceptor"):setLabel("Interceptor"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\interceptor\\interceptor"),
	["policeferrari"] = Item:new():setKey("policeferrari"):setLabel("Ferrari (Police)"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\police_ferrari\\police_ferrari"),
	["glendalemonster"] = Item:new():setKey("glendalemonster"):setLabel("Glendale (Monster)"):setPrice(1000):setTagReference("vehicles\\glendalemonster\\glendalemonster"),
    ["compact"] = Item:new():setKey("compact"):setLabel("Compact"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v2\\crazy8\\crazy8"),
    ["cwarthog"] = Item:new():setKey("cwarthog"):setLabel("Civilian Warthog"):setPrice(1000):setTagReference("vehicles\\yohog\\yohog"),
    ["bfinjection"] = Item:new():setKey("bfinjection"):setLabel("BF Injection"):setPrice(1000):setTagReference("vehicles\\bfinjection\\bfinjection"),
    ["cleaver"] = Item:new():setKey("cleaver"):setLabel("Cleaver"):setPrice(1000):setTagReference("vehicles\\cleaver\\cleaver"),
    ["clover"] = Item:new():setKey("clover"):setLabel("Clover"):setPrice(1000):setTagReference("vehicles\\clover\\clover"),
    ["glendale"] = Item:new():setKey("glendale"):setLabel("Glendale"):setPrice(1000):setTagReference("vehicles\\glendale\\glendale"),
    ["sabre"] = Item:new():setKey("sabre"):setLabel("Sabre"):setPrice(1000):setTagReference("vehicles\\sabre\\sabre"),
    ["tornado"] = Item:new():setKey("tornado"):setLabel("Tornado"):setPrice(1000):setTagReference("vehicles\\tornado\\tornado"),
    ["virgo"] = Item:new():setKey("virgo"):setLabel("Virgo"):setPrice(1000):setTagReference("vehicles\\virgo\\virgo"),
    ["challenger"] = Item:new():setKey("challenger"):setLabel("Dodge Challenger"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\challenger\\challenger"),
    ["veneno"] = Item:new():setKey("veneno"):setLabel("Lamborghini Veneno"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v3\\veneno_low_poly\\veneno"),
    ["vincent"] = Item:new():setKey("vincent"):setLabel("Vincent"):setPrice(1000):setTagReference("altis\\vehicles\\vincent\\vincent"),
	["katyusha"] = Item:new():setKey("katyusha"):setLabel("Katyusha"):setPrice(1000):setTagReference("altis\\vehicles\\truck_katyusha\\truck_katyusha")
}
