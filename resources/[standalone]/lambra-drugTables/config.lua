Config = {}

Config.coreName = "qb-core"
Config.menuName = "qb-menu"

Config.TimePickup = 8000 -- time in ms that will take to pickup the table
Config.DamageWithoutHazmat = 10 --Damage ped will take if not wearing required hazmat table

Config.WaterTempRelief = 2 -- How many degrees water will relief temperature to the system PER USE
Config.FanTempRelief = 1 -- How many degrees the fan will relief temperature to the system PER MINUTE

Config.Tables = {
    --You can add as many drug types with the prop you want
    ["bkr_prop_weed_table_01a"] = {--Index is the prop that will be spawning
        tableItem = "weedtable", --The item used to place the table
        ingredients = {--You can add/remove/change more ingredients
            {item = "weedleaf", requiredAmount = 5}
        },
        rewardItem = {item = "weed_og-kush", amount = 10}, --The final product that the player will receive
        requiredMinCooking = 5, -- minutes that needed to be cooking to get the final product
        overcookMargin = 2, -- requiredMinCooking + overcookMargin value table will explode
        startTemp = 25, --Temperature that table will start with
        tempIncrement = 3, --Raise of temperature of the system PER MINUTE
        minTemp = 20, --If the system goes below that value, it will turn OFF (Flooded system with water)
        maxTemp = 50, --If the system goes up that value, table will explode losing everything
        damage = true -- Turn that to false so it wont give any damage if no hazmat suit is being used
    },
    ["bkr_prop_coke_table01a"] = {--Index is the prop that will be spawning
        tableItem = "coketable", --The item used to place the table
        ingredients = {--You can add/remove/change more ingredients
            {item = "cokeleaf", requiredAmount = 2},
            {item = "druggasoline", requiredAmount = 1},
            {item = "drugsolvent", requiredAmount = 3}
        },
        rewardItem = {item = "cokebaggy", amount = 10}, --The final product that the player will receive
        requiredMinCooking = 5, -- minutes that needed to be cooking to get the final product
        overcookMargin = 2, -- requiredMinCooking + overcookMargin value table will explode
        startTemp = 25, --Temperature that table will start with
        tempIncrement = 3, --Raise of temperature of the system PER MINUTE
        minTemp = 20, --If the system goes below that value, it will turn OFF
        maxTemp = 50, --If the system goes up that value, table will explode losing everything
        damage = true -- Turn that to false so it wont give any damage if no hazmat suit is being used
    },
    ["bkr_prop_meth_table01a"] = {--Index is the prop that will be spawning
        tableItem = "methtable", --The item used to place the table
        ingredients = {--You can add/remove/change more ingredients
            {item = "rawmeth", requiredAmount = 1},
            {item = "drugsulfur", requiredAmount = 3},
            {item = "drugphosphorus", requiredAmount = 2}
        },
        rewardItem = {item = "meth", amount = 10}, --The final product that the player will receive
        requiredMinCooking = 5, -- minutes that needed to be cooking to get the final product
        overcookMargin = 2, -- requiredMinCooking + overcookMargin value table will explode
        startTemp = 25, --Temperature that table will start with
        tempIncrement = 3, --Raise of temperature of the system PER MINUTE
        minTemp = 20, --If the system goes below that value, it will turn OFF
        maxTemp = 50, --If the system goes up that value, table will explode losing everything
        damage = true -- Turn that to false so it wont give any damage if no hazmat suit is being used
    }
}

Config.Hazmat = {
    --https://wiki.rage.mp/index.php?title=Clothes

    [0] = {--MALE
        ["mask"] = 46,
        ["undershirt"] = 62,
        ["torso"] = 16,
        ["tops"] = 67,
        ["legs"] = 40,
        ["shoes"] = 24
    },
    [1] = {--FEMALE
        ["mask"] = 46,
        ["undershirt"] = 43,
        ["torso"] = 17,
        ["tops"] = 61,
        ["legs"] = 40,
        ["shoes"] = 24
    }
}

Config.inventoryDirectory = "qb-inventory/html/images/" --this will get images for the items to display on menu
Config.ownImg = "lambra-drugTables/img/" --this will get images that are located at img folder

Locales = {
    ["openTable"] = "[~g~E~w~] Open table",
    ["checkStats"] = "Check stats",
    ["pickupTable"] = "Pickup Table",
    ["checkStatsTitle"] = "Check stats",
    ["tableStatsTitle"] = "Table stats",
    ["gettingDizzy"] = "Im feeling weird",
    ["ingredients"] = "Check recipe",
    ["notInstalled"] = "Not installed",
    ["installed"] = "Installed",
    ["fanStat"] = "Fan: ",
    ["setupFan"] = "Click to setup fan",
    ["noItems"] = "You dont have the required items",
    ["waterStat"] = "Water",
    ["waterDescription"] = "Click to pour some water",
    ["timeCookedStat"] = "Time Cooked: ",
    ["timeMinutes"] = " min",
    ["tempStat"] = "System Temperature: ",
    ["tempUnit"] = "°C",
    ["tableON"] = ": Working",
    ["tableOFF"] = ": Not working",
    ["tableFinished"] = ": Finished",
    ["recipeTitle"] = "Recipe ingredients",
    ["ingredientAmount"] = "Required amount: ",
    ["startTable"] = "Start the process",
    ["waterFlooded"] = ": Water Flooded",
    ["warnWaterFlooded"] = "You just flooded the system",
    ["waterTempDecreased"] = "Systems tempreature decreased",
    ["turningSystemOn"] = "Turning ON the system",
    ["tableTurnedOn"] = "System is now working",
    ["pouringWater"] = "Pouring some water",
    ["collectFinalTitle"] = "Check the product",
    ["collectNotReady"] = "Hmmm, seems like it's not ready yet",
    ["checkingFinal"] = "Checking the mixture",
    ["collectSuccess"] = "Finally, it was time..."
}

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 100)
    ClearDrawOrigin()
end