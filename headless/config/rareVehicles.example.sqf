private ['_config'];
_config = [] call BL_fnc_hashCreate;

[_config, 'air', [12, [
	["I_Heli_Transport_02_F", 1],
	["B_Heli_Light_01_F", 1],
	["O_Heli_Light_02_unarmed_F", 1],
	["B_Heli_Transport_01_F", 1],
	["B_Heli_Transport_01_camo_F", 1],
	["I_Heli_light_03_unarmed_F", 0.5]
]]] call BL_fnc_hashSet;

[_config, 'ground', [12, [
	["B_APC_Wheeled_01_cannon_F", 0.5],
	["B_MRAP_01_gmg_F", 0.8],
	["B_MRAP_01_hmg_F", 0.8],
	["O_MRAP_02_gmg_F", 0.8],
	["O_MRAP_02_hmg_F", 0.8],
	["I_MRAP_03_gmg_F", 0.8],
	["I_MRAP_03_hmg_F", 0.8]
]]] call BL_fnc_hashSet;

_config