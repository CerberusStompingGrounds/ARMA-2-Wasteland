
//	@file Version: 1.0
//	@file Name: addToCart.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "helidialog\helistoreDefines.sqf";
disableSerialization;

if (local player) then {

	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	// Grab access to the controls
	_dialog = findDisplay helishop_DIALOG;
	_helilist = _dialog displayCtrl helishop_heli_list;
	_cartlist = _dialog displayCtrl helishop_cart;
	_totalText = _dialog displayCtrl helishop_total;

	//Get Selected Item
	_selectedItem = lbCurSel _helilist;
	_itemText = _helilist lbText _selectedItem;

	//Check Items Price
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach HeliArray;

	heliStoreCart = heliStoreCart + _price;
	_totalText CtrlsetText format["Total: $%1", heliStoreCart];

	_cartlist lbAdd format["%1",_itemText];
};