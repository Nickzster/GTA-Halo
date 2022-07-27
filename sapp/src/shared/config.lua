-- BEGIN_IMPORT
-- import core.objects.Location end
-- import core.objects.Profession end
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
}

