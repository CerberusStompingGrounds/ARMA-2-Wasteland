private["_erah"];_erah=[_this,0,objNull,[objNull]]call clht;fbfr=[player,format['%1 (%2) began spectating %3 (%4)',name player,getPlayerUID player,name _erah,getPlayerUID _erah]];publicVariableServer"fbfr";createDialog'RscSpectator';_erah spawn{waitUntil{!isNil"wxjh"};wxjh=_this;[]call nxyu;vehicle wxjh switchcamera cameraview;((uiNamespace getVariable'dqkm')displayCtrl 3141)ctrlSetText(name wxjh);(uiNamespace getVariable'dqkm')displayAddEventHandler["Unload","
		false call nxyu;
		nil
	"]};