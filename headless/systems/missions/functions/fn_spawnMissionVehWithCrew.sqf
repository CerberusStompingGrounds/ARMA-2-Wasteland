private ['_group', '_class', '_loc', '_units', '_bounty', '_veh', '_createdUnits', '_turrets', '_cb'];
_group = [_this, 0, grpNull, [grpNull]] call BL_fnc_param;
_class = [_this, 1, "", [""]] call BL_fnc_param;
_loc   = [_this, 2, [0,0,0], [[]], [2,3]] call BL_fnc_param;
_units = [_this, 3, [], [[]]] call BL_fnc_param;
_bounty = [_this, 4, BL_aiBountyAmount, [0]] call BL_fnc_param;
_cb = [_this, 5, {}, [{}]] call BL_fnc_param;

_veh = [_class, _loc] call BL_fnc_safeVehicleSpawn;
[_veh, 'reward'] call BL_fnc_trackVehicle;

_turrets = count (configFile >> "CfgVehicles" >> _class >> "Turrets");

// If a list of units to use wasn't provided add riflemen for driver/turret(s)
if ( count _units == 0 ) then {
	for "_i" from 0 to (1 + _turrets-1) do {
		_units set [_i, "RU_Soldier"];
	};
};

[_group, _loc, _units, _veh, _turrets, _bounty, _cb] spawn {
	_group   = _this select 0;
	_loc     = _this select 1;
	_units   = _this select 2;
	_veh     = _this select 3;
	_turrets = _this select 4;
	_bounty  = _this select 5;
	_cb      = _this select 6;

	_createdUnits = [];
	_createdUnits set [0, (_group createUnit [_units select 0, _loc, [], 0, "CAN_COLLIDE"])];
	
	(_createdUnits select 0) moveInDriver _veh;
	
	for "_i" from 1 to (count _units) - 1 do {
		_createdUnits set [_i, _group createUnit [_units select _i, _loc, [], 0, "CAN_COLLIDE"]];
		sleep 1;
	};
	
	for "_i" from 1 to _turrets do {
		if ( _i > count _createdUnits ) exitwith{};
		(_createdUnits select _i) moveInTurret [_veh, [_i-1]];
	};

	for "_i" from (1 + _turrets) to (count _createdUnits) - 1 do {
		(_createdUnits select _i) moveInCargo _veh;
	};
	
	if ( _bounty != BL_aiBountyAmount ) then {
		{ _x setVariable ['bounty', _bounty, true] } count _createdUnits;
	};
	
	[_createdUnits] call BL_fnc_statTrackAIUnits;
	
	[_veh, _createdUnits] call _cb;
};

_veh