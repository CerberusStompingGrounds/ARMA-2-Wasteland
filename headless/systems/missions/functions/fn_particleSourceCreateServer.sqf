private ['_loc', '_type', '_params', '_interval', '_duration', '_source'];
_loc      = [_this, 0, [0,0,0], [[]], [2,3]] call BL_fnc_param;
_type     = [_this, 1, "", [""]] call BL_fnc_param;
_interval = [_this, 2, -1, [0]] call BL_fnc_param;
_params   = [_this, 3, [], [[]]] call BL_fnc_param;
_duration = [_this, 4, 5, [0, ""]] call BL_fnc_param;

[_this, "BL_fnc_particleSourceCreate"] call BL_fnc_MP;

// Persistent particle sources
if ( typeName _duration != "SCALAR" ) then {
	if !( [BL_particleSources, _duration] call BL_fnc_hashHasKey ) then {
		[BL_particleSources, _duration, _this] call BL_fnc_hashSet;
	};
};