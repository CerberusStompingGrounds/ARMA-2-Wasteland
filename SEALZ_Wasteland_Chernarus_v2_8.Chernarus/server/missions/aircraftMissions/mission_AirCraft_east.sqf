if(!isServer) exitwith {};
private ["_eastGrpS","_eastGrpT","_unitsAliveTotal","_unitsAlive2","_unitsAlive","_playerPresent","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_picture","_vehicleName","_rad","_centerPos","_missionTimeOut","_missionDelayTime","_missionTriggerRadius","_missionPlayerRadius","_flatAreas","_randomArea","_hint","_startTime","_currTime","_result","_c130wreck","_box","_box2","_smallbase1","_smallbase2","_base1","_base","_randomPos"];

//Mission Initialization.
_rad=20000;
_result = 0;
_missionType = "=SEALZ= Air Warfare!";
_mainTextColour = "#4BC9B0";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 4800;
_missionDelayTime = 1200;
_missionPlayerRadius = 750; //original 50
_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_PlaneMarray = ["A10_US_EP1","Su25_TK_EP1","Su25_CDF","Su25_INS","Su39",
				"Su34","C130J","L39_TK_EP1","C130J_US_EP1","A10",
				"AV8B","F35B","AV8B2","L39_TK_EP1"];
				
_SmallBaseArray = ["aaLauncher","kordSandbags","m2smallBunker","outpostUS1",
				 "spg9Sandbags","towerFortMgUS","zuSandbags"];				

_largeBaseArray = ["barracksAreaUS","base","baseLargeWalled","outpostUSA1","outpostUSB1","zuCamp"];

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
_base1 = ["AirCraft_Spawn1"] call BIS_fnc_selectRandom;		
_base2 = ["AirCraft_Spawn1_1"] call BIS_fnc_selectRandom;	

	_smallbase1 = ["AirCraft_Spawn1_2"] call BIS_fnc_selectRandom;
	_smallbase2 = ["AirCraft_Spawn1_3"] call BIS_fnc_selectRandom;
	_smallbase3 = ["AirCraft_Spawn1_1_1"] call BIS_fnc_selectRandom;
	_smallbase4 = ["AirCraft_Spawn1_1_2"] call BIS_fnc_selectRandom;
  

_randomPos = getMarkerPos (_base1); 
_randomPos2 = getMarkerPos (_base2);   
_smallbase1Pos = getMarkerPos (_smallbase1);
_smallbase2Pos = getMarkerPos (_smallbase2);
_smallbase3Pos = getMarkerPos (_smallbase3);
_smallbase4Pos = getMarkerPos (_smallbase4);
//Tell everyone their will be a mission soon. 
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>=SEALZ=<br/>Air Warfare!</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>An Aircraft Mission will spawn in the NW Airfield in %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour];
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
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Air Warfare!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, will be rewarded to you after you have liberated the enemy AI stronghold at the NW (Vybor) Airfield. Reports state that there are 20 well armed enemies. GOOD LUCK!</t>", _missionType, _picture, _vehicleName, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

//Add marker to client marker array.
_missionName = format ["%1 Mission",_vehicleName];
clientMissionMarkers set [count clientMissionMarkers,["Aircraft_Marker1",_randomPos,_missionName, "ColorRed"]];
publicVariable "clientMissionMarkers";

_mainBase1 = _largeBaseArray select (random (count _largeBaseArray - 1));
_largeBase1 = [_mainBase1, 285, _randomPos] execVM "server\functions\objectMapper.sqf";
sleep 5;
_mainBase2 = _largeBaseArray select (random (count _largeBaseArray - 1));
_largeBase2 = [_mainBase2, 285, _randomPos2] execVM "server\functions\objectMapper.sqf";
sleep 5;
_smallBase1 = _SmallBaseArray select (random (count _SmallBaseArray - 1));
_subBase1 = [_smallBase1, 285, _smallbase1Pos] execVM "server\functions\objectMapper.sqf";
sleep 5;
_smallBase2 = _SmallBaseArray select (random (count _SmallBaseArray - 1));
_subBase2 = [_smallBase2, 285, _smallbase2Pos] execVM "server\functions\objectMapper.sqf";
sleep 5;
_smallBase3 = _SmallBaseArray select (random (count _SmallBaseArray - 1));
_subBase3 = [_smallBase3, 285, _smallbase3Pos] execVM "server\functions\objectMapper.sqf";
sleep 5;
_smallBase4 = _SmallBaseArray select (random (count _SmallBaseArray - 1));
_subBase4 = [_smallBase4, 285, _smallbase4Pos] execVM "server\functions\objectMapper.sqf";
sleep 10;
_eastGrpS = createGroup civilian;
[_eastGrpS,_randomPos]execVM "server\missions\createUnits\largeGroup.sqf";
sleep 10;
_eastGrpT = createGroup civilian;
[_eastGrpT,_randomPos2]execVM "server\missions\createUnits\largeGroup.sqf";
diag_log format ["#############################Spawned in Large Base Type: %1 at %2 Vihicle: %3 Mission: %4 #############################", _mainBase1,_base1,_vehicleName,_missionName];
deleteVehicle _plane3;
_startTime = floor(time);
waitUntil
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
	{if((isPlayer _x) AND (_x distance _randomPos <= _missionPlayerRadius)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units _eastGrpS);
	_unitsAlive2 = ({alive _x} count units _eastGrpT);
	_unitsAliveTotal = (_unitsAlive) + (_unitsAlive2);
	[_randomPos,_unitsAliveTotal,"Aircraft_Marker12","ColorRed","20"]execVM "scripts\MissionTracker.sqf";	
    (_result == 1) OR (_unitsAliveTotal < 1)
};

if(_result == 1) then
{
	//Mission Failed.
	_PosDelete = getMarkerPos ("MainNWAFPlaneSpawn"); //Get the position to delete objects
	{deleteVehicle _x} forEach nearestObjects [_PosDelete, _objtoRemoveArray, 250]; //delete all the base objects
    {deleteVehicle _x;}forEach units _eastGrpS; //delete the first group units
    deleteGroup _eastGrpS; //delete the group container
    {deleteVehicle _x;}forEach units _eastGrpT; //delete the second group
    deleteGroup _eastGrpT;  //delete the group container
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Air Warfare!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Balota Airfield Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, _failTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
} else {
	//Mission Complete.
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Air Warfare!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The NW Airfield AirCraft has been claimed. Nice Job!</t>", _missionType, _picture, _vehicleName, _successTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	sleep 10;
	
    {deleteVehicle _x;}forEach units _eastGrpS;	//delete the first group
	deleteGroup _eastGrpS; // delete the group container
    {deleteVehicle _x;}forEach units _eastGrpT;	//delete the second group
	deleteGroup _eastGrpT;  //delete the group container
	_PosDelete = getMarkerPos ("MainNWAFPlaneSpawn"); // get the position to delete objects
	{deleteVehicle _x} forEach nearestObjects [_PosDelete, _objtoRemoveArray, 250]; //delete all the base objects
	sleep 2;
	
	_randomPosPlane = getMarkerPos ("MainNWAFPlaneSpawn");	
	_plane2 = createVehicle [_plane2_temp,[(_randomPosPlane select 0), (_randomPosPlane select 1),0],[], 0, "NONE"];
	_plane2 setdamage 0;
	_plane2 setVariable["original",1,true];	
};

//Remove marker from client marker array.
{
    if(_x select 0 == "Aircraft_Marker1") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
AC_MissionRunning = false;