//	@file Version: 1.0
//	@file Name: loadplaneStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "planedialog\planestoreDefines.sqf";
disableSerialization;

_planeshopDialog = createDialog "planeshopd";
planeStoreCart = 0;

_Dialog = findDisplay planeshop_DIALOG;
_playerMoney = _Dialog displayCtrl planeshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];

gsLocation = str(_this select 0);

if(gsLocation == "hs1") then {gsCrate = g_ammo_4_1;};
