/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Return a task's destination.
	
	Parameters:
		0: STRING - Task name
	
	Returns:
	STRING - The task's destination.
*/
private ["_taskID","_taskVar"];
_taskID = [_this,0,"",[""]] call BL_fnc_param;
_taskVar = _taskID call BL_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;
if (isnil {_data}) exitwith {["Task '%1' does not exists.",_taskID] call bis_fnc_error;};

_data select 3