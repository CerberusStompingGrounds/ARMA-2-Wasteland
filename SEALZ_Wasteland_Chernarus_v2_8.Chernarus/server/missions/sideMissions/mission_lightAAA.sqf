if(!isServer) exitwith {};
private ["_player","_CivGrpA","_unitsAlive2","_unitsAlive","_playerPresent","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_picture","_vehicleName","_rad","_centerPos","_missionTimeOut","_missionDelayTime","_missionTriggerRadius","_missionPlayerRadius","_flatAreas","_randomArea","_hint","_startTime","_currTime","_result","_tank"];

//Mission Initialization.
_rad=20000;
_result = 0;
_missionType = "Light Anti Air";
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 1800;
_missionDelayTime = 300; //300
_missionPlayerRadius = 150; //original 50
_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_flatAreas = nearestLocations [_centerPos, ["FlatArea"], _rad];
_randomPos = getpos (_flatAreas select random (count _flatAreas -1));

_SmallBaseArray = ["aaLauncher",
				"kordSandbags",
				"m2smallBunker",
				"outpostUS1",
				"spg9Sandbags",
				"towerFortMgUS",
				"zuSandbags"];	
_objtoRemoveArray = ["Stinger_Pod_US_EP1",
				"Land_fort_bagfence_round",
				"AmmoCrates_NoInteractive_Small",
				"Land_fort_bagfence_long",
				"Land_fort_bagfence_corner",
				"Misc_Backpackheap_EP1",
				"Garbage_container",
				"Land_Barrack2_EP1",
				"HeliH",
				"Barrel5",
				"Fort_RazorWire",
				"Land_Toilet",
				"Land_HBarrier5",
				"PowGen_Big_EP1",
				"Land_fortified_nest_big",
				"Land_Antenna",
				"Land_fortified_nest_small",
				"M2StaticMG",
				"M2StaticMG_US_EP1",
				"US_WarfareBBarracks_Base_EP1",
				"MASH_EP1",
				"US_WarfareBVehicleServicePoint_Base_EP1",
				"Satelit",
				"Land_HBarrier_large",
				"PowerGenerator_EP1",
				"MASH",
				"CampEast",
				"Land_transport_crates_EP1",
				"Fort_Crate_wood",
				"Land_HBarrier3",
				"Hedgehog",
				"Land_Fort_Watchtower_EP1",
				"AmmoCrates_NoInteractive_Medium",
				"ZavoraAnim",
				"Hedgehog_EP1",
				"Fort_Nest_M240",
				"KORD_high_TK_EP1",
				"Land_BagFenceEnd",
				"Land_BagFenceShort",
				"TOW_TriPod",
				"Land_CncBlock",
				"SPG9_TK_INS_EP1",
				"Land_Fort_Watchtower",
				"BAF_L2A1_Tripod_D",
				"ZU23_Ins",
				"Land_BagFenceLong",
				"Barrack2",
				"Misc_cargo_cont_small_EP1",
				"Concrete_Wall_EP1",
				"Base_WarfareBContructionSite",
				"ZU23_TK_EP1",
				"DSHKM_TK_GUE_EP1",
				"Igla_AA_pod_TK_EP1",
				"Land_runway_edgelight",
				"Base_WarfareBBarrier10xTall",
				"Land_vez",
				"WarfareBDepot",
				"Base_WarfareBBarrier5x",
				"AmmoCrates_NoInteractive_Large",
				"ACamp_EP1",
				"SearchLight_UN_EP1",
				"ACamp",
				"SearchLight_Gue",
				"Land_Misc_Cargo1D"];
if(str(sideMissionPos) == str(_randomPos)) then
{
	_flatAreas = _flatAreas - _randomPos;    
};

_randomPos = getpos (_flatAreas select random (count _flatAreas -1));
sideMissionPos = str(_randomPos);

//Tell everyone their will be a mission soon.
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Light Anti Air Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
 _startTime = floor(time);
waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    (_result == 1)
};

_result = 0;

_veh = ["Ural_ZU23_CDF","Ural_ZU23_Gue","Ural_ZU23_INS"] call BIS_fnc_selectRandom;

_tank = createVehicle [_veh,[(_randomPos select 0), _randomPos select 1,0],[], 0, "NONE"];
_tank setFuel 0.1;
_tank setVehicleAmmo 1;
_tank setDamage 0.75;

_tank setVehicleLock "LOCKED";
_tank setVariable["original",1,true];
_tank setVariable ["R3F_LOG_disabled", true, true];

_picture = getText (configFile >> "cfgVehicles" >> typeOf _tank >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _tank >> "displayName");
_missionName = format ["%1 Mission",_vehicleName];
clientMissionMarkers set [count clientMissionMarkers,["Light_AAA_Marker",_randomPos,_missionName, "ColorGreen"]];

publicVariable "clientMissionMarkers";

_smallBase1 = _SmallBaseArray select (random (count _SmallBaseArray - 1));
_subBase1 = [_smallBase1, 285, [(_randomPos select 0) - 30, _randomPos select 1, 0]] execVM "server\functions\objectMapper.sqf";
sleep 1;
_CivGrpA = createGroup civilian;
[_CivGrpA,_randomPos]execVM "server\missions\createUnits\smallGroup.sqf";
diag_log format ["#############################Light Mission - Vehicle: %1 Mission: %2 #############################",_vehicleName,_missionName];
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Light Anti Air Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t> Mobile Anti Air Vehicle has been immobilized. Sieze it before your enemies do!</t>", _missionType, _picture, _vehicleName, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
_startTime = floor(time);
waitUntil
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _tank <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
	_unitsAlive = ({alive _x} count units _CivGrpA);
	if (damage _tank == 1) then{_unitsAlive = 0};		
	[_randomPos,_unitsAlive,"Light_AAA_Marker2","ColorGreen","4"]execVM "scripts\MissionTracker.sqf";	
    (_result == 1) OR (_unitsAlive < 1) OR (damage _tank == 1)
};
_tank setVehicleLock "UNLOCKED";
_tank setVariable ["R3F_LOG_disabled", false, true];
//deleteMarker "Light_AAA_Marker2";
if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _tank;
	{deleteVehicle _x;}forEach units _CivGrpA;	
    deleteGroup _CivGrpA;
	{deleteVehicle _x} forEach nearestObjects [_randomPos, _objtoRemoveArray, 200];
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Light Anti Air Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, _failTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;

} else {
	//Mission Complete.
    deleteGroup _CivGrpA;
	{deleteVehicle _x;}forEach units _CivGrpA;
	{deleteVehicle _x} forEach nearestObjects [_randomPos, _objtoRemoveArray, 200];	
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Light Anti Air Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The Anti Air Vehicle has been captured, now go hunt the enemy!</t>", _missionType, _picture, _vehicleName, _successTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
    _tank setVariable ["deployed", 0, true]; 
};
//Remove marker from client marker array.
{
    if(_x select 0 == "Light_AAA_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
sideMissionRunning = false;






