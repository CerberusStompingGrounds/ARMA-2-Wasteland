//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray = [
	["AK-74","AK_74",50,25],
	["AK-107 Kobra","AK_107_kobra",75,35],
	["AKM","AK_47_M",75,35],
    ["M16A4","M16A4",75,35],
    ["M4A1","M4A1",50,25],
    ["M4A1 CCO","M4A1_Aim",100,55],
    ["M1014","M1014",50,25],
    ["Saiga 12K","Saiga12K",100,55],
    ["M249","M249_EP1",250,120],
    ["Mk_48 Mod","Mk_48",250,140],
    ["M240","M240",250,120],
    ["Pecheneg","Pecheneg",250,100],
    ["RPG-7","RPG7V",300,130],
    ["SMAW","SMAW",300,175],
    ["Stinger","Stinger",1000,550],
    ["Javelin","Javelin",1500,750],
    ["Mk12 SPR","M4SPR",200,120],
	["M24","M24",350,200],
    ["Mk17 Sniper","SCAR_H_LNG_Sniper",500,233],
    ["Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",750,455],
    ["M110 NV","M110_NVG_EP1",1000,666],
    //["Mk17 Sniper TWS","SCAR_H_STD_TWS_SD",1500,755],
    ["M107","m107",2000,850]
    //["M110 TWS","M110_TWS_EP1",2500,1000]	
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["30Rnd AK","30Rnd_545x39_AK",10],
	["AKM Mag","30Rnd_762x39_AK47",10],
	["30Rnd. STANAG","30Rnd_556x45_Stanag",10],
    ["30Rnd. STANAG SD","30Rnd_556x45_StanagSD",30],
    ["Mk17 Mag.","20Rnd_762x51_B_SCAR",25],
	["Mk17 SD Mag.","20Rnd_762x51_SB_SCAR",50],
	["10Rnd. M107","10Rnd_127x99_m107",50],
	["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",10],
	["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",10],
	["200Rnd. M249 Belt","200Rnd_556x45_M249",50],
	["100Rnd. M240","100Rnd_762x51_M240",25],
	["PKM Mag.","100Rnd_762x54_PK",25],
    ["PG-7V.","PG7V",85],
    ["SMAW-HEAA","SMAW_HEAA",100],
    ["Stinger Ammo","Stinger",225],
    ["Javelin Ammo","Javelin",250],
	["Laser Batteries","Laserbatteries",200]
];

//baseArray
baseArray = [
	["Wall (Long Tall)","Base_WarfareBBarrier10xTall",1000],
	["Wall (Long)","Base_WarfareBBarrier10x",1000],
	["Hesco Barrier (large)","Land_HBarrier_large",1000],
	["Hesco Barrier","Land_HBarrier5",1000],
	["Hesco Barrier (short)","Land_HBarrier3",1000],
	["Warfare Field Hospital","CDF_WarfareBFieldhHospital",2000],
	["Barrack","Barrack2",2000],
	["Warfare Depot","WarfareBDepot",3000],
	["MASH","MASH",3000],
	["USMC Warfare BMG Nest M240","USMC_WarfareBMGNest_M240",5000],
	["TOW TriPod","TOW_TriPod_US_EP1",5000],
	["KORD","KORD_high_UN_EP1",5000],
	["M2 Static MG","M2StaticMG",5000],
	["Igla AA Pod","Igla_aa_pod_east",5000],
	["Grenade Launcher","AGS_CDF",5000],
	["Stinger Pod","Stinger_Pod",5000]
];
//Gun Store Equipment List
//Text name, classname, buy cost
HeliArray = [
	["MH-60S","MH60S",25000],
	["Mi-17","Mi17_CDF",25000],
	["Mi-17-IVA Medevac [ChDKZ]","Mi17_medevac_Ins",25000],
	["UH-1Y [USMC]","UH1Y",25000],
	["MV-22 [USMC]","MV22",25000],
	["UH-60M [US]","UH60M_EP1",25000],
	["AH-6J [US]","AH6J_EP1",25000],
	["Chinook HC4 [BAF]","CH_47F_BAF",25000],
	["Merlin HC3 [BAF]","BAF_Merlin_HC3_D",25000],
	["AH-64D [US]","AH64D_EP1",50000],
	["Mi-24D [Takistan Army","Mi24_D_TK_EP1",50000],
	["AH-1Z [USMC]","AH1Z",50000],
	["AH-64D [USMC]","AH64D",50000],
	["Ka-52 (Black)","Ka52Black",50000],
	["Mi-24V [Russia]","Mi24_V",50000],
	["AH-1 [BAF]","BAF_Apache_AH1_D",50000],
	["AH-11 Wildcat [BAF]","AW159_Lynx_BAF",50000]
];

