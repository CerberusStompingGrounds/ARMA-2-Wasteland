_this spawn {
	_loc = [_this, 0, [0,0,0], [[], objNull]] call BL_fnc_param;
	_toCount = [_this, 1, [], [[]]] call BL_fnc_param;
	_what = [_this, 2, "AI", [""]] call BL_fnc_param;
	
	_start = {alive _x} count _toCount;
	
	_pos = _loc;
	if ( typeName _pos == "OBJECT" ) then {
		_pos = getPosATL _loc;
	};
	
	_marker = createMarker [format["aoc%1", 10 call BL_fnc_randStr], _pos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "DOT";
	_marker setMarkerColor "ColorBlack";
	
	while { true } do {
		_count = {alive _x} count _toCount;
		if ( _count == 0 ) exitwith{};
		
		if ( typeName _loc == "OBJECT" ) then {
			_pos = getPosATL _loc;
			_marker setMarkerPos _pos;
		};
		
		_marker setMarkerText format['%1 of %2 %3', _count, _start, _what];
		
		sleep 1;
	};
	
	deleteMarker _marker;
};