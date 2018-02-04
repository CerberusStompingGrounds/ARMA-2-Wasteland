if(!isServer) exitwith {};
private ["_heliEastGrpS","_unitsAlive2","_unitsAlive","_playerPresent","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_picture","_vehicleName","_rad","_centerPos","_missionTimeOut","_missionDelayTime","_missionTriggerRadius","_missionPlayerRadius","_flatAreas","_randomArea","_hint","_startTime","_currTime","_result","_c130wreck","_box","_box2","_smallbase1","_smallbase2","_base1"];

//Mission Initialization.
_rad=20000;
_result = 0;
_missionType = "=SEALZ= Heli Warfare!";
_mainTextColour = "#4BC9B0";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 3600;
_missionDelayTime = 900; //900
_missionPlayerRadius = 500; //original 50
_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_PlaneMarray = ["AH64D_EP1",
				"Mi24_D_TK_EP1",
				"AH1Z",
				"AH64D",
				"AH64D_Sidewinders",
				"Ka52Black",
				"Ka52",
				"Mi24_V",
				"Mi24_P",
				"Mi24_D",
				"BAF_Apache_AH1_D",				
				"AW159_Lynx_BAF"];

_largeBaseArray = ["barracksAreaUS",
				"base",
				"baseLargeWalled",
				"outpostUSA1",
				"outpostUSB1",
				"zuCamp"];

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

_plane2_temp = _PlaneMarray select (random (count _PlaneMarray - 1));	
_base1 = ["HeliMission_1","HeliMission_2","HeliMission_3","HeliMission_4","HeliMission_5","HeliMission_6","HeliMission_7","HeliMission_8","HeliMission_9"] call BIS_fnc_selectRandom;
_randomPos = getMarkerPos (_base1); 

//Tell everyone their will be a mission soon.
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>=SEALZ=<br/>Heli Warfare!</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>A Helicopter Mission will spawn in %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

_startTime = floor(time);
waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    (_result == 1)
};
_result = 0;

_plane3 = _plane2_temp createVehicleLocal getMarkerPos _base1;

_picture = getText (configFile >> "cfgVehicles" >> typeOf _plane3 >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _plane3 >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Heli Warfare!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, will be rewarded to you after you have liberated the enemy AI stronghold at the marker. Reports state that there are 10 well armed enemies. GOOD LUCK!</t>", _missionType, _picture, _vehicleName, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

_missionName = format ["%1 Mission",_vehicleName];
clientMissionMarkers set [count clientMissionMarkers,["Heli_Marker2",_randomPos,_missionName, "ColorOrange"]];
publicVariable "clientMissionMarkers";

_mainBase1 = _largeBaseArray select (random (count _largeBaseArray - 1));
_largeBase1 = [_mainBase1, 285, _randomPos] execVM "server\functions\objectMapper.sqf";
sleep 5;
_heliEastGrpS = createGroup civilian;
[_heliEastGrpS,_randomPos]execVM "server\missions\createUnits\largeGroup.sqf";

diag_log format ["#############################Spawned in Large Base Type: %1 at %2 Vehicle: %3 Mission: %4 #############################", _mainBase1,_base1,_vehicleName,_missionName];

deleteVehicle _plane3;
_startTime = floor(time);
waitUntil
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _randomPos <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
	_unitsAlive = ({alive _x} count units _heliEastGrpS);
	[_randomPos,_unitsAlive,"Heli_Marker22","ColorOrange","10"]execVM "scripts\MissionTracker.sqf";		
    (_result == 1) OR (_unitsAliveTotal < 1)
};

if(_result == 1) then
{
	//Mission Failed.
	_PosDelete = getMarkerPos (_base1); 
	{deleteVehicle _x} forEach nearestObjects [_PosDelete, _objtoRemoveArray, 200];
    {deleteVehicle _x;}forEach units _heliEastGrpS;
    deleteGroup _heliEastGrpS;	
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Heli Warfare!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Heli Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, _failTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
} else {
	//Mission Complete.
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Heli Warfare!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The Heli has been claimed. Nice Job!</t>", _missionType, _picture, _vehicleName, _successTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	sleep 10;
    {deleteVehicle _x;}forEach units _heliEastGrpS;	
    deleteGroup _heliEastGrpS;
	_PosDelete = getMarkerPos (_base1); //*************************************************TO DO
	{deleteVehicle _x} forEach nearestObjects [_PosDelete, _objtoRemoveArray, 200];	
	sleep 2;
	_randomPosPlane = getMarkerPos (_base1); //*************************************************TO DO
	_plane2 = createVehicle [_plane2_temp,[(_randomPosPlane select 0), (_randomPosPlane select 1),0],[], 0, "NONE"];
	_plane2 setdamage 0;
	_plane2 setVariable["original",1,true];		
};

//Remove marker from client marker array.
{
    if(_x select 0 == "Heli_Marker2") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
AC_EastHeliMissionRunning = false;