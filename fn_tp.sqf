private ['_player'];
_player = [_this, 0, objNull, [objNull]] call BL_fnc_param;

TP_call = {
	_pos = _this select 0;
	_oldpos = getPos player;
	
	onMapSingleClick "vehicle _player setPos _pos; onMapSingleClick '';"
	waitUntil{!(visibleMap)};

	_myPos = player getVariable["lastPos",[]];
	if (count _myPos > 0) then {
		player setVariable["lastPos",getPosATL player];player setVariable["lastPos",[]];
	};

	openMap [false, false];
	onMapSingleClick "";
	PVAR_adminLog = ["AdminLog", format["TP %3 to %4 [%1 (%2)]", name player, getPlayerUID player, mapGridPosition _oldpos, mapGridPosition _pos]];
	publicVariableServer "PVAR_adminLog";
};
onMapSingleClick "[_pos, _alt] call TP_call;";
openMap true;