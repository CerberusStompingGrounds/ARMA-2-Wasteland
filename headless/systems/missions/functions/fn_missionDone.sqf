private ['_code','_success'];
_code = [_this, 0, "", [""]] call BL_fnc_param;
_success = [_this, 1, true, [true]] call BL_fnc_param;

if ( [_code] call BL_fnc_taskExists && {!([_code] call BL_fnc_taskCompleted)} ) then {
	if ( _success ) then {
		[_code, "SUCCEEDED"] call BL_fnc_taskSetState;
	}
	else {
		[_code, "FAILED"] call BL_fnc_taskSetState;
	};
	
	private ['_parent', '_children'];
	_parent = [_code] call BL_fnc_taskParent;
	if ( _parent != "" ) then {
		_children = [_parent] call BL_fnc_taskChildren;
		if ( { !([_x] call BL_fnc_taskExists ) || {[_x] call BL_fnc_taskCompleted} } count _children == count _children ) then {
			[_parent, true] call BL_fnc_missionDone;
		};
	}
	else {
		['missionDone', _code] call BL_fnc_localEvent;
	};

	[runningMissionLocations, _code] call BL_fnc_hashRem;
	
	_code spawn {
		sleep ([call BL_fnc_missionsConfig, 'taskCleanupDelay'] call BL_fnc_hashGet);
		[_this] call BL_fnc_deleteTask;
	};	
};