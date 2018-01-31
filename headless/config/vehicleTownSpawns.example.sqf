_config = [] call BL_fnc_hashCreate;

[_config, "vehicles", [
	// ["class", chance],
	["C_Hatchback_01_F", 1],
	["C_Offroad_01_F", 1],
	["B_G_Offroad_01_F", 1],
	["B_G_Offroad_01_armed_F", 0.5],
	["C_SUV_01_F", 0.7],
	["C_Quadbike_01_F", 1],
	["C_Hatchback_01_sport_F", 0.1],
	["C_Van_01_fuel_F", 1],
	["B_G_Van_01_fuel_F", 1],
	["B_Truck_01_mover_F", 1],
	["B_G_Van_01_transport_F", 1],
	["C_Van_01_box_F", 1]
]] call BL_fnc_hashSet;

[_config, "minPerCity", 3] call BL_fnc_hashSet;
[_config, "maxPerCity", 20] call BL_fnc_hashSet;
[_config, "vehiclesPerMeter", 15000] call BL_fnc_hashSet;
[_config, "maxOverPop", 20] call BL_fnc_hashSet;

[_config, "vehicleCargo", [
	[
		[
			["arifle_TRG20_Holo_F", 1, 1]
		],
		[
			["30Rnd_556x45_Stanag", 1, 5],
			["HandGrenade", 0, 2]
		],
		
		[
		]
	],
	[
		[
			["arifle_Mk20C_F", 1, 1],
			["Binocular", 1, 1]
		],
		[
			["30Rnd_556x45_Stanag", 1, 5]
		],
		
		[
			["Optic_Aco", 1, 1]
		]
	]
]] call BL_fnc_hashSet;

_config