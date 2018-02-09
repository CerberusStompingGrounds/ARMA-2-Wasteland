private["_vehicleType", "_lastServiceTime", "_canService", "_timeRemaining", "_magazines", "_removedMagazines", "_turretCount", "_turretConfig", "_turretMagazines", "_removedTurretMagazines", "_driverTurretCount", "_driverTurretConfig", "_driverTurretMagazines", "_removedDriverMagazines"];
_veh = vehicle player;
_lastServiceTime = _veh getVariable "lastServiceTime";
_canService = true;
_interrupt = false;
_maxDist = 10;
_startPos = getPosATL _veh;
if (isNil "x_reload_time_factor") then {x_reload_time_factor = 1};
if(!isNil { _lastServiceTime }) then {
	_timeRemaining = 300 - floor(time - _lastServiceTime);
	if(_timeRemaining < 0) then {
		_timeRemaining = 0;
	};
	if(_timeRemaining > 0) then {
		_veh vehicleChat format["You can only service a vehicle once every 5 minutes, %1 seconds remaining.", _timeRemaining];
		_canService = false;
	};
};
if(!_canService) exitWith {};
if(_veh isKindOf "ParachuteBase") exitWith {};
if(_veh == player) exitWith {};
_veh setVariable["lastServiceTime", time, false];
_vehicleType = typeOf _veh;
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat format["Servicing %1, please stand by...", _vehicleType];
sleep x_reload_time_factor;
//Repairs vehicle
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat format["Repairing %1...", _vehicleType];
_veh setDamage 0;
sleep x_reload_time_factor;
//Refuels vehicle
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat format["Refueling %1...", _vehicleType];
_veh setFuel 1;
sleep x_reload_time_factor;
//Begins rearming vehicle
scopeName "reloadVehicle";
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat "Rearming... This will take 15 seconds! DO NOT MOVE!";
sleep 5;
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat "10 Seconds remaining!";
sleep 5;
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat "5 Seconds remaining!";
sleep 4;
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
_veh vehicleChat "1 Seconds remaining!";
sleep 1;
if (!alive _veh || _veh distance _startPos > _maxDist) exitWith {_veh vehicleChat "Service interrupted. Please wait 5 minutes before reusing the pad!"};
sleep x_reload_time_factor;
if(!alive _veh) exitWith {};

if (!_interrupt) then {
	_veh setVehicleAmmo 1;
	_veh vehicleChat format ["%1 is ready...", _vehicleType];
}
else {
	_veh vehicleChat ["Service interrupted on %1. Please wait 5 minutes before trying again!", _vehicleType];
};