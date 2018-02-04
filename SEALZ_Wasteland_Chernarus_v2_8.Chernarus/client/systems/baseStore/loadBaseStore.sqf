//	@file Version: 1.0
//	@file Name: loadbaseStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "basedialog\basestoreDefines.sqf";
disableSerialization;

_baseshopDialog = createDialog "baseshopd";
baseStoreCart = 0;

_Dialog = findDisplay baseshop_DIALOG;
_playerMoney = _Dialog displayCtrl baseshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];


