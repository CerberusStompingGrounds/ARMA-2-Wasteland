private ["_location","_cities","_city","_cityCenter","_radius","_distanceFromTown","_randomDir","_position","_match","_matchPos","_matchAccuracy","_classes"];
_location = [];
_cities = [] call BL_fnc_findCities;

while { count _location == 0 } do {
	_city = _cities select floor random count _cities;
	_cityCenter = _city select 1;
	
	_radius = _city select 2;
	_distanceFromTown = random 1000;
	_randomDir = random 359;
	
	_position = [_cityCenter, _distanceFromTown + _radius, _randomDir] call BIS_fnc_relPos;
	_match = (selectBestPlaces [_position, 50, "1 - ((trees factor [0.5, 1]) + forest + hills + sea/2)", 1, 1]) select 0;
	_matchPos = _match select 0;
	_matchAccuracy = _match select 1;
	
	if ( _matchAccuracy > 0 && count ([_position, 1000] call BL_fnc_nearMissions) == 0) then {
		if ( count (_matchPos isFlatEmpty [0, 0, 0.35, 10, 0, false, objNull]) > 0 ) then {
			_location = _matchPos;
		};
	};
};

_location