/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Set a task's destination.
	
	Parameters:
		0: STRING - Task name
		1: OBJECT or ARRAY - Task destination
	
	Returns:
	BOOL
*/
private ["_taskName","_dest"];

_taskName = [_this,0,"",[""]] call BL_fnc_param;
_dest = [_this,1,objNull,[objNull,[]]] call BL_fnc_param;

[_taskName,nil,nil,_dest] call BL_fnc_setTask;