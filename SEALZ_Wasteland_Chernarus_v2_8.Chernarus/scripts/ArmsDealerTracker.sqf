_unit = _this select 0;
_missionName = _this select 1;
private ["_pos1"];
if (_missionName == "Arms Dealer") then
	{
		_varname = "ArmsDealer";
		createMarkerLocal [_varname, [0,0]];
		_varname setMarkerShape "ICON";
		_varname setMarkerColor "ColorRed";
		_varname setMarkerSize [1,1];
		_varname setMarkerType "dot";
		_varname setMarkerTextLocal (_missionName);	

		while {alive _unit} do {
			//_varname setMarkerDir getDir _unit;
			_varname setMarkerPos getPos _unit;
			sleep 0.5;
		};
			//deleteMarker _varname;	
	} else
	{
		_varname1 = "ArmsAssistant";
		createMarkerLocal [_varname1, [0,0]];
		_varname1 setMarkerShape "ICON";
		_varname1 setMarkerColor "ColorRed";
		_varname1 setMarkerSize [1,1];
		_varname1 setMarkerType "dot";
		_varname1 setMarkerTextLocal (_missionName);	

		while {alive _unit} do {
			//_varname1 setMarkerDir getDir _unit;
			_pos1 = getPos _unit;
			_varname1 setMarkerPos [_pos1 select 0, (_pos1 select 1) - 10, 0];
			sleep 0.5;
		};
			//deleteMarker _varname1;		
	};