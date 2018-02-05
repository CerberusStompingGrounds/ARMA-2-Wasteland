[
// Init. Result of this will be passed to all
// following functions as _this select 0.
{
	private ['_possible'];
	_possible = [call BL_fnc_missionsConfig, 'randomVehicleRewards'] call BL_fnc_hashGet;
	
	if ( isNil "_possible" ) then {
		_possible = [
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
		];
	};
	
	[([_possible] call BL_fnc_selectRandom) select 0, _this select 1] call (_this select 0);
},

{format['Secure %1', getText (configFile >> "CfgVehicles" >> (_this select 0) >> "displayName")]},
{
	format['A %1 has been spotted near %2. Secure it for you team.',
		getText (configFile >> "CfgVehicles" >> (_this select 0) >> "displayName"),
		([(_this select 1)] call BL_fnc_nearestCity) select 0
	]
},

// Mission location. Array or code
BL_fnc_missionRandomField,

// Function to call to start the mission
{
	_initResult  = [_this, 0, "", [""]] call BL_fnc_param;
	_missionCode = [_this, 1, "", [""]] call BL_fnc_param;
	_location    = [_this, 2, [0,0,0], [[]], [2,3]] call BL_fnc_param;
	
	_base = [[call BL_fnc_missionsConfig, 'randomVehicleBases'] call BL_fnc_hashGet, -1, 0] call BL_fnc_selectRandom;
	_base = [_location, 0, _base select 1] call BL_fnc_spawnCollection;
	
	_missionReward = createVehicle [_initResult, _location, [], 0, "CAN_COLLIDE"];
	[_missionReward, 'reward'] call BL_fnc_trackVehicle;
	[_missionReward] call BL_fnc_lockVehicle; // Don't let anyone in until they complete the mission
	
	_grp = [false, _location, [
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman",
		"RU_Policeman"
	], [_location, _missionCode, _missionReward], {
		_location      = _this select 0 select 0;
		_missionCode   = _this select 0 select 1;
		_missionReward = _this select 0 select 2;
		
		_grp = _this select 1 select 0;
		_grp allowFleeing 0;
		_grp setBehaviour "WHITE";
		_grp setCombatMode "AWARE";
		
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
	
	[_base, _missionCode, _location] spawn {
		private ['_base', '_missionCode', '_location'];
		_base = _this select 0;
		_missionCode = _this select 1;
		_location = _this select 2;
		
		{ _x setVariable ['LOG_disabled', true, true] } count _base;
		
		waitUntil {
			sleep 5;
			!([_missionCode] call BL_fnc_taskExists) ||
			{[_missionCode] call BL_fnc_taskCompleted}
		};
		
		{ _x setVariable ['LOG_disabled', false, true] } count _base;
		
		sleep 300;
		
		{
			if ( !(_x getVariable ['objectLocked', false]) && _x distance _location < 100 ) then {
				deleteVehicle _x;
			};
			nil
		} count _base;
	};
}];