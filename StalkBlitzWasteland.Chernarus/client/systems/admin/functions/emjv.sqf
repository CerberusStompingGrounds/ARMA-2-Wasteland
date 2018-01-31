private["_ksbw"];_ksbw=_this select 0;['Paste',[worldname,_ksbw,0,0.7,[0,0],0,0,daytime*60,overcast,0]]call raeq;_this spawn{disableSerialization;waituntil{!isnil{uinamespace getvariable'bis_fnc_camera_display'}};[]call ylmh;_jmsj=uinamespace getvariable'bis_fnc_camera_display';_jmsj displayAddEventHandler["KeyDown","
		if ( (_this select 1) == 219 ) then {
			qptp = true;
		};
	"];_jmsj displayAddEventHandler["KeyUp","
		if ( (_this select 1) == 219 ) then {
			qptp = false;
		};
	"];_jmsj displayAddEventHandler["Unload","
		false call ylmh;
		nil
	"];_woog=[_this,1,{},[{}]]call jdly;[_jmsj]call _woog};