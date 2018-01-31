private ['_veh', '_lock', '_weapons'];
_veh = [_this, 0, objNull, [objNull]] call BL_fnc_param;
_lock = [_this, 1, true, [true]] call BL_fnc_param;

_veh lock _lock;
_veh lockCargo _lock;
_veh lockDriver _lock;

_weapons = [typeOf _veh] call BL_fnc_vehicleWeapons;

{
	_veh lockTurret [_x select 1, _lock];
} count _weapons;

_lock