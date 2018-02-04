
//	@file Version: 1.0
//	@file Name: populatebaseStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = populate list with bases 1 = populate list with ammo 2 = populate list with equipment)]

#include "basedialog\basestoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay baseshop_DIALOG;
_baselisttext = _dialog displayCtrl baseshop_base_TEXT;
_basepicture = _dialog displayCtrl baseshop_base_pic;
_baselist = _dialog displayCtrl baseshop_base_list;								
_baseInfo = _dialog displayCtrl baseshop_base_Info;

switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _baselist;
		_baselist lbSetCurSel -1;
		_basepicture ctrlSettext "";
		_baselisttext ctrlSettext "";
        _baseInfo ctrlSetStructuredText parseText "";

		// Populate the base shop weapon list
		{
			_baselistIndex = _baselist lbAdd format["%1",_x select 0];
		} forEach baseArray;
	};
};