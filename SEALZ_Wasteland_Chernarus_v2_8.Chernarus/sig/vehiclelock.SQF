#define THIS_FILE "vehiclelock.sqf"
if (!local _unit) exitWith {};

_vehicle = _this select 0;  

_vehicle addEventHandler ["GetIn", 
{
private ["_veh", "_pos", "_unit", "_namesArray"];
_veh = _this select 0;
_pos = _this select 1;
_unit = _this select 2;
_namesArray = ["2546566AX"];

if !((getPlayerUID _unit) in _namesArray) then
{
_unit action ["getOut", vehicle _unit];

Hintsilent "";
};
}];  

