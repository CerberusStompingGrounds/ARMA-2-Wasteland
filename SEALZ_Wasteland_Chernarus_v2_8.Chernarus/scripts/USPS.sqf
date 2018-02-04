/*
Ultra Simple Patrol Script v1.4 by JW Custom

Put the below line in a units init field,
if your working with a group you only need to put it in the leaders init field.

------------------------------------------------------------------------------------------------------------
nul = [this, 500, "patrolMarker", "patrolMarker", 500, "AWARE", 100, "LIMITED", "FILE", 0, 0] execVM "USPS.sqf";  
------------------------------------------------------------------------------------------------------------

argument 0: The unit/group leader we are dealing with

argument 1: The radius size where to randomly place the unit/group within 

argument 2: The marker representing the radius center of where unit/group will be randomly placed within

argument 3: The marker representing the center of the unit/group patrol

argument 4: The radius size where unit/group will patrol within

argument 5: The behaviour of the unit/group

argument 6: Chance of unit/group existing in percentage. If set to 100 the unit/group will always exist.

argument 7: Movement speed of the unit/group.

argument 8: Group formation.

argument 9: Wait time in seconds before moving on to next waypoint. Set to 0 and theres no wait time.

argument 10: Altitude of unit/group. Unless unit/group are a air vehicle this should be set to 0.

For more detailed info read readme.rtf
*/





if (!isServer) exitWith {};

private ["_wp","_ranPos","_patrolMarker","_patrolRadius","_grp","_iniPos","_oldPos","_newPos","_grp","_spawnRadius","_unit","_spawnMarker","_unitBehaviour","_existChance","_unitSpeed","_unitFormation","_numGrp","_flyInHeight"];

_unit          = _this select 0;
_spawnRadius   = _this select 1;
_spawnMarker   = _this select 2;
_patrolMarker  = _this select 3;
_patrolRadius  = _this select 4;
_unitBehaviour = _this select 5;
_existChance   = _this select 6;
_unitSpeed     = _this select 7;
_unitFormation = _this select 8;
_unitWaittime  = _this select 9;
_flyInHeight   = _this select 10;


_unit flyInHeight _flyInHeight;

_grp = group _unit;

_chance = ceil(random 100);

if (_chance > _existChance) then { {deleteVehicle vehicle _x; deleteVehicle _x; sleep 0.1;} forEach units _grp; };

_wp = _grp addWaypoint [getMarkerPos _patrolMarker, 1];
_wp setWaypointBehaviour _unitBehaviour;
_wp setWaypointSpeed _unitSpeed;
_wp setWaypointFormation _unitFormation;
_wp setWaypointType "MOVE"; 
_wp setWaypointCombatMode "RED";
[_grp, 1] setWaypointPosition [getMarkerPos _spawnMarker, _spawnRadius];
_iniPos = getWPPos [_grp,1];



if (_unit isKindOf "Man") then 
{
{_x setpos _iniPos;} forEach units group _unit;
[_grp, 1] setWaypointPosition [getMarkerPos _patrolMarker, _patrolRadius];

sleep 2;

while {{alive _x} count units _grp > 0} do
{
waitUntil{ ((getPos leader _grp) distance (getWPPos [_grp,1]) < 5) };
sleep _unitWaittime;
[_grp, 1] setWaypointPosition [getMarkerPos _patrolMarker, _patrolRadius];
};
};




if(_unit isKindOf "Air") then 
{
{vehicle _x setpos [(_iniPos select 0) + random 50, (_iniPos select 1) + random 50, _flyInHeight];} forEach units group _unit;
[_grp, 1] setWaypointPosition [getMarkerPos _patrolMarker, _patrolRadius];

sleep 2;

while {{alive _x} count units _grp > 0} do
{
waitUntil{ ((getPos leader _grp) distance (getWPPos [_grp,1]) < (_flyInHeight * 3) - _flyInHeight) };
sleep _unitWaittime;
[_grp, 1] setWaypointPosition [getMarkerPos _patrolMarker, _patrolRadius];
};
};




if(_unit isKindOf "LandVehicle") then 
{
{vehicle _x setpos [(_iniPos select 0) + random 25, (_iniPos select 1) + random 25, 0];} forEach units group _unit;
[_grp, 1] setWaypointPosition [getMarkerPos _patrolMarker, _patrolRadius];

sleep 2;

while {{alive _x} count units _grp > 0} do
{
waitUntil{ ((getPos leader _grp) distance (getWPPos [_grp,1]) < 20) };
sleep _unitWaittime;
[_grp, 1] setWaypointPosition [getMarkerPos _patrolMarker, _patrolRadius];
};
};





