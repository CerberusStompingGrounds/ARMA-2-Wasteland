private ['_position', '_radius', '_nearMissions'];
_position = [_this, 0, [0,0,0], [[]], [2,3]] call BL_fnc_param;
_radius = [_this, 1, 100, [0]] call BL_fnc_param;

_nearMissions = [];
{
	if ( typeName _x == "ARRAY" ) then {
		if ( _x distance _position <= _radius ) then {
			_nearMissions set [count _nearMissions, _x];
		};
	};
	true
} count (runningMissionLocations select 2);

_nearMissions