if(!isServer) exitwith {};
private ["_CivGrpD","_unitsAlive","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_picture","_vehicleName","_missionTimeOut","_missionDelayTime","_hint","_startTime","_currTime","_result","_randomPos","_rndPOS"];
sealzMissionRunning = true;
//Mission Initialization.
_result = 0;
_missionType = "Rogue Sniper Team";
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 2400;
_missionDelayTime = 420;

_rndPOS = ["sealzMission1","sealzMission2","sealzMission3","sealzMission4","sealzMission5","sealzMission6"] call BIS_fnc_selectRandom;
_randomPos = getMarkerPos (_rndPOS);

//Tell everyone their will be a mission soon.
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Rogue Sniper Team Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

_startTime = floor(time);
waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    (_result == 1)
};

_result = 0;
_picture =  getText(configFile >> "cfgWeapons" >> "BAF_AS50_TWS" >> "picture");
_vehicleName = getText(configFile >> "cfgWeapons" >> "BAF_AS50_TWS" >> "displayName");
//Add marker to client marker array.
 _missionName = format ["%1 Mission",_vehicleName];
_CivGrpD = createGroup civilian;
[_CivGrpD,_randomPos]execVM "server\missions\createUnits\sniperTWS.sqf";
diag_log format ["#############################=SEALZ= Mission - Vehicle: %1 Mission: %2 #############################",_vehicleName,_missionName];
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Rogue Sniper Team Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t> A Rogue Sniper and his Spotter have stolen a cache of TWS Sniper weapons and cash. Eliminate the criminals and you can have their weapons cache and money.</t>", _missionType, _picture, _vehicleName, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
_startTime = floor(time);
waitUntil
{
    sleep 1; 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
	_unitsAlive = ({alive _x} count units _CivGrpD);
    (_result == 1) OR (_unitsAlive < 1)
};
if (_unitsAlive < 1) then
	{
		deleteMarker "Sniper";
		deleteMarker "Spotter";
	};
if(_result == 1) then
{
	//Mission Failed.
	{deleteVehicle _x;}forEach units _CivGrpD;	
    deleteGroup _CivGrpD;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Rogue Sniper Team Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, _failTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
		deleteMarker "Sniper";
		deleteMarker "Spotter";	
	diag_log format ["#############################=SEALZ= Mission FAILED!!!- Vehicle: %1 Mission: %2 #############################",_vehicleName,_missionName];
} else {
	//Mission Complete.
	_leader = leader _CivGrpD;
	["TWSSniper", position _leader] execVM "server\spawning\boxCreation.sqf";
	_m = "EvMoney" createVehicle (position _leader);
	_m setVariable["money", 15000, true];
	_m setVariable ["owner", "world", true];	
	{deleteVehicle _x;}forEach units _CivGrpD;	
    deleteGroup _CivGrpD;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Rogue Sniper Team Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The Rogue Sniper and his spotter have been eliminated. He dropped his weapons cache and his money. Search around the dead body or the vehicle.</t>", _missionType, _picture, _vehicleName, _successTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
		deleteMarker "Sniper";
		deleteMarker "Spotter";	
	diag_log format ["#############################=SEALZ= Mission Successfully complete - Vehicle: %1 Mission: %2 #############################",_vehicleName,_missionName];
};
sealzMissionRunning = false;






