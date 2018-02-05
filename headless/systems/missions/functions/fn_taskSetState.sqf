/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Set a task's state.
	
	Parameters:
		0: STRING - Task name
		1: STRING - Task state
		2: BOOL - Show hint (default: true)
	
	Returns:
	BOOL
*/
private ["_taskName","_state","_hint"];
_taskName = [_this,0,"",[""]] call BL_fnc_param;
_state = [_this,1,"",[""]] call BL_fnc_param;
_hint = [_this,2,true,[true]] call BL_fnc_param;

if !(_taskName call BL_fnc_taskExists) exitwith{_taskName};
[_taskName,nil,nil,nil,_state,nil,_hint] call BL_fnc_setTask;