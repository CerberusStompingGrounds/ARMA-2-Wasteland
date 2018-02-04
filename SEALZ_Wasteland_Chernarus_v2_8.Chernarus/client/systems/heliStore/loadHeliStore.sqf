//	@file Version: 1.0
//	@file Name: loadheliStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "helidialog\helistoreDefines.sqf";
disableSerialization;

_helishopDialog = createDialog "helishopd";
heliStoreCart = 0;

_Dialog = findDisplay helishop_DIALOG;
_playerMoney = _Dialog displayCtrl helishop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];

gsLocation = str(_this select 0);

if(gsLocation == "hs1") then {gsCrate = g_ammo_4_1;};
