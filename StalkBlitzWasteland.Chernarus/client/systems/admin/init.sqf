bladmin_actions=[];[]spawn{_gjac=[['Spectate player','spec',false],['Freelook at player','freelook',false],['Slay','slay',false],['Show group members','group',false],['View Gear','gear',false],['Delete Cam','delete',true],['Reveal items on Map','reveal',true],['Mark mission as failed','missions',true]];waitUntil{!isNull player&&player==player};waitUntil{!(isNull(findDisplay 46))};qptp=false;(findDisplay 46)displayAddEventHandler["KeyDown","
		if ( (_this select 1) == 219 ) then {
			qptp = true;
		};
	"];(findDisplay 46)displayAddEventHandler["KeyUp","
		if ( (_this select 1) == 219 ) then {
			qptp = false;
		};
	"];uiNamespace setVariable['raeq',raeq];uiNamespace setVariable['jdly',jdly];uiNamespace setVariable['tylb',tylb];uiNamespace setVariable['nsmq',nsmq];uiNamespace setVariable['bis_fnc_getpitchbank',bis_fnc_getpitchbank];uiNamespace setVariable['bis_fnc_setpitchbank',bis_fnc_setpitchbank];uiNamespace setVariable['bis_fnc_rotatevector2d',bis_fnc_rotatevector2d];uiNamespace setVariable['cxwi',cxwi];pvar_adminpermissions=player;publicVariableServer"pvar_adminpermissions";pvar_adminpermissionsres=nil;waitUntil{!isNil"pvar_adminpermissionsres"};{if((_x select 1)in pvar_adminpermissionsres)then{bladmin_actions set[count bladmin_actions,_x]}}forEach _gjac};