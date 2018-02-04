
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "helidialog\helistoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay helishop_DIALOG;
_helilist = _dialog displayCtrl helishop_heli_list;
_helipicture = _dialog displayCtrl helishop_heli_pic;
_helilisttext = _dialog displayCtrl helishop_heli_TEXT;
_heliInfo = _dialog displayCtrl helishop_heli_Info;

//Get Selected Item
_selectedItem = lbCurSel _helilist;
_itemText = _helilist lbText _selectedItem;

_helipicture ctrlSettext _picture;
_helilisttext ctrlSetText format [""];	

//Check Items Price
{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _heliInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_helipicture ctrlSettext _picture;
    
	_helilisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach HeliArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
    _weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _heliInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_helipicture ctrlSettext _picture;
   
    
	_helilisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach HeliArray;

