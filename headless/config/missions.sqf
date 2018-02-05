private ['_config'];
_config = [] call BL_fnc_hashCreate;

// Amount of missions to run at the same time
[_config, 'count', 4] call CBA_fnc_hashSet;

// How long to wait after a mission is finished before
// starting another.
[_config, 'delay', 15 * 60] call CBA_fnc_hashSet;

// How long to wait before the first mission
// after a restart.
[_config, 'roundStartDelay', 10 * 60] call CBA_fnc_hashSet;

// How long to wait before removing task
[_config, 'taskCleanupDelay', 60] call CBA_fnc_hashSet;

// Missions available for selection
[_config, 'missions', [
	// server\systems\missions\{missionName}.sqf, probability of selecting mission
  //['heliCrash', 0.1],
	['convoyMission', 0.2],
	['randomVehicle', 1],
  //['invasion', 0.1],
	['jetMission', 0.2]
]] call CBA_fnc_hashSet;

[_config, 'randomVehicleRewards', [
	["M2A3_EP1",.8],
	["MLRS",.02],
	["AH64D",.1],
	["M1A2_TUSK_MG",.8],
	["2S6M_Tunguska",.8],
	["UH1Y",.6],
	["T90",.7],
	["Ka52",.1],
	["GRAD_CDF",.02],
	["AH1Z",.1],
	["BAF_FV510_W",.8],
	["Mi24_P",.1],
	["Mi24_D",.1],
	["BTR90",.5],
	["M6_EP1",.8],
	["D30",.02],
	["M119",.5]
	
]] call BL_fnc_hashSet;

[_config, 'randomVehicleBases', [
	[1, [["BAF_L2A1_Tripod_D","11.28882","0.20871","128.613373","149.935364","0.207275"],["Base_WarfareBBarrier10xTall","12.935658","-1.298553","129.217133","155.17804","-1.299988"],["Base_WarfareBBarrier10xTall","13.0652695","-1.298553","81.190346","59.811966","-1.299988"],["Base_WarfareBBarrier10xTall","13.82412","1.301422","80.0622406","59.791111","1.299988"],["Land_fort_bagfence_round","14.613735","0.00143433","-144.363068","13.78512","0"],["BAF_L2A1_Tripod_D","15.104724","0.20871","17.0302849","53.480068","0.207275"],["Base_WarfareBBarrier10xTall","15.857741","-1.298553","-166.250427","149.25824","-1.299988"],["Stinger_Pod","16.306522","-0.188446","-146.232849","336.930603","-0.18988"],["Base_WarfareBBarrier10xTall","16.3689","-1.298553","18.234974","60.507755","-1.299988"],["Base_WarfareBBarrier10xTall","16.59783","1.401398","-167.495331","328.6828","1.399963"],["Base_WarfareBBarrier10xTall","18.0998917","-1.298523","-33.328674","149.963638","-1.299957"],["Land_GuardShed","18.248657","0.00143433","-53.930698","148.736008","0"],["Land_fort_bagfence_round","18.373083","0.00146484","-147.895523","195.378708","0.05176"],["BAF_L2A1_Tripod_D","18.570566","0.20871","-52.653141","327.52951","0.207275"],["Base_WarfareBBarrier10xTall","18.643034","-1.298553","-13.830243","150.185562","-1.299988"],["Base_WarfareBBarrier10xTall","18.791521","1.401398","-18.293711","329.729095","1.399963"],["Base_WarfareBBarrier10xTall","19.431816","-1.298553","-132.934967","59.583252","-1.299988"],["Base_WarfareBBarrier10xTall","21.126659","1.401428","-90.2463","60.203732","1.399994"],["Base_WarfareBBarrier10xTall","22.0629864","-1.298553","-89.619591","59.617805","-1.299988"]]]
]] call BL_fnc_hashSet;

