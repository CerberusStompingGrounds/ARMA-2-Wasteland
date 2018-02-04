
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "vehicledialog\vehiclestoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay vehicleshop_DIALOG;
_vehiclelist = _dialog displayCtrl vehicleshop_vehicle_list;
_vehiclepicture = _dialog displayCtrl vehicleshop_vehicle_pic;
_vehiclelisttext = _dialog displayCtrl vehicleshop_vehicle_TEXT;
_vehicleInfo = _dialog displayCtrl vehicleshop_vehicle_Info;

//Get Selected Item
_selectedItem = lbCurSel _vehiclelist;
_itemText = _vehiclelist lbText _selectedItem;

_vehiclepicture ctrlSettext _picture;
_vehiclelisttext ctrlSetText format [""];	

//Check Items Price
{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _vehicleInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_vehiclepicture ctrlSettext _picture;
    
	_vehiclelisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach vehicleArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
    _weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _vehicleInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_vehiclepicture ctrlSettext _picture;
   
    
	_vehiclelisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach vehicleArray;

