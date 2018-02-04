
//	@file Version: 1.0
//	@file Name: addToCart.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "vehicledialog\vehiclestoreDefines.sqf";
disableSerialization;

if (local player) then {

	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	// Grab access to the controls
	_dialog = findDisplay vehicleshop_DIALOG;
	_vehiclelist = _dialog displayCtrl vehicleshop_vehicle_list;
	_cartlist = _dialog displayCtrl vehicleshop_cart;
	_totalText = _dialog displayCtrl vehicleshop_total;

	//Get Selected Item
	_selectedItem = lbCurSel _vehiclelist;
	_itemText = _vehiclelist lbText _selectedItem;

	//Check Items Price
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach vehicleArray;

	vehicleStoreCart = vehicleStoreCart + _price;
	_totalText CtrlsetText format["Total: $%1", vehicleStoreCart];

	_cartlist lbAdd format["%1",_itemText];
};