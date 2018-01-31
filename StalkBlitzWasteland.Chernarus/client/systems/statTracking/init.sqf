if(!hasInterface)exitwith{};qwkw=false;[]spawn{waitUntil{!isNull player&&player==player};waitUntil{!(isNull(findDisplay 46))};(findDisplay 46)displayAddEventHandler['KeyDown',"
		if ( (_this select 1) in actionKeys 'NetworkStats' && !qwkw) then {
			qwkw = true;
			10 cutRsc ['scoreboardRsc', 'PLAIN'];
			true
		};
	"];(findDisplay 46)displayAddEventHandler['KeyUp',"
		if ( (_this select 1) in actionKeys 'NetworkStats' ) then {
			qwkw = false;
			10 cutText ['', 'PLAIN'];
		};
	"]};