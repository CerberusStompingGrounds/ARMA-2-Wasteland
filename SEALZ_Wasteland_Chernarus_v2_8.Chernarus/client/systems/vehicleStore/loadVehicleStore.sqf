//	@file Version: 1.0
//	@file Name: loadvehicleStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "vehicledialog\vehiclestoreDefines.sqf";
disableSerialization;

_vehicleshopDialog = createDialog "vehicleshopd";
vehicleStoreCart = 0;

_Dialog = findDisplay vehicleshop_DIALOG;
_playerMoney = _Dialog displayCtrl vehicleshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];


