/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Return a sub-task's parent task.
	
	Parameters:
		0: STRING - Task name
	
	Returns:
	STRING - sub-task's parent task.
*/
private ["_taskID","_taskVar","_params"];
_taskID = [_this,0,"",[""]] call BL_fnc_param;
_taskVar = _taskID call BL_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;
if (isnil {_data}) exitwith {["Task '%1' does not exists.",_taskID] call bis_fnc_error;};

_params = _data select 0;
_params select 1;