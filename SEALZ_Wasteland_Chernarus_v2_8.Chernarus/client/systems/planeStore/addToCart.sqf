
//	@file Version: 1.0
//	@file Name: addToCart.sqf
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

	// Grab access to the controls
	_dialog = findDisplay planeshop_DIALOG;
	_planelist = _dialog displayCtrl planeshop_plane_list;
	_cartlist = _dialog displayCtrl planeshop_cart;
	_totalText = _dialog displayCtrl planeshop_total;

	//Get Selected Item
	_selectedItem = lbCurSel _planelist;
	_itemText = _planelist lbText _selectedItem;

	//Check Items Price
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach planeArray;

	planeStoreCart = planeStoreCart + _price;
	_totalText CtrlsetText format["Total: $%1", planeStoreCart];

	_cartlist lbAdd format["%1",_itemText];
};