//Text name, classname, buy cost
vehicleArray = [
	["Ural (ZU-23) [CDF]","Ural_ZU23_CDF",25000],
	["BM21 GRAD [CDF]","GRAD_CDF",25000],
	["MTVR (Fuel)","MtvrRefuel",25000],
	["MTVR (Ammo)","MtvrReammo",25000],
	["MTVR (Repair)","MtvrRepair",25000],
	["2S6M Tunguska [Russia] ","2S6M_Tunguska",25000],
	["ZSU-23 Shilka [Takistan Army]","ZSU_TK_EP1",25000],
	["M270 MLRS (USMC]","MLRS",25000],
	["M1A2 TUSK [USMC]","M1A2_TUSK_MG",50000],
	["T-72 [CDF]","T72_CDF",50000],
	["T-90 [Russia]","T90",50000],
	["FV510 Warrior [BAF]","BAF_FV510_D",50000],
	["M1A1 [US]","M1A1_US_DES_EP1",50000],
	["M1A2 TUSK [US]","M1A2_US_TUSK_MG_EP1",50000],
	["T-55 [Takistan Army]","T55_TK_EP1",50000]
];

planeArray = [
	["An-2 (Civilian)","An2_2_TK_CIV_EP1",25000],
	["MQ-9 [US]","MQ9PredatorB_US_EP1",75000],
	["F-35B [USMC]","F35B",75000],
	["C-130J [US]","C130J_US_EP1",75000],
	["L-39ZA [Takistan Army]","L39_TK_EP1",75000],
	["AV-8B [USMC]","AV8B",75000],
	["Su-34 [Russia]","Su34",75000],
	["Su-39 [Russia] ","Su39",75000],
	["Su-25 [Takistan Army]","Su25_TK_EP1",75000],
	["A-10 [US]","A10_US_EP1",75000]
];

//Heli Store  List
//Text name, classname, buy cost
accessoriesArray = [
	["Range Finder","Binocular_Vector",500],
	["NV Goggles","NVGoggles",100],
    ["GPS","ItemGPS", 90],
	["Laser Designator", "Laserdesignator",750]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",3000,1500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]  
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_0",600,"Chernogorsk"],
		["Town_1",200,"Prigorodki"],
		["Town_2",200,"Pusta"],
		["Town_3",600,"Elektro"],
		["Town_4",200,"Kamyshovo"],			
		["Town_5",200,"Tulga"],
		["Town_6",250,"Solnychniy"],
		["Town_7",200,"Nizhnoye"],
		["Town_8",500,"Berezino City"],
		["Town_9",500,"Berezino Dock"],
		["Town_10",250,"Khelm"],
		["Town_11",200,"Olsha"],
		["Town_12",350,"Krasnostav"],
		["Town_13",250,"Gvozdno"],
		["Town_14",300,"Grishino"],
		["Town_15",200,"Petrovka"],
		["Town_16",200,"Lopatino"],
		["Town_17",300,"Vybor"],
		["Town_18",250,"Pustoshka"],
		["Town_19",200,"Myshkino"],
		["Town_20",200,"Sosnovka"],
		["Town_21",300,"Zelenogorsk"],
		["Town_22",200,"Pavlovo"],
		["Town_23",200,"Kamenka"],
		["Town_24",200,"Komarovo"],
		["Town_25",200,"Balota"],
		["Town_26",200,"Bor"],
		["Town_27",200,"Drozhino"],
		["Town_28",200,"Kozlovka"],
		["Town_29",200,"Pulkovo"],
		["Town_30",200,"Pogorevka"],
		["Town_31",200,"Rogovo"],
		["Town_32",200,"Kabanino"],
		["Town_33",300,"StarySobor"],
		["Town_34",200,"NovySobor"],
		["Town_35",200,"Vyshnoye"],
		["Town_36",250,"Mogilevka"],
		["Town_37",200,"Guglovo"],
		["Town_38",350,"Gorka"],
		["Town_39",200,"Shakhovka"],
		["Town_40",200,"Staroye"],
		["Town_41",200,"Msta"],
		["Town_42",200,"Dolina"],
		["Town_43",200,"Orlovets"],
		["Town_44",200,"Polana"],
		["Town_45",200,"Nadezhdino"],
		["Town_46",200,"Dubrovka"]
];
cityLocations = [];
