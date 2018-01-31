private["_ztov"];_ztov=_this select 0;['Paste',[worldname,_ztov,0,0.7,[0,0],0,0,daytime*60,overcast,0]]call qeyq;_this spawn{disableSerialization;waituntil{!isnil{uinamespace getvariable'bis_fnc_camera_display'}};[]call nxyu;_stoe=uinamespace getvariable'bis_fnc_camera_display';_stoe displayAddEventHandler["KeyDown","
		if ( (_this select 1) == 219 ) then {
			srld = true;
		};
	"];_stoe displayAddEventHandler["KeyUp","
		if ( (_this select 1) == 219 ) then {
			srld = false;
		};
	"];_stoe displayAddEventHandler["Unload","
		false call nxyu;
		nil
	"];_mudv=[_this,1,{},[{}]]call clht;[_stoe]call _mudv};