#include "functions\ckbl.sqf"(_this select 0)ctrlSetText'Press key';(_this select 0)ctrlAddEventHandler['KeyDown',"
	bl_playermenukey = _this select 1;
	(_this select 0) ctrlSetText format['Player Menu Key: %1', [bl_playermenukey] call nsmq];
	(_this select 0) ctrlRemoveAllEventHandlers 'KeyDown';
"];