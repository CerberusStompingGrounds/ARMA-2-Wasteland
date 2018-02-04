//	@file Version: 1.0
//	@file Name: Drug Lords
//	@file Author: =SEALZ= BillyBong
//	@file Created: 05/04/2013 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_smallGrpS","_pos","_leader","_man2"];

_smallGrpS = _this select 0;
_pos = _this select 1;

//Sniper
_leader = _smallGrpS createunit ["BAF_Soldier_SniperN_MTP", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader setskill 1;
_leader addEventHandler["killed", {[_this select 0, _this select 1, "sniperGroup"] execVM "Scripts\AIKilled.sqf"}];
[_leader] join _smallGrpS;

//Spotter
_man2 = _smallGrpS createunit ["BAF_Soldier_spotterN_MTP", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 setskill 1;
_man2 addEventHandler["killed", {[_this select 0, _this select 1, "sniperGroup"] execVM "Scripts\AIKilled.sqf"}];
[_man2] join _smallGrpS;


_leader = leader _smallGrpS;
_marker = createMarker ["POSMarker", position _leader];

sleep 1;
_leader setVehicleInit "nul=[_leader,'Rogue Sniper Team (TWS Sniper)($15k)'] execVM 'scripts\SniperTracker.sqf';";
sleep 1;
_man2 setVehicleInit "nul=[_man2,'Rogue Spotter'] execVM 'scripts\SniperTracker.sqf';";
sleep 1;
_leader setVehicleInit "nul=[_leader,'POSMarker','delete:',3] execVM 'scripts\upsmon.sqf'";
//_leader setVehicleInit "nul = [_leader, 10, 'POSMarker', 'POSMarker', 2000, 'AWARE', 100, 'LIMITED', 'FILE',0,75] execVM 'scripts\USPS.sqf';";

processInitCommands;
