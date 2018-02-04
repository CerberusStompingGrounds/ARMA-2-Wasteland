_unit = _this select 0;
_missionName = _this select 1;
private ["_pos"];
diag_log format["Starting Terrorist Tracker - Initialized"];
if (_missionName == "Terrorists (Explosives)($30k)") then
	{
		_varname = "TerroristLeader";
		createMarkerLocal [_varname, [0,0]];
		_varname setMarkerShape "ICON";
		_varname setMarkerColor "ColorRed";
		_varname setMarkerSize [1,1];
		_varname setMarkerType "dot";
		_varname setMarkerTextLocal (_missionName);	
		diag_log format["Terrorist Tracker - Marked Leader"];
		while {alive _unit} do {
			//_varname setMarkerDir getDir _unit;
			_varname setMarkerPos getPos _unit;
			sleep 0.5;
		};
			//deleteMarker _varname;
			//diag_log format["Terrorist Tracker - Deleted Leader Marker"];
	};
	
if (_missionName == "Terrorists") then
	{
		_varname1 = "Terrorists";
		createMarkerLocal [_varname1, [0,0]];
		_varname1 setMarkerShape "ICON";
		_varname1 setMarkerColor "ColorRed";
		_varname1 setMarkerSize [1,1];
		_varname1 setMarkerType "dot";
		_varname1 setMarkerTextLocal (_missionName);	
		diag_log format["Terrorist Tracker - Marked Terorist 1"];
		while {alive _unit} do {
			//_varname1 setMarkerDir getDir _unit;
			_pos = getPos _unit;
			_varname1 setMarkerPos [_pos select 0, (_pos select 1) - 10, 0];
			sleep 0.5;
		};
			//diag_log format["Terrorist Tracker - Deleted Terorist 1 Marker"];		
			//deleteMarker _varname1;		
	};
	
if (_missionName == "Terrorist") then
	{
		_varname2 = "Terrorist";
		createMarkerLocal [_varname2, [0,0]];
		_varname2 setMarkerShape "ICON";
		_varname2 setMarkerColor "ColorRed";
		_varname2 setMarkerSize [1,1];
		_varname2 setMarkerType "dot";
		_varname2 setMarkerTextLocal (_missionName);	
		diag_log format["Terrorist Tracker - Marked Terorist 2"];
		while {alive _unit} do {
			//_varname1 setMarkerDir getDir _unit;
			_pos = getPos _unit;
			_varname2 setMarkerPos [_pos select 0, (_pos select 1) + 10, 0];
			sleep 0.5;
		};
			//diag_log format["Terrorist Tracker - Deleted Terorist 2 Marker"];		
			//deleteMarker _varname2;		
	};	
diag_log format["Terminating Terrorist Tracker - Terminated"];	