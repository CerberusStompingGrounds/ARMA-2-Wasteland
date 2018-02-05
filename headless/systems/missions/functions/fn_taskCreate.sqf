/*
	Author: Thomas Ryan & Karel Moricky

	Description:
	Create a task.

	Parameters:
		0: BOOL or OBJECT or GROUP or SIDE or ARRAY - Task owner(s)
		1: STRING or ARRAY - Task name or array in the format [task name, parent task name]
		2: ARRAY or STRING - Task description in the format ["description", "title", "marker"] or CfgTaskDescriptions class
		3: OBJECT or ARRAY or STRING - Task destination
		4: BOOL or NUMBER or STRING - Task state (or true to set as current)
		5: NUMBER - Task priority (when automatically selecting a new current task, higher priority is selected first)

	Returns:
	BOOL
*/
private ["_target","_params","_desc","_dest","_state","_priority","_showNotification"];

_target = [_this,0,true,[true,sideunknown,grpnull,objnull,[]]] call BL_fnc_param;
_params = [_this,1,"",["",[]]] call BL_fnc_param;
_desc = [_this,2,[_params,0,"",[""]] call BL_fnc_paramIn,[[],""],3] call BL_fnc_param;
_dest = [_this,3,objNull,[objNull,[],""]] call BL_fnc_param;
_state = [_this,4,false,["",false,0]] call BL_fnc_param;
_priority = [_this,5,-1,[0]] call BL_fnc_param;
_showNotification = [_this,6,true,[true]] call BL_fnc_param;

if (typename _dest == typename "") then {_dest = markerpos _dest;};
if (typename _state == typename 0) then {_state = _state > 0;};

[_params,_target,_desc,_dest,_state,_priority,_showNotification] call BL_fnc_setTask;