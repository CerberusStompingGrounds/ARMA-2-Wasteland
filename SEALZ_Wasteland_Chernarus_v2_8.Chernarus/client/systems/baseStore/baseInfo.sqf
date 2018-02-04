
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "basedialog\basestoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay baseshop_DIALOG;
_baselist = _dialog displayCtrl baseshop_base_list;
_basepicture = _dialog displayCtrl baseshop_base_pic;
_baselisttext = _dialog displayCtrl baseshop_base_TEXT;
_baseInfo = _dialog displayCtrl baseshop_base_Info;

//Get Selected Item
_selectedItem = lbCurSel _baselist;
_itemText = _baselist lbText _selectedItem;

_basepicture ctrlSettext _picture;
_baselisttext ctrlSetText format [""];	

//Check Items Price
{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _baseInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_basepicture ctrlSettext _picture;
    
	_baselisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach baseArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
    _weapon = (configFile >> "cfgVehicles" >> _weap_type);
    _baseInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    _picture = getText(_weapon >> "picture");
	_basepicture ctrlSettext _picture;
   
    
	_baselisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach baseArray;

