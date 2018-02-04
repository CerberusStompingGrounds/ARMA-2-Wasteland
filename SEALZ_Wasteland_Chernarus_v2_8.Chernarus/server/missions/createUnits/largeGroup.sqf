if(!X_Server) exitWith {};

private ["_largeGrpS","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_largeGrpS = _this select 0;
_pos = _this select 1;


////leader
_leader = _largeGrpS createunit ["US_Delta_Force_TL_EP1", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader setskill 1;
_leader addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_leader] join _largeGrpS;
//Anti-Tank
_man2 = _largeGrpS createunit ["US_Soldier_HAT_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 setskill 1;
_man2 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man2] join _largeGrpS;
//Medic
_man3 = _largeGrpS createunit ["US_Delta_Force_Medic_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 setskill 1;
_man3 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man3] join _largeGrpS;
//Sapper
_man4 = _largeGrpS createunit ["US_Soldier_Engineer_EP1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 setskill 1;
_man4 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man4] join _largeGrpS;
//Sniper
_man5 = _largeGrpS createunit ["US_Soldier_SniperH_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man5 setskill 1;
_man5 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man5] join _largeGrpS;
//Machine Gunner
_man6 = _largeGrpS createunit ["US_Soldier_MG_EP1", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man6 setskill 1;
_man6 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man6] join _largeGrpS;
//Anti-Air
_man7 = _largeGrpS createunit ["US_Soldier_AA_EP1", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 setskill 1;
_man7 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man7] join _largeGrpS;
//Grenadier
_man8 = _largeGrpS createunit ["US_Soldier_GL_EP1", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
_man8 setskill 1;
_man8 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man8] join _largeGrpS;
//sabateur
_man9 = _largeGrpS createunit ["US_Soldier_Spotter_EP1", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
_man9 setskill 1;
_man9 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man9] join _largeGrpS;
//Machine Gunner
_man10 = _largeGrpS createunit ["US_Soldier_AR_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 setskill 1;
_man10 addEventHandler["killed", {[_this select 0, _this select 1, "largeGroup"] execVM "scripts\AIKilled.sqf"}];
[_man10] join _largeGrpS;

_leader = leader _largeGrpS;
_marker = createMarker ["POSMarker", position _leader];

_leader setVehicleInit "nul=[_leader,'POSMarker','noveh','fortify','combat','delete:',3] execVM 'scripts\upsmon.sqf'";

processInitCommands;