
//	@file Version: 1.0
//	@file Name: populateheliStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = populate list with helis 1 = populate list with ammo 2 = populate list with equipment)]

#include "helidialog\helistoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay helishop_DIALOG;
_helilisttext = _dialog displayCtrl helishop_heli_TEXT;
_helipicture = _dialog displayCtrl helishop_heli_pic;
_helilist = _dialog displayCtrl helishop_heli_list;								
_heliInfo = _dialog displayCtrl helishop_heli_Info;

switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _helilist;
		_helilist lbSetCurSel -1;
		_helipicture ctrlSettext "";
		_helilisttext ctrlSettext "";
        _heliInfo ctrlSetStructuredText parseText "";

		// Populate the heli shop weapon list
		{
			_helilistIndex = _helilist lbAdd format["%1",_x select 0];
		} forEach HeliArray;
	};
};