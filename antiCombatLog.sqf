//antiCombatLog.sqf
//Papuwarfare, Viba

disableSerialization;
private ["_canabort"];

LogoutSave = {
_varArr = [
"cmoney",	
"canfood",	
"medkits",	
"water",		
"fuel",		
"repairkits",		
"fuelFull",		
"fuelEmpty",		
"bombs",		
"spawnBeacon",		
"camonet"
];
		player setVariable["hungerLevel", hungerLevel, true];
		player setVariable["thirstLevel", thirstLevel, true];
		
		{
			player setVariable[_x, (player getVariable _x), true];
		}foreach _varArr;
		
PDB_saveReq = getPlayerUID player;
publicVariableServer "PDB_saveReq";
};
while {true} do
{
	//waituntil esc menu screen opened
	waitUntil {sleep 0.1; !(isNull (findDisplay 49))};
	_display = findDisplay 49;
	_btnAbort = _display displayCtrl 104;
	//disable the abort button
	_btnAbort ctrlEnable false;
	_canabort = false;
	_delay = 20; //20 seconds
	_wait = time + _delay;
	_counter = 0;
	//Do this loop until time fullfilled or menu closed
	while {!isNull _display} do {
		_counter = _counter + 1;
		_timetext = ceil (_wait - time);
		_btnAbort ctrlSetText format["Abort (in %1)", _timetext];
		//Save player when 5 seconds left.
		if ((_counter == (_delay - 5)) && !respawnDialogActive && (alive player) && !PDB_isDead) then {
		_btnAbort ctrlSetText format["Character saved!"];
		[] call LogoutSave;
		
		};
		sleep 1;
		//Exit if menu closed or time passed
		if ((_wait - time) < 0) exitWith {_canabort = true;};
		if (isNull _display) exitWith {};
		};
	
	//if esc menu still opened then...
	if (!isNull _display && _canabort) then
	{
		//enable the abort button
		_btnAbort ctrlSetText "Abort";
		_btnAbort ctrlEnable true;
		
		//waituntil menu is closed
		waitUntil {isNull (findDisplay 49)};
	};
};