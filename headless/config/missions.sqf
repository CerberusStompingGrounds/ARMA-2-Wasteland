private ['_config'];
_config = [] call BL_fnc_hashCreate;

// Amount of missions to run at the same time
[_config, 'count', 4] call CBA_fnc_hashSet;

// How long to wait after a mission is finished before
// starting another.
[_config, 'delay', 1 * 60] call CBA_fnc_hashSet;

// How long to wait before the first mission
// after a restart.
[_config, 'roundStartDelay', 2 * 60] call CBA_fnc_hashSet;

// How long to wait before removing task
[_config, 'taskCleanupDelay', 60] call CBA_fnc_hashSet;

// Missions available for selection
[_config, 'missions', [
	// server\systems\missions\{missionName}.sqf, probability of selecting mission
	['heliCrash', 0.8],
  //['convoyMission', 0.3],
    ['randomVehicle', 1],
  //['invasion', 0.1],
    ['jetMission', 0.1]
]] call CBA_fnc_hashSet;

[_config, 'randomVehicleRewards', [
	["M2A3_EP1",.8],
	["MLRS",.05],
	["AH64D",.1],
	["M1A2_TUSK_MG",.8],
	["2S6M_Tunguska",1],
	["UH1Y",.6],
	["T90",.7],
	["Ka52",.1],
	["GRAD_CDF",.05],
	["AH1Z",.1],
	["BAF_FV510_W",.8],
	["AW159_Lynx_BAF",.2],
	["Mi24_P",.1],
	["M6_EP1",.8]
]] call BL_fnc_hashSet;

[_config, 'randomVehicleBases', [
	[1, [["Land_fort_bagfence_round","11.998923","0.00286865","121.862282","281.49173","-0.00143433"],["Land_fort_bagfence_round","12.363553","0.00286865","-0.380156","213.686325","-0.00143433"],["Stinger_Pod","12.855515","-0.186981","-0.152336","239.117691","0.188416"],["Base_WarfareBBarrier10xTall","13.125058","0.00286865","-170.302185","13.378813","-0.00143433"],["Base_WarfareBBarrier10xTall","13.229572","0.00286865","-70.818733","108.210152","-0.00143433"],["Stinger_Pod","13.317508","-0.187012","120.29364","240.94957","0.188446"],["Base_WarfareBBarrier10xTall","13.534427","0.00286865","94.904915","240.747879","-0.00143433"],["Base_WarfareBBarrier10xTall","13.624479","0.00271606","24.915545","59.622482","-0.00128174"],["Land_HBarrier_large","14.270553","-1.0971375","148.600174","331.831146","1.0985718"],["Land_HBarrier_large","14.534352","-0.99704","-28.0578804","156.233063","0.998474"],["Land_HBarrier_large","15.91538","-0.997131","-6.102395","151.857086","0.998566"],["Land_HBarrier_large","16.094717","-0.997131","123.614853","151.257889","0.998566"],["M2HD_mini_TriPod","17.765177","0.0101318","-133.551132","240.184738","-0.00869751"],["M2HD_mini_TriPod","17.978561","0.0101318","-103.814697","240.261963","-0.00869751"],["M2HD_mini_TriPod","21.893867","0.0101318","9.802641","15.207847","-0.00869751"],["M2HD_mini_TriPod","21.991344","0.0101318","111.920944","102.356621","-0.00869751"]]]
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