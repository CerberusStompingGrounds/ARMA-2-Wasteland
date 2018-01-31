/*
	Author: Thomas Ryan
	
	Description:
	Set a task to current.
	
	Parameters:
		0: STRING - Task name
	
	Returns:
	BOOL
*/

private ["_taskName"];

_taskName = [_this,0,"",[""]] call BL_fnc_param;

[_taskName,nil,nil,nil,true] call BL_fnc_setTask;