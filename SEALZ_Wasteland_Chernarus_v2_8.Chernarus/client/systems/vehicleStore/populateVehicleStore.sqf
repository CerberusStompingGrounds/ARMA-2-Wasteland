
//	@file Version: 1.0
//	@file Name: populatevehicleStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = populate list with vehicles 1 = populate list with ammo 2 = populate list with equipment)]

#include "vehicledialog\vehiclestoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay vehicleshop_DIALOG;
_vehiclelisttext = _dialog displayCtrl vehicleshop_vehicle_TEXT;
_vehiclepicture = _dialog displayCtrl vehicleshop_vehicle_pic;
_vehiclelist = _dialog displayCtrl vehicleshop_vehicle_list;								
_vehicleInfo = _dialog displayCtrl vehicleshop_vehicle_Info;

switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _vehiclelist;
		_vehiclelist lbSetCurSel -1;
		_vehiclepicture ctrlSettext "";
		_vehiclelisttext ctrlSettext "";
        _vehicleInfo ctrlSetStructuredText parseText "";

		// Populate the vehicle shop weapon list
		{
			_vehiclelistIndex = _vehiclelist lbAdd format["%1",_x select 0];
		} forEach vehicleArray;
	};
};