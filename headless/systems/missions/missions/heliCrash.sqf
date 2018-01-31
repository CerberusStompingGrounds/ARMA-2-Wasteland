[
// Init. Result of this will be passed to all
// following functions as _this select 0.
{[false, _this select 1] call (_this select 0);},

// Name
'Helicopter Crash',

// Description
{
	format['
		A helicopter was shot down near %1. The exact location of the crash site is unknown.
		OPFOR recovery teams have been dispatched to find it. Locate and secure the crash site.',
		([(_this select 1)] call BL_fnc_nearestCity) select 0
	]
},

// Mission location. Array or code
BL_fnc_missionRandomField,

// Function to call to start the mission
{
	private ['_code', '_loc', '_crashSite'];
	_code = _this select 1;
	_loc = _this select 2;
	
	if ( count _loc == 2 ) then {
		_loc set [2, 0];
	};

	_crashSite = [];
	
	while { true } do {
		_match = (selectBestPlaces [
			[_loc, 100 + random 500, random 359] call BIS_fnc_relPos,
			50,
			"meadow - (hills + sea/2)",
			1,
			1
		]) select 0;
		
		if ( (_match select 1) > 0 ) exitwith {
			_crashSite = _match select 0;
		};
	};
	
	_crash = createVehicle ['Mi17Wreck', _crashSite, [], 0, "NONE"];
	_crash setDir (random 359);
	_crash setPos getPos _crash;
	
	[_crash] call BL_fnc_trackVehicle;
	
	[[_crash, [0,0,0]], "BigDestructionSmoke", -1, [], _code] call BL_fnc_particleSourceCreateServer;
	
	_units = [];
	_groups = [
		["RU_Policeman", "RU_Policeman", "RU_Policeman", "RU_Policeman", "RU_Policeman"],
		["RU_Policeman", "RU_Policeman", "RU_Policeman", "RU_Policeman"]
	];
	
	// Recovery teams
	for "_i" from 0 to 2 do {
		_grp = createGroup civilian;
		_leader = _grp createUnit [(_groups select _i select 0), _crashSite, [], 0, "FORM"];
		_leader addMagazine "Strela";
		_leader addWeapon "Strela";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addWeapon "AKS_74_U";
		_man2 = _grp createUnit [(_groups select _i select 1), _crashSite, [], 0, "FORM"];
		_man2 addMagazine "30Rnd_556x45_G36";
		_man2 addWeapon "m8_tws";
		_man3 = _grp createUnit [(_groups select _i select 2), _crashSite, [], 0, "FORM"];
		_man3 addMagazine "NLAW";
		_man3 addMagazine "NLAW";
		_man3 addWeapon "BAF_NLAW_Launcher";
		_man3 addMagazine "20Rnd_762x51_DMR";
		_man3 addWeapon "M14_EP1";
		_man4 = _grp createUnit [(_groups select _i select 2), _crashSite, [], 0, "FORM"];
		_man4 addMagazine "30Rnd_762x39_AK47";
		_man4 addMagazine "30Rnd_762x39_AK47";
		_man4 addWeapon "AK_47_M";
		_man5 = _grp createUnit [(_groups select _i select 2), _crashSite, [], 0, "FORM"];
		_man5 addMagazine "20Rnd_762x51_DMR";
		_man5 addMagazine "20Rnd_762x51_DMR";
		_man5 addWeapon "DMR";
		_man6 = _grp createUnit [(_groups select _i select 2), _crashSite, [], 0, "FORM"];
		_man6 addMagazine "20Rnd_B_AA12_Pellets";
		_man6 addMagazine "20Rnd_B_AA12_Pellets";
		_man6 addWeapon "AA12_PMC";

		_grp allowFleeing 0;
		_grp setCombatMode "WHITE";
		_grp setBehaviour "AWARE";
		
		_wp = _grp addWaypoint [_crashSite, 50];
		_wp setWaypointType "SAD";
		_grp setCurrentWaypoint _wp;
		
		_groups set [_i, _grp];
		_units = _units + (units _grp);
	};
	
	[_units] call BL_fnc_statTrackAIUnits;
	[_loc, _units] call BL_fnc_aliveObjectCounter;
	
	_reward = [call BL_fnc_missionsConfig, 'recoveryMissionReward'] call BL_fnc_hashGet;
	
	if ( isNil "_reward" ) then {
		_rewards = [
			"Box_East_AmmoVeh_F",
			"Box_East_WpsLaunch_F",
			"IG_supplyCrate_F",
			"Box_East_Grenades_F",
			"Box_East_WpsSpecial_F",
			"Box_East_AmmoOrd_F"
		];
		
		for "_i" from 0 to 2 do {
			_item = _rewards select floor random count _rewards;
			_rewards = _rewards - [_item];
			
			_reward = createVehicle [_item, _crashSite, [], 0, "NONE"];
			[_reward, 'reward'] call BL_fnc_trackVehicle;
		};
	}
	else {
		[_crashSite] call _reward;
	};
	
	_allDeadAt = -1;
	while { true } do {
		sleep 5;
	
		_nearUnits = [_crashSite, 30] call BL_fnc_nearUnits;
		_unitsInArea = [_crashSite, 500] call BL_fnc_nearUnits;
		_aliveUnits = {alive _x && _x distance _crashSite <= 100} count _units;
		
		{
			_unit = _x;
			{
				_x reveal [_unit, 4];
			} count _groups;
			true
		} count _unitsInArea;

		if ( _aliveUnits == 0 && _allDeadAt == -1 ) then {
			_allDeadAt = diag_tickTime;
		};
		
		if ( (count _nearUnits > 0 && _aliveUnits == 0) || (_allDeadAt > 0 && diag_tickTime - _allDeadAt > (5*60)) ) exitwith {
			[_code] call BL_fnc_missionDone;
		};		
	};
	
	[_crash, _units, _code] spawn {
		while { !isNull (_this select 0) || {alive _x} count (_this select 1) > 0} do {
			sleep 60;
		
			if !( [[getPosATL (_this select 0), 1000] call BL_fnc_nearUnits, (_this select 0)] call BL_fnc_hasLOS ) then {
				deleteVehicle (_this select 0);
				[(_this select 2)] call BL_fnc_particleSourceDeleteServer;
			};
			
			{
				// No one within 200m and no one within 1000m with LOS.
				if !( count ([getPosATL _x, 200] call BL_fnc_nearUnits) == 0 && !([[getPosATL _x, 1000] call BL_fnc_nearUnits, _x] call BL_fnc_hasLOS) ) then {
					deleteVehicle _x;
				};
			} count (_this select 1);
			
			true
		};
	};
}];