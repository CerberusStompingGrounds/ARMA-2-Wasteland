missionCount = 0;
runningMissionLocations = [] call BL_fnc_hashCreate;
runningMissions = [] call BL_fnc_hashCreate;
BL_particleSources = missionNamespace getVariable ["BL_particleSources", [[], []] call BL_fnc_hashCreate];

// JIP for particle sources
["initPlayerServer", {
	_player = _this select 0;
	[BL_particleSources, {
		[_value, "BL_fnc_particleSourceCreate", _player] call BL_fnc_MP;
	}] call BL_fnc_hashEachPair;
}] call BL_fnc_addEventHandler;

[] spawn {
	_config = call BL_fnc_missionsConfig;

	if ( !isNil "BL_PVAR_currentTasks" ) then {
		// End all missions first
		[BL_PVAR_currentTasks, {
			[_value select 0 select 0] call BL_fnc_deleteTask;
		}] call BL_fnc_hashEachPair;
		
		{
			_x setDamage 1;
			deleteVehicle _x;
			nil
		} count (allUnits - playableUnits);
	}
	else {
		// Wait configured amount of time before first mission
		sleep ([_config, 'roundStartDelay'] call BL_fnc_hashGet);
	};	
	
	// Spawn initial missions
	for "_i" from 1 to ([_config, 'count'] call BL_fnc_hashGet) do {
		[] call BL_fnc_spawnMission;
		sleep 30;
	};
	
	// Spawn new mission after a mission completes
	['missionDone', {
		_this spawn {
			_config = call BL_fnc_missionsConfig;
			sleep ([_config, 'delay'] call BL_fnc_hashGet);
		
			// Spawn new mission
			[] call BL_fnc_spawnMission;
		};
	}] call BL_fnc_addEventHandler;
};