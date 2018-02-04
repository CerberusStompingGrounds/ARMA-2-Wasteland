//	@file Version: 1.0
//	@file Name: largeGroup_east.sqf
//	@file Author: =SEALZ= BillyBong
//	@file Created: 05/04/2013 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_smallGrpS","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_smallGrpS = _this select 0;
_pos = _this select 1;


//leader
_leader = _smallGrpS createunit ["US_Delta_Force_TL_EP1", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader setskill 1;
_leader addEventHandler["killed", {[_this select 0, _this select 1, "smallGroup"] execVM "Scripts\AIKilled.sqf"}];
[_leader] join _smallGrpS;
//Anti-Tank
_man2 = _smallGrpS createunit ["US_Soldier_HAT_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 setskill 1;
_man2 addEventHandler["killed", {[_this select 0, _this select 1, "smallGroup"] execVM "Scripts\AIKilled.sqf"}];
[_man2] join _smallGrpS;
//Anti-Air
_man7 = _smallGrpS createunit ["US_Soldier_AA_EP1", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 setskill 1;
_man7 addEventHandler["killed", {[_this select 0, _this select 1, "smallGroup"] execVM "Scripts\AIKilled.sqf"}];
[_man7] join _smallGrpS;
//Machine Gunner
_man10 = _smallGrpS createunit ["US_Soldier_AR_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 setskill 1;
_man10 addEventHandler["killed", {[_this select 0, _this select 1, "smallGroup"] execVM "Scripts\AIKilled.sqf"}];
[_man10] join _smallGrpS;

_leader = leader _smallGrpS;
_marker = createMarker ["POSMarker", position _leader];

_leader setVehicleInit "nul=[_leader,'POSMarker','noveh','fortify','combat','delete:',3] execVM 'scripts\upsmon.sqf'";

processInitCommands;