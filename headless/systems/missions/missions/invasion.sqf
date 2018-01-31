[
// Init. Result of this will be passed to all
// following functions as _this select 0.
{
	_cities = [] call BL_fnc_findCities;
	_cities = [_cities, [], {
		count ([_x select 1, 3000] call BL_fnc_nearUnits)
	}, "DESCEND"] call BL_fnc_sortBy;

	[(_cities select 0), _this select 1] call (_this select 0);
},

"Invasion",
{
	format["
	OPFOR are trying to regain a foothold in the Area of Operation.
	Multiple well armed and well trained troops, with combat multipliers, are taking over the town of %1.
	Liberate %1 for substantial reward.",
	([(_this select 1)] call BL_fnc_nearestCity) select 0]
},

// Mission location. Array or code
{
	(_this select 0 select 1)
},

// Function to call to start the mission
{
	private ["_initResult","_missionCode","_location","_outerGroup","_unitTypes","_allUnits","_unitPos","_unit","_wp","_soundSource","_rewardOptions","_rewardGroups","_rewards","_i","_class","_rewardLoc","_reward","_subTaskCode","_displayName","_unitsInArea"];
	_initResult  = _this select 0;
	_missionCode = _this select 1;
	_location    = _this select 2;

	_outerGroup = createGroup civilian;
	_unitTypes = [
		"Priest",
		"CIV_EuroMan01_EP1",
		"Rocker2",
		"CIV_EuroMan02_EP1",
		"Priest",
		"Functionay1_EP1",
		"Woodlander3"
	];

	_allUnits = [];

	for "_i" from 0 to 19 do {
		_unitPos = [_location, random (_initResult select 2), random 359] call BIS_fnc_relPos;
		_unitPos set [2, 3000];
		
		_leader = _outerGroup createUnit [(_groups select select floor random count _unitTypes, _unitPos, [], 0, "FORM"];
		_leader addMagazine "Strela";
		_leader addWeapon "Strela";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addMagazine "30Rnd_545x39_AK";
		_leader addWeapon "AKS_74_U";
		//_man2 = _outerGroup createUnit [(_unitTypes select _i select 1), _unitTypes, _unitPos, [], 0, "FORM"];
		_man2 addMagazine "30Rnd_556x45_G36";
		_man2 addWeapon "m8_tws";
		//_man3 = _outerGroup createUnit [(_unitTypes select _i select 2), _unitTypes, _unitPos, [], 0, "FORM"];
		_man3 addMagazine "NLAW";
		_man3 addMagazine "NLAW";
		_man3 addWeapon "BAF_NLAW_Launcher";
		_man3 addMagazine "20Rnd_762x51_DMR";
		_man3 addWeapon "M14_EP1";
		//_man4 = _outerGroup createUnit [(_unitTypes select _i select 2), _unitTypes, _unitPos, [], 0, "FORM"];
		_man4 addMagazine "30Rnd_762x39_AK47";
		_man4 addMagazine "30Rnd_762x39_AK47";
		_man4 addWeapon "AK_47_M";
		[_unit, _unitPos, 0] call BL_fnc_halo;
		_allUnits set [count _allUnits, _unit];
	};
	
	_outerGroup allowFleeing 0;
	_outerGroup setCombatMode "RED";
	_outerGroup setBehaviour "COMBAT";
		
	_wp = _outerGroup addWaypoint [_location, 50];
	_wp setWaypointType "SAD";
	_outerGroup setCurrentWaypoint _wp;
	
	_soundSource = createVehicle ["FlagCarrierSmall", [_location select 0, _location select 1, 50], [], 0, "CAN_COLLIDE"];
	_soundSource enableSimulation false;
	// _soundSource hideObjectGlobal true;
	[_soundSource] call BL_fnc_trackVehicle;
	
	_soundSource spawn {
		for "_i" from 0 to 3 do {
			[[_this, "air_raid"], "BL_fnc_say3D"] call BL_fnc_MP;
			sleep 9;
		};
		
		deleteVehicle _this;
	};
	
	_rewardOptions = [[] call BL_fnc_missionsConfig, 'hostileTakeoverRewards'] call BL_fnc_hashGet;
	if ( isNil "_rewardOptions" ) then {
		_rewardOptions = [
			["O_Truck_03_ammo_F", 1],
			["O_Truck_03_repair_F", 1],
			["O_MRAP_02_gmg_F", 1],
			["O_MRAP_02_hmg_F", 1]
		];
	};
	
	_rewardGroups = [];
	_rewards = [];
	
	for "_i" from 0 to 2 do {
	_group = createGroup civilian;
		_rewardGroups set [_i, _group];

		_class = ([_rewardOptions] call BL_fnc_selectRandom) select 0;
		_rewardLoc = [];
		while { count _rewardLoc == 0 } do {
			_rewardLoc = [_location, random (_initResult select 2), random 359] call BIS_fnc_relPos;
			_rewardLoc = _rewardLoc findEmptyPosition [0, 15, _class];
			
			if ( count _rewardLoc == 0 || {{ _x distance _rewardLoc < 20 } count _rewards > 0} ) then {
				_rewardLoc = [];
			};
		};

		// AI to defend reward
		for "_i" from 0 to 4 do {
			_unitPos = [_rewardLoc, random 50, random 359] call BIS_fnc_relPos;
			_unitPos set [2, 500];
			
			_unit = _group createUnit [_unitTypes select floor random count _unitTypes, _unitPos, [], 0, "FORM"];
			[_unit, _unitPos, 0] call BL_fnc_halo;
			_allUnits set [count _allUnits, _unit];
		};
		
		_group allowFleeing 0;
		_group setCombatMode "RED";
		_group setBehaviour "COMBAT";
		
		_reward = createVehicle [_class, _rewardLoc, [], 0, "CAN_COLLIDE"];
		[_reward, 'reward'] call BL_fnc_trackVehicle;
		[_reward, 1000, 300] call BL_fnc_cargoDrop;
		
		_rewards set [_i, _reward];
		
		// Task
		_subTaskCode = [format['%1Veh%2', _missionCode, _i], _missionCode];
		_displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
		[
			true,
			_subTaskCode,
			["", _displayName, _displayName],
			[_reward, true],
			'CREATED',
			_i,
			false
		] call BL_fnc_taskCreate;
		
		[_reward, _subTaskCode select 0, [_group, _outerGroup], {
			(units (_this select 0 select 0)) join (_this select 0 select 1);
		}] call BL_fnc_failOnKilled;
		
		_reward call BL_fnc_saveOnGetIn;

		[_reward, _group] spawn {
			waitUntil { (getPosATL (_this select 0)) select 2 < 2 };
			waitUntil { { (getPosATL _x) select 2 > 1 } count (units (_this select 1)) == 0 };
			
			_wp = (_this select 1) addWaypoint [getPosATL (_this select 0), 5];
			_wp setWaypointType "HOLD";
			(_this select 1) setCurrentWaypoint _wp;
		};
	};
	
	[_allUnits] call BL_fnc_statTrackAIUnits;
	{ _x setVariable ['bounty', BL_aiBountyAmount * 2] } count _allUnits;
	
	[_location, _allUnits] call BL_fnc_aliveObjectCounter;
	
	while { [_missionCode] call BL_fnc_taskExists && {!([_missionCode] call BL_fnc_taskCompleted)} } do {
		sleep 5;
	
		_unitsInArea = [_location, (_initResult select 2) + 100] call BL_fnc_nearUnits;
		
		{
			_unit = _x;
			_outerGroup reveal [_unit, 2];
			
			{
				_x reveal [_unit, 4];
			} count _rewardGroups;
			true
		} count _unitsInArea;
		
		{
			// Keep reward groups at 5 units as long as possible
			while { count units _x < 5 && count units _outerGroup > 0 } do {
				[(units _outerGroup) select ((count units _outerGroup)-1)] join _x;
			};

			_reward = _rewards select _forEachIndex;
			if ( (count ([getPosATL _reward, 10] call BL_fnc_nearUnits) > 0 && {_reward distance _x <= 25 && alive _x} count _allUnits == 0) ) then {
				_subTaskCode = format['%1Veh%2', _missionCode, _forEachIndex];
				[_subTaskCode] call BL_fnc_missionDone;
				(units _x) join _outerGroup;
			};
		} forEach _rewardGroups;		
	};
		
	[_allUnits] spawn {
		sleep (60 * 5);
		while { {alive _x} count (_this select 0) > 0} do {
			{
				// No one within 200m and no one within 1000m with LOS.
				if !( count ([getPosATL _x, 200] call BL_fnc_nearUnits) == 0 && !([[getPosATL _x, 1000] call BL_fnc_nearUnits, _x] call BL_fnc_hasLOS) ) then {
					deleteVehicle _x;
				};
			} count (_this select 0);
			
			sleep 60;
		};
	};
}];