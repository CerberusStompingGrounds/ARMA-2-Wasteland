if(!hasInterface)exitwith{};jtja=false;[]spawn{waitUntil{!isNull player&&player==player};waitUntil{!(isNull(findDisplay 46))};(findDisplay 46)displayAddEventHandler['KeyDown',"
		if ( (_this select 1) in actionKeys 'NetworkStats' && !jtja) then {
			jtja = true;
			10 cutRsc ['scoreboardRsc', 'PLAIN'];
			true
		};
	"];(findDisplay 46)displayAddEventHandler['KeyUp',"
		if ( (_this select 1) in actionKeys 'NetworkStats' ) then {
			jtja = false;
			10 cutText ['', 'PLAIN'];
		};
	"]};