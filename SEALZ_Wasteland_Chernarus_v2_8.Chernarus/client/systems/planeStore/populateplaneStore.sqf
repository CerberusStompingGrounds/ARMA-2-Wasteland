
//	@file Version: 1.0
//	@file Name: populateplaneStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = populate list with planes 1 = populate list with ammo 2 = populate list with equipment)]

#include "planedialog\planestoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay planeshop_DIALOG;
_planelisttext = _dialog displayCtrl planeshop_plane_TEXT;
_planepicture = _dialog displayCtrl planeshop_plane_pic;
_planelist = _dialog displayCtrl planeshop_plane_list;								
_planeInfo = _dialog displayCtrl planeshop_plane_Info;

switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _planelist;
		_planelist lbSetCurSel -1;
		_planepicture ctrlSettext "";
		_planelisttext ctrlSettext "";
        _planeInfo ctrlSetStructuredText parseText "";

		// Populate the plane shop weapon list
		{
			_planelistIndex = _planelist lbAdd format["%1",_x select 0];
		} forEach planeArray;
	};
};