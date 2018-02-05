BL_townVehiclesToRespawn = [];

[] spawn {
	waitUntil { !isNil "PERS_init_done" };

	private ["_cities","_config","_vehicles","_classes","_lowestChance","_maxPerCity","_minPerCity","_vehiclesPerMeter","_cargoGroups","_cityCenter","_cityRadius","_vehiclesInTown","_currentCount","_searchDistance","_maxCount","_class","_veh","_distance","_direction","_nearCars","_cargoAdded","_cargo","_originalCargo"];
	_cities = call BL_fnc_findCities;
	_config = [] call BL_fnc_vehicleTownSpawnsConfig;
	_vehicles = [_config, "vehicles"] call BL_fnc_hashGet;
	_classes = [];
	_lowestChance = 1;
	_maxPerCity = [_config, "maxPerCity"] call BL_fnc_hashGet;
	_minPerCity = [_config, "minPerCity"] call BL_fnc_hashGet;
	_vehiclesPerMeter = [_config, "vehiclesPerMeter"] call BL_fnc_hashGet;
	_maxOverPop = [_config, "maxOverPop"] call BL_fnc_hashGet;
	_cargoGroups = [_config, "vehicleCargo"] call BL_fnc_hashGet;

	{
		_classes set [count _classes, _x select 0];
		if ( _x select 1 < _lowestChance ) then {
			_lowestChance = _x select 1;
		};
	} forEach _vehicles;

	while { true } do {
		{
			_cityCenter = _x select 1;
			_cityRadius = _x select 2;
			_vehiclesInTown = _cityCenter nearEntities [_classes, _cityRadius];
			_currentCount = count _vehiclesInTown;
			_searchDistance = 5;
			
			_maxCount = (round ((PI * _cityRadius^2) / _vehiclesPerMeter)) min _maxPerCity max _minPerCity;
			
			diag_log format['%1 Vehicle pop: %2 of %3', _x select 0, _currentCount, _maxCount];
			
			// Bring vehicle count up to max count
			for "_i" from 1 to ( _maxCount - _currentCount ) do {
				_pos = [];
				_class = "";
				_veh = objNull;
				
				if ( count BL_townVehiclesToRespawn > 0 ) then {
					{
						if ( count ([getPosATL _x, 100] call BL_fnc_nearUnits) == 0 ) then {
							_veh = _x;
							if ( true ) exitwith{}; // Can't exit from if/else
						}
						else {
							BL_townVehiclesToRespawn = BL_townVehiclesToRespawn - [_x];
						};
						true
					} count BL_townVehiclesToRespawn;
					
					BL_townVehiclesToRespawn = BL_townVehiclesToRespawn - [_veh];
					_class = typeOf _veh;
				};
				
				if ( isNull _veh ) then {
					_class = ([_vehicles, 1, _lowestChance] call BL_fnc_selectRandom) select 0;
				};
				
				// Good spot = emptyPosition and no car within 20m
				while { count _pos == 0 } do {
					_distance = random _cityRadius - _searchDistance;
					_direction = random 360;
					
					_pos = [_cityCenter, _distance, _direction] call BIS_fnc_relPos;
					_nearCars = _pos nearEntities ["Car", 20];
					
					if ( count _nearCars == 0 ) then {
						_pos = _pos findEmptyPosition [0, _searchDistance, _class];
					}
					else {
						_pos = [];
					};
				};

				if ( !isNull _veh ) then {
					diag_log format['Respawning vehicle %1 (%2) from %3 to %4 in %5', typeOf _veh, netId _veh, getPosATL _veh, _pos, _x select 0];
					
					[_veh, _pos] call BL_fnc_safeVehicleSetPos;
					
					if ( local _veh ) then {
						_veh setFuel 1;
						_veh engineOn false;
					};
				}
				else {
					diag_log format['Spawning vehicle %1 to %2 in %3', _class, _pos, _x select 0];

					_veh = [_class, _pos] call BL_fnc_safeVehicleSpawn;
					
					if ( getNumber (configFile >> "CfgVehicles" >> _class >> "transportMaxWeapons") > 0 ) then {
						_cargoAdded = [_veh, _cargoGroups] call BL_fnc_addVehicleCargo;
						_veh setVariable ['originalCargo', _cargoAdded];
					}
					else {
						_veh setVariable ['originalCargo', []];
					};
					
					[[_veh, 'townVeh'] call BL_fnc_trackVehicle] call BL_fnc_saveVehicle;
				};
			};
			
			// Make sure vehicle count doesn't go over _maxCount
			for "_i" from _maxCount to _currentCount-1 do {
				// First unoccupied vehicle
				_veh = objNull;
				{
					if ( count crew _x == 0 && !(_x in BL_townVehiclesToRespawn)) exitwith {
						_veh = _x;
					};
					nil
				} count _vehiclesInTown;
				
				if !( _veh in BL_townVehiclesToRespawn ) then {
					BL_townVehiclesToRespawn set [count BL_townVehiclesToRespawn, _veh];
				};
			};
			
			while { count BL_townVehiclesToRespawn > _maxOverPop } do {
				_veh = BL_townVehiclesToRespawn select 0;
				diag_log format['Deleting over pop veh: %1 (%2)', typeOf _veh, netId _veh];
				
				[_veh] call BL_fnc_deleteVehicleDB;
				deleteVehicle _veh;
				BL_townVehiclesToRespawn = BL_townVehiclesToRespawn - [_veh];
			};
			
			// Check cargo of existing vehicles
			{
				_cargo = ([getWeaponCargo _x]) + ([getMagazineCargo _x]) /*+ ([getItemCargo _x])*/;
				_originalCargo = _x getVariable ['originalCargo', []];
				if ( !([_cargo,_originalCargo] call BL_fnc_isEqualTo) ) then {
					_cargoAdded = [_x, _cargoGroups] call BL_fnc_addVehicleCargo;
					_x setVariable ['originalCargo', _cargoAdded];
				};
				true
			} count _vehiclesInTown;
			true
		} count _cities;

		sleep (60 * 5);
	};
};