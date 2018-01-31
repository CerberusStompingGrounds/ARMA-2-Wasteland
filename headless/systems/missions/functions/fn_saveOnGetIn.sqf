private ['_veh'];
_veh = [_this, 0, objNull, [objNull]] call BL_fnc_param;

_veh setVariable ["saveOnGetIn", _veh addEventHandler ["GetIn", {
	if ( isPlayer (_this select 2) ) then {
		(_this select 0) call BL_fnc_saveVehicle;
		(_this select 0) removeEventHandler ["GetIn", (_this select 0) getVariable 'saveOnGetIn'];
	};
}]];