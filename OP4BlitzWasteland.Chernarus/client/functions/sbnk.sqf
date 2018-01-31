_eraj=_this select 0;(_this select 0)displayAddEventHandler['KeyDown',"
	if ( (_this select 1) == 1 ) then {
		createDialog 'abortConfirm';
		true
	};
"];