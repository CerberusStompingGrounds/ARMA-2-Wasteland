private["_tmia"];_tmia=[_this,0,objNull,[objNull]]call jdly;nmkv=[player,format['%1 (%2) began spectating %3 (%4)',name player,getPlayerUID player,name _tmia,getPlayerUID _tmia]];publicVariableServer"nmkv";createDialog'RscSpectator';_tmia spawn{waitUntil{!isNil"vpud"};vpud=_this;[]call ylmh;vehicle vpud switchcamera cameraview;((uiNamespace getVariable'rogy')displayCtrl 3141)ctrlSetText(name vpud);(uiNamespace getVariable'rogy')displayAddEventHandler["Unload","
		false call ylmh;
		nil
	"]};