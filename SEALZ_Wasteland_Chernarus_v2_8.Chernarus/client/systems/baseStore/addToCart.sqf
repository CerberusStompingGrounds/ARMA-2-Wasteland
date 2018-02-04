
//	@file Version: 1.0
//	@file Name: addToCart.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "basedialog\basestoreDefines.sqf";
disableSerialization;

if (local player) then {

	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	// Grab access to the controls
	_dialog = findDisplay baseshop_DIALOG;
	_baselist = _dialog displayCtrl baseshop_base_list;
	_cartlist = _dialog displayCtrl baseshop_cart;
	_totalText = _dialog displayCtrl baseshop_total;

	//Get Selected Item
	_selectedItem = lbCurSel _baselist;
	_itemText = _baselist lbText _selectedItem;

	//Check Items Price
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach baseArray;

	baseStoreCart = baseStoreCart + _price;
	_totalText CtrlsetText format["Total: $%1", baseStoreCart];

	_cartlist lbAdd format["%1",_itemText];
};