[_config, 'recoveryMissionReward', {
	_crates = [
		["USSpecialWeaponsBox", 1, [
			["CfgWeapons", "m107_TWS_EP1",1],
			["CfgWeapons", "SCAR_H_STD_TWS_SD",2],
			["CfgWeapons", "SCAR_H_CQC_CCO_SD",2],
			["CfgWeapons", "SCAR_H_STD_EGLM_Spect",2],
			["CfgWeapons", "SCAR_H_LNG_Sniper",2],
			["CfgWeapons", "SCAR_L_STD_EGLM_TWS",2],
			["CfgWeapons", "SCAR_H_LNG_Sniper_SD",2],
			["CfgWeapons", "BAF_L85A2_RIS_ACOG",2],
			["CfgWeapons", "M110_TWS_EP1",2],
			["CfgMagazines", "20rnd_762x51_B_SCAR",65],
			["CfgMagazines", "20rnd_762x51_SB_SCAR",65],
			["CfgMagazines", "1Rnd_HE_M203",30],
			["CfgMagazines", "30Rnd_556x45_Stanag",65],
			["CfgMagazines", "10Rnd_127x99_m107",20],
			["CfgMagazines", "1Rnd_Smoke_M203",30]
		]],
		
		["RUSpecialWeaponsBox", 1, [
			["CfgWeapons", "M40A3",2],
			["CfgWeapons", "DMR",2],
			["CfgWeapons", "M24",2],
			["CfgWeapons", "KSVK",2],
			["CfgWeapons", "SVD_CAMO",2],
			["CfgWeapons", "Pecheneg",2],
			["CfgWeapons", "PK",1],
			["CfgWeapons", "Sa58V_CCO_EP1",2],
			["CfgWeapons", "Sa58V_RCO_EP1",2],
			["CfgMagazines", "5Rnd_127x108_KSVK",25],
			["CfgMagazines", "10Rnd_762x54_SVD",75],
			["CfgMagazines", "100Rnd_762x54_PK",20],
			["CfgMagazines", "30Rnd_762x39_AK47",65],
			["CfgMagazines", "5Rnd_762x51_M24",25],
			["CfgMagazines", "20Rnd_762x51_DMR",30],
			["CfgMagazines", "100Rnd_762x54_PK",10]
		]],
		
		["Ammobox_PMC", 1, [
			["CfgWeapons", "BAF_LRR_scoped_W",2],
			["CfgWeapons", "BAF_AS50_scoped",2],
			["CfgWeapons", "BAF_AS50_TWS",1],
			["CfgWeapons", "AA12_PMC",2],
			["CfgWeapons", "M249_m145_EP1",2],	
			["CfgWeapons", "Mk_48",2],
			["CfgMagazines", "10Rnd_127x99_m107",30],
			["CfgMagazines", "5Rnd_127x99_as50",20],
			["CfgMagazines", "20Rnd_B_AA12_HE",5],
			["CfgMagazines", "20Rnd_B_AA12_74Slug",10],
			["CfgMagazines", "20Rnd_B_AA12_Pellets",10],
			["CfgMagazines", "200Rnd_556x45_M249",15],
			["CfgMagazines", "100Rnd_762x51_M240",15],
			["CfgMagazines", "5Rnd_86x70_L115A1",20]
		]],
		
		["USLaunchersBox", 1, [
			["CfgWeapons", "SMAW",5],
			["CfgWeapons", "BAF_NLAW_Launcher",4],
			["CfgWeapons", "M47Launcher_EP1",3],
			["CfgWeapons", "Javelin",4],
			["CfgWeapons", "Stinger",2],
			["CfgMagazines", "Stinger",10],
			["CfgMagazines", "Javelin",10],
			["CfgMagazines", "SMAW_HEAA",10],
			["CfgMagazines", "NLAW",10],
			["CfgMagazines", "Dragon_EP1",20],
			["CfgMagazines", "SMAW_HEDP",10]
		]],
		
		["RULaunchersBox", 1, [
			["CfgWeapons", "RPG7V",3],
			["CfgWeapons", "MetisLauncher",3],
			["CfgWeapons", "MAAWS",4],
			["CfgWeapons", "Strela",2],
			["CfgMagazines", "Strela",8],
			["CfgMagazines", "AT13",10],
			["CfgMagazines", "PG7V",5],
			["CfgMagazines", "PG7VL",5],
			["CfgMagazines", "PG7VR",5],
			["CfgMagazines", "OG7",5],
			["CfgMagazines", "MAAWS_HEAT",10],
			["CfgMagazines", "MAAWS_HEDP",10]
		]],
		
		["BAF_BasicWeapons", 1, [
			["CfgWeapons", "M32_EP1",3],
			["CfgMagazines", "Mine",10],
			["CfgMagazines", "6Rnd_HE_M203",10],
			["CfgMagazines", "6Rnd_SmokeRed_M203",10],
			["CfgMagazines", "6Rnd_Smoke_M203",10],
			["CfgMagazines", "6Rnd_SmokeGreen_M203",10],
			["CfgMagazines", "HandGrenade",10]
			
		]],
		
		["2b14_82mm_GUE", 1, []]
	
	];

	_crashSite = _this select 0;
	for "_i" from 0 to 2 do {
		_crate = [_crates] call BL_fnc_selectRandom;
		_box = createVehicle [_crate select 0, _crashSite, [], 0, "NONE"];
		[_box, 'reward'] call BL_fnc_trackVehicle;
		
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		
		{
			if ( (_x select 0) == "CfgWeapons" ) then {
				_box addWeaponCargoGlobal [_x select 1, _x select 2];
			}
			else {
				_box addMagazineCargoGlobal [_x select 1, _x select 2];
			};
			
			nil
		} count (_crate select 2);
	};
}] call BL_fnc_hashSet;

[_config, 'hostileTakeoverRewards', [
	["M1A2_TUSK_MG",.7],
	["T90",.7],
	["BAF_FV510_W",1],
	["M6_EP1",1],
	["M2A3_EP1",1],
	["2S6M_Tunguska",1]
]] call BL_fnc_hashSet;

[_config, 'jetRewards', [
	["AV8B2", 1],
	["F35B", 1],
	["Su39", 1],
	["Su34", 1]
]] call CBA_fnc_hashSet;

[_config, 'jetMissionLocations', [
	[[845.561,4860.44,0], 165],
	[[4638.28,2576.81,0.00143909], 126],
	[[4138.64,10807,0.00143433], 126],
	[[4979,9751.47,0.00143433], 313],
	[[11830.1,12792.6,0.0014801], 109],
	[[2264.53,5430.98,0.00135803], 256],
	[[3664.56,7961.66,0.00149536], 113],
	[[6153.68,8921.36,0.00170898], 174],
	[[11680.7,10428.7,0.00179291], 147],
	[[10963.9,8513.44,0.00140381], 284],
	[[9849.5,8708.21,0.00137329], 216],
	[[4770.9,4343.79,0.00198364], 163],
	[[6381.14,6658.47,0.0017395], 9],
	[[9754.39,13087.3,0.00158691], 340],
	[[1990.53,11107.9,0.00166321], 176],
	[[9281.47,10994.4,0.00149536], 295],
	[[13226.7,3974.43,0.00144291], 225]
]] call CBA_fnc_hashSet;

_config