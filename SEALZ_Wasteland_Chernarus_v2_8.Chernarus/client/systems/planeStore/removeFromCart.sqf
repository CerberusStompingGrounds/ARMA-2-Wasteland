
//	@file Version: 1.0
//	@file Name: removeFromCart.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "planedialog\planestoreDefines.sqf";
disableSerialization;

if (local player) then {

	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	//Grab access to the controls
	_dialog = findDisplay planeshop_DIALOG;
	_cartlist = _dialog displayCtrl planeshop_cart;
	_totalText = _dialog displayCtrl planeshop_total;

	//Get selected item.
	_selectedItem = lbCurSel _cartlist;
	_itemText = _cartlist lbText _selectedItem;

	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach planeArray;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach ammoArray;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach accessoriesArray;

	planeStoreCart = planeStoreCart - _price;
	_totalText CtrlsetText format["Total: $%1", planeStoreCart];

	//Remove selected item.
	_cartlist lbDelete _selectedItem;
};