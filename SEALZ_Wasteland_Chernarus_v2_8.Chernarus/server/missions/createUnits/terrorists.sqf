//	@file Version: 1.0
//	@file Name: Terrorists
//	@file Author: =SEALZ= BillyBong
//	@file Created: 05/04/2013 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_smallGrpS","_pos","_leader","_man2","_man3"];

_smallGrpS = _this select 0;
_pos = _this select 1;

//Sniper
_leader = _smallGrpS createunit ["TK_GUE_Soldier_TL_EP1", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader setskill 1;
_leader addEventHandler["killed", {[_this select 0, _this select 1, "terroristGroup"] execVM "Scripts\AIKilled.sqf"}];
[_leader] join _smallGrpS;

//Spotter
_man2 = _smallGrpS createunit ["TK_GUE_Soldier_HAT_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 setskill 1;
_man2 addEventHandler["killed", {[_this select 0, _this select 1, "terroristGroup"] execVM "Scripts\AIKilled.sqf"}];
[_man2] join _smallGrpS;

//Spotter
_man3 = _smallGrpS createunit ["TK_GUE_Soldier_AA_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man3 setskill 1;
_man3 addEventHandler["killed", {[_this select 0, _this select 1, "terroristGroup"] execVM "Scripts\AIKilled.sqf"}];
[_man3] join _smallGrpS;

_leader = leader _smallGrpS;
_marker = createMarker ["POSMarker", position _leader];

sleep 1;
_leader setVehicleInit "nul=[_leader,'Terrorists (Explosives)($30k)'] execVM 'scripts\TerroristsTracker.sqf';";
sleep 1;
_man2 setVehicleInit "nul=[_man2,'Terrorists'] execVM 'scripts\TerroristsTracker.sqf';";
sleep 1;
_man3 setVehicleInit "nul=[_man3,'Terrorist'] execVM 'scripts\TerroristsTracker.sqf';";
sleep 1;
_leader setVehicleInit "nul=[_leader,'POSMarker','delete:',3] execVM 'scripts\upsmon.sqf'";

processInitCommands;
