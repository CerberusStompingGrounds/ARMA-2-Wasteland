private ['_objects', '_mission', '_cbArgs', '_cb'];
_objects = [_this, 0, [], [objNull, [], grpNull]] call BL_fnc_param;
_mission = [_this, 1, "", [""]] call BL_fnc_param;
_cbArgs = [_this, 2, [], [[]]] call BL_fnc_param;
_cb = [_this, 3, {}, [{}]] call BL_fnc_param;

_objects = (typeName _objects) call {
	if (_this == "OBJECT") exitwith {[_objects]};
	if (_this == "GROUP") exitwith {units _objects};
	
	_objects
};

{
	_x setVariable ['doneWhenKilled', _objects];
	_x setVariable ['doneWhenKilledMission', _mission];
	_x setVariable ['doneWhenKilledCB', [_cbArgs, _cb]];
	
	_x setVariable ['doneWhenKilledEH', _x addEventHandler ['Killed', {
		private ['_obj', '_cb'];
		_obj = _this select 0;
		_mission = _obj getVariable 'doneWhenKilledMission';
		
		_obj removeEventHandler ['Killed', _obj getVariable 'doneWhenKilledEH'];
		
		if ( {alive _x} count (_obj getVariable 'doneWhenKilled') == 0 ) then {
			if ( [_mission] call BL_fnc_taskExists && {!([_mission] call BL_fnc_taskCompleted)} ) then {
				[_mission, true] call BL_fnc_missionDone;
				
				_cb = _obj getVariable 'doneWhenKilledCB';
				[_cb select 0, _mission, _this] call (_cb select 1);
			};
		};
	}]];
	
	true
} count _objects;

nil