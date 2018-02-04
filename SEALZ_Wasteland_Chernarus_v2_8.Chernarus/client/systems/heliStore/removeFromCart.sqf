
//	@file Version: 1.0
//	@file Name: removeFromCart.sqf
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

	//Grab access to the controls
	_dialog = findDisplay helishop_DIALOG;
	_cartlist = _dialog displayCtrl helishop_cart;
	_totalText = _dialog displayCtrl helishop_total;

	//Get selected item.
	_selectedItem = lbCurSel _cartlist;
	_itemText = _cartlist lbText _selectedItem;

	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach heliArray;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach ammoArray;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach accessoriesArray;

	heliStoreCart = heliStoreCart - _price;
	_totalText CtrlsetText format["Total: $%1", heliStoreCart];

	//Remove selected item.
	_cartlist lbDelete _selectedItem;
};