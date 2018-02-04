
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "planedialog\planestoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay planeshop_DIALOG;
_planelist = _dialog displayCtrl planeshop_plane_list;
_planepicture = _dialog displayCtrl planeshop_plane_pic;
_planelisttext = _dialog displayCtrl planeshop_plane_TEXT;
_planeInfo = _dialog displayCtrl planeshop_plane_Info;

//Get Selected Item
_selectedItem = lbCurSel _planelist;
_itemText = _planelist lbText _selectedItem;

_planepicture ctrlSettext _picture;
_planelisttext ctrlSetText format [""];	

//Check Items Price
{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _planeInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_planepicture ctrlSettext _picture;
    
	_planelisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach planeArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
    _weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _planeInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_planepicture ctrlSettext _picture;
   
    
	_planelisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach planeArray;

