private ['_veh', '_mission', '_cbArgs', '_cb'];
_veh = [_this, 0, objNull, [objNull]] call BL_fnc_param;
_mission = [_this, 1, "", [""]] call BL_fnc_param;
_cbArgs = [_this, 2, [], [[]]] call BL_fnc_param;
_cb = [_this, 3, {}, [{}]] call BL_fnc_param;

_veh setVariable ['failOnKilled', _mission];
_veh setVariable ['failOnKilledCB', [_cbArgs, _cb]];
_veh addEventHandler ['Killed', {
	_mission = (_this select 0) getVariable 'failOnKilled';
	
	if ( _mission call BL_fnc_taskExists ) then {
		[_mission, false] call BL_fnc_missionDone;
		[_mission, 'FAILED'] call BL_fnc_taskSetState;
		_cb = (_this select 0) getVariable 'failOnKilledCB';
		[_cb select 0, _mission, _this] call (_cb select 1);
	};
}];