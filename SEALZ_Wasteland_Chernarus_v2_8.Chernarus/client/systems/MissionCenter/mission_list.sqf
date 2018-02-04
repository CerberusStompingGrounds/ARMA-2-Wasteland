#include "mdialog\mission_sys.sqf";
disableSerialization;

_switch = _this select 0;

_dialog = findDisplay missionsys_DIALOG;
_itemList = _dialog displayCtrl mission_list;

_itemListIndex = _itemList lbAdd format["Light Mission Status: %1 of 4 AI Remaining at mission location", "2"];
_itemList lbSetData [(lbSize _itemList)-1, "LM_1"];

	_itemListIndex = _itemList lbAdd format["Heavy Mission Status: %1 of 6 AI Remaining at mission location", "2"];
	_itemList lbSetData [(lbSize _itemList)-1, "HM_1"];

	_itemListIndex = _itemList lbAdd format["Heli Mission 1 Status: %1 of 10 AI Remaining at mission location", "1"];
	_itemList lbSetData [(lbSize _itemList)-1, "Heli_1"];
	
	_itemListIndex = _itemList lbAdd format["Heli Mission 2 Status: %1 of 10 AI Remaining at mission location", "8"];
	_itemList lbSetData [(lbSize _itemList)-1, "Heli_2"];

	_itemListIndex = _itemList lbAdd format["Heli Mission 3 Status: %1 of 10 AI Remaining at mission location", "5"];
	_itemList lbSetData [(lbSize _itemList)-1, "Heli_3"];	

	_itemListIndex = _itemList lbAdd format["Aircraft Mission 1 Status: %1 of 20 AI Remaining at mission location", "11"];
	_itemList lbSetData [(lbSize _itemList)-1, "AP_1"];
	
	_itemListIndex = _itemList lbAdd format["Aircraft Mission 2 Status: %1 of 20 AI Remaining at mission location", "18"];
	_itemList lbSetData [(lbSize _itemList)-1, "AP_2"];

	_itemListIndex = _itemList lbAdd format["Aircraft Mission 3 Status: %1 of 20 AI Remaining at mission location", "15"];
	_itemList lbSetData [(lbSize _itemList)-1, "AP_3"];	
	
	
	
