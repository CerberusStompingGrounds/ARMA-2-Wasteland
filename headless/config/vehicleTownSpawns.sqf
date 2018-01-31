_config = [] call BL_fnc_hashCreate;

[_config, "vehicles", [
	// ["class", chance],
	["GAZ_Vodnik_MedEvac", 0.5],
	["HMMWV_Ambulance", 0.8],
	["Offroad_DSHKM_Gue", 0.8],
	["HMMWV_M2", 0.8],
	["LandRover_MG_TK_EP1", 0.7],
	["SUV_PMC", 0.6],
	["ArmoredSUV_PMC", 0.5],
	
	["HMMWV_M1151_M2_CZ_DES_EP1", 0.8],
	["HMMWV_M1151_M2_DES_EP1", 0.6],
	["HMMWV_Armored", 0.8],
	["M113_TK_EP1", 0.4],
	["HMMWV_TOW", 0.4],
	["HMMWV_MK19", 0.5],
	["KamazReammo", 0.2],
	["KamazRefuel", 0.2],
	["KamazRepair", 0.2],
	["MTVR", 0.4],
	["MtvrReammo", 0.2],
	["MtvrRepair", 0.2],
	["MtvrRefuel", 0.2],
	
	["BRDM2_ATGM_CDF", 0.6],
	["HMMWV_Avenger", 0.4],
	["AAV", 0.5],
    ["BRDM2_INS", 0.5],
    ["BTR40_MG_TK_GUE_EP1", 0.5],
    ["BTR60_TK_EP1", 0.7],
    ["M1126_ICV_M2_EP1", 0.6],
    ["M1126_ICV_mk19_EP1", 0.6],
    ["M1128_MGS_EP1", 0.5],
	["Ural_ZU23_TK_EP1", 0.5],
    ["M1135_ATGMV_EP1", 0.5],
    ["BAF_Jackal2_L2A1_w", 0.5],
	["HMMWV_M998_crows_M2_DES_EP1", 0.5],
    ["Offroad_SPG9_TK_GUE_EP1", 0.5],
	["GAZ_Vodnik", 0.5],
	["BTR90", 0.5],
    ["LAV25", 0.5],
	["ZSU_CDF", 0.6],
	["BMP2_UN_EP1", 0.5],
	["BMP2_CDF", 0.5],
    ["BMP3", 0.4],
	["T34", 0.4],
	["T55_TK_EP1", 0.3],
	["GAZ_Vodnik_HMG", 0.5]
	
]] call BL_fnc_hashSet;

[_config, "minPerCity", 3] call BL_fnc_hashSet;
[_config, "maxPerCity", 4] call BL_fnc_hashSet;
[_config, "vehiclesPerMeter", 20000] call BL_fnc_hashSet;

private ['_randomVests'];
_randomVests = [
	"V_BandollierB_khk",
	"V_BandollierB_rgr",
	"V_BandollierB_blk",
	"V_BandollierB_oli",
	"V_TacVestIR_blk"
];

[_config, "vehicleCargo", [
	/*
	// Group
	[
		[
			// Weapons
		],
		[
			// Magazines
		],
		[
			// Items
		]
	]
	*/
	[
		[
			[["AK_47_M","AK_47_S","Sa58V_EP1"], 1, 1]
		],
		[
			["30Rnd_762x39_AK47", 1, 4]
		]
	],
	[
		[
			[["AK_74","AKS_74_U"], 1, 1]
		],
		[
			["30Rnd_545x39_AK", 1, 4]
		]
	],
	[
		[
			[[
				"M16A2",
				"M4A1",
				"SCAR_L_CQC",
				"SCAR_L_CQC_CCO",
				"M8_sharpshooter",
				"m8_tws"
			], 1, 1]
		],
		[
			["30Rnd_556x45_Stanag", 1, 4]
		]
	],
	[
		[
			["SCAR_L_CQC_CCO_SD", 1, 1]
		],
		[
			["30Rnd_556x45_StanagSD", 1, 4]
		]
	],
	[
		[
			["RPG7V", 1, 1]
		],
		[
			["PG7V", 1, 4]
		]
	]
]] call BL_fnc_hashSet;

[_config, "maxOverPop", 20] call BL_fnc_hashSet;

_config