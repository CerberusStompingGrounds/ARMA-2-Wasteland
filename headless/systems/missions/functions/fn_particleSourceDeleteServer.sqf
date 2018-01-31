private ['_code'];
_code = [_this, 0, "", [""]] call BL_fnc_param;

[_this, "BL_fnc_particleSourceDelete"] call BL_fnc_MP;
[BL_particleSources, _code] call BL_fnc_hashRem;