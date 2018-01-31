[
// Init. Result of this will be passed to all
// following functions as _this select 0.
{
	private ['_cities', '_city', '_spawnSpot', '_leadVehicle', '_vehicles', '_variations'];
	// Select a random city
	_cities = [] call BL_fnc_findCities;
	_city = [];
	
	while { count _city == 0 } do {
		_city = _cities select floor random count _cities;
		
		if ( count ([_city select 1, 1000] call BL_fnc_nearMissions) > 0) then {
			_city = [];
		};
	};
		
	_spawnSpot = (selectBestPlaces [_city select 1, 500, "meadow - houses", 1, 1]) select 0 select 0;
	_group = createGroup civilian;
	_vehicles = [];
	
	_variations = [
		'repair',
		'ammo',
		'pmc'
	];
	
	_trackAI = {
		_this call BL_fnc_aliveObjectCounter;
	};
	
	(_variations select floor random count _variations) call {
		if ( _this == "repair" || _this == "ammo" ) exitwith {
			/*
			==================================
			Ammo and Repair truck convoys
			==================================
			*/
			private ['_vehClass', '_rewardClass'];
			_vehClass = {
				private ['_types'];
				_types = ["BRDM2_Gue"];
				(_types select floor random count _types)
			};
			
			_vehicles set [count _vehicles, [_group, call _vehClass, _spawnSpot, [], BL_aiBountyAmount, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
					
			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_vehicles set [count _vehicles, [_group, call _vehClass, _spawnSpot, [], BL_aiBountyAmount, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
			
			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_vehicles set [count _vehicles, [_group, "UralOpen_CDF", _spawnSpot, [
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier",
				"RU_Soldier"
			], BL_aiBountyAmount, _trackAI] call BL_fnc_spawnMissionVehWithCrew];

			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_rewardClass = if ( _this == "repair" ) then {"UralRepair_CDF"} else {"UralReammo_CDF"};
			_vehicles set [count _vehicles, [_group, _rewardClass, _spawnSpot, [], BL_aiBountyAmount, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
			
			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_vehicles set [count _vehicles, [_group, call _vehClass, _spawnSpot, [], BL_aiBountyAmount, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
		};
	
		if ( _this == "pmc" ) exitwith {
			_vehicles set [count _vehicles, [_group, "ArmoredSUV_PMC", _spawnSpot, [
				"RU_Soldier_Officer",
				"RU_Soldier_AR",
				"RU_Soldier_MG"
			], BL_aiBountyAmount * 3, _trackAI] call BL_fnc_spawnMissionVehWithCrew];

			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_vehicles set [count _vehicles, [_group, "SUV_PMC", _spawnSpot, [
				"RU_Soldier_Medic",
				"RU_Soldier_GL",
				"RU_Soldier_MG",
				"RU_Soldier_HAT"
			], BL_aiBountyAmount * 3, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
			
			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_vehicles set [count _vehicles, [_group, "SUV_PMC", _spawnSpot, [
				"RU_Soldier_Medic",
				"RU_Soldier_GL",
				"RU_Soldier_MG",
				"RU_Soldier_HAT"
			], BL_aiBountyAmount * 3, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
			
			_spawnSpot = [_spawnSpot, -10, 0] call BIS_fnc_relPos;
			_vehicles set [count _vehicles, [_group, "ArmoredSUV_PMC", _spawnSpot, [
				"RU_Soldier_Officer",
				"RU_Soldier_AR",
				"RU_Soldier_MG"
			], BL_aiBountyAmount * 3, _trackAI] call BL_fnc_spawnMissionVehWithCrew];
		};
	};
	
	[_vehicles, _this select 1] call (_this select 0);
},

'Convoy',
{format['
A convoy was seen moving from %1.
Destroy or capture all marked vehicles to complete this mission.
Salvage what you can.', ([getPosATL (_this select 0 select 0)] call BL_fnc_nearestCity) select 0]
},

// Mission location.
{[objNull, true]},

// Function to call to run the mission
{
	private ["_leadVehicle","_vehGroup","_cities","_currentCity","_lastCity","_nextCity","_possibleCities","_nextWaypoint","_wp"];
	_vehicles    = _this select 0;
	_leadVehicle = _this select 0 select 0;
	_missionCode = _this select 1;
	_vehGroup = group _leadVehicle;
	_cities = [] call BL_fnc_findCities;
	_visitedCities = [];
	
	_vehGroup setBehaviour 'AWARE';
	_vehGroup setFormation 'COLUMN';
	_vehGroup setCombatMode 'WHITE';
	_vehGroup allowFleeing 0;
	
	_checkCompletion = {
		private ['_task', '_vehicles', '_children', '_missionCode'];
		_missionCode = (_this select 0) getVariable 'missionCode';
		_vehicles = (_this select 0) getVariable 'vehicles';
		{
			_task = _x getVariable 'subTaskCode';
			
			if !( [_task select 0] call BL_fnc_taskCompleted ) then {
				if ( !alive _x || ({ alive _x } count (crew _x)) == 0  ) then {
					[_task select 0, 'SUCCEEDED'] call BL_fnc_taskSetState;
					(_task select 0) spawn {
						sleep 15;
						[_this] call BL_fnc_deleteTask;
					};
				};
			};
		} forEach _vehicles;
		
		_children = [_missionCode] call BL_fnc_taskChildren;
		if ( ({ [_x] call BL_fnc_taskCompleted || !([_x] call BL_fnc_taskExists)} count _children) == count _children ) then {
			[_missionCode, true] call BL_fnc_missionDone;
		};
	};
	
	// Add sub tasks for all vehicles
	{
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
		_subTaskCode = [format['%1Veh%2', _missionCode, _forEachIndex], _missionCode];
		[
			true,
			_subTaskCode,
			["", _displayName, _displayName],
			[_x, true],
			'CREATED',
			_forEachIndex,
			false
		] call BL_fnc_taskCreate;
		
		_x setVariable ['subTaskCode', _subTaskCode];
		_x setVariable ['missionCode', _missionCode];
		_x addEventHandler ['Killed', _checkCompletion];
		_x addEventHandler ['GetOut', _checkCompletion];
		_x setVariable ['vehicles', _vehicles];
		_x setVariable ['rewardGetInEH', _x addEventHandler ['GetIn', {
			if ( isPlayer (_this select 2) ) then {
				[_this select 0] call BL_fnc_saveVehicle;
				(_this select 0) removeEventHandler ['GetIn', (_this select 0) getVariable 'rewardGetInEH'];
			};
		}]];
	} forEach (_this select 0);
	
	// Killed event for units in case they are shot out of vehicles.
	{
		_x setVariable ['missionCode', _missionCode];
		_x addEventHandler ['Killed', _checkCompletion];
		_x setVariable ['vehicles', _vehicles];
	} count ( units _vehGroup );
	
	// Find the next closest valid city.
	_nextCity = {
		private ['_possibleCities'];
		_possibleCities = [_cities, [], {
			if !( (_x select 0) in _visitedCities ) then {
				(_nextWaypoint select 1) distance (_x select 1)
			}
			else {
				100000
			};
		}, "ASCEND"] call BL_fnc_sortBy;
		
		_possibleCities select 0
	};
	
	_startCity = ([getPosATL _leadVehicle] call BL_fnc_nearestCity);
	_nextWaypoint = _startCity;

	while { !([_missionCode] call BL_fnc_taskCompleted) && [_missionCode] call BL_fnc_taskExists } do {
		if ( currentWaypoint _vehGroup >= count waypoints _vehGroup ) then {
			_visitedCities set [count _visitedCities, _nextWaypoint select 0];
			_nextWaypoint = (call _nextCity);

			_wp = _vehGroup addWaypoint [_nextWaypoint select 1, 0];
			_wp setWaypointType "MOVE";
			_wp setWaypointCompletionRadius 100;
			_vehGroup setCurrentWaypoint _wp;
		};
		
		sleep 60;
	};
	
	// Mission is over. Track and remove AI ASAP.
	_vehGroup allowFleeing 1;
	_vehGroup spawn {
		while { count units _this > 0 } do {
			sleep 60;
		
			{
				// No one within 200m and no one within 1000m with LOS.
				if !( count ([getPosATL _x, 200] call BL_fnc_nearUnits) == 0 && !([[getPosATL _x, 1000] call BL_fnc_nearUnits, _x] call BL_fnc_hasLOS) ) then {
					deleteVehicle _x;
				};
				true
			} count (units _this);
		};
	};
}];