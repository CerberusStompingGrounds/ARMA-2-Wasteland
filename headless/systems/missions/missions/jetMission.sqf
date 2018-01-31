[
// Init. Result of this will be passed to all
// following functions as _this select 0.
{
	_possible = [[] call BL_fnc_missionsConfig, 'jetRewards'] call BL_fnc_hashGet;
	_locations = [[] call BL_fnc_missionsConfig, 'jetMissionLocations'] call BL_fnc_hashGet;
	
	_location = (_locations select floor random count _locations);
	
	[[
		([_possible] call BL_fnc_selectRandom) select 0,
		_location select 0,
		_location select 1
	], _this select 1] call (_this select 0);
},

{format['Secure %1', getText (configFile >> "CfgVehicles" >> (_this select 0 select 0) >> "displayName")]},
{
	format['A %1 has been spotted near %2. Secure it for you team.',
		getText (configFile >> "CfgVehicles" >> (_this select 0 select 0) >> "displayName"),
		([(_this select 1)] call BL_fnc_nearestCity) select 0
	]
},

// Mission location. Array or code
{
	(_this select 0 select 1)
},

// Function to call to start the mission
{
	_initResult  = _this select 0;
	_missionCode = [_this, 1, "", [""]] call BL_fnc_param;
	_location    = [_this, 2, [0,0,0], [[]], [2,3]] call BL_fnc_param;
	
	_missionReward = createVehicle [_initResult select 0, _location, [], 0, "CAN_COLLIDE"];
	_missionReward setDir (_initResult select 2);
	
	[_missionReward, 'reward'] call BL_fnc_trackVehicle;
	[_missionReward] call BL_fnc_lockVehicle; // Don't let anyone in until they complete the mission
	
	_grp = [false, _location, [
		"US_Delta_Force_TL_EP1",
		"US_Soldier_HAT_EP1",
		"US_Soldier_SniperH_EP1",
		"US_Soldier_GL_EP1",
		"US_Soldier_AA_EP1",
		"US_Soldier_AR_EP1",
		"US_Soldier_Spotter_EP1"
	], [_location, _missionCode, _missionReward], {
		_location      = _this select 0 select 0;
		_missionCode   = _this select 0 select 1;
		_missionReward = _this select 0 select 2;

		_grp = _this select 1 select 0;
		_grp allowFleeing 0;
		_grp setBehaviour "AWARE";
		_grp setCombatMode "WHITE";
		
		[_location, units _grp] call BL_fnc_aliveObjectCounter;	

		[_grp, _missionCode, [_missionReward], {
			[_this select 0 select 0, false] call BL_fnc_lockVehicle;
		}] call BL_fnc_missionDoneWhenKilled;
	}] call BL_fnc_groupSpawn;
	
	
	[_missionReward] call BL_fnc_saveOnGetIn;
	[_missionReward, _missionCode, [_grp], {
		_grp = _this select 0 select 0;
		_grp allowFleeing 1;
		
		_grp spawn {
			while { count units _this > 0 } do {
				sleep 60;
			
				{
					if !( [[getPosATL _x, 1000] call BL_fnc_nearUnits, _x] call BL_fnc_hasLOS ) then {
						deleteVehicle _x;
					};
					true
				} count (units _this);
			};
		};
	}] call BL_fnc_failOnKilled;
}];