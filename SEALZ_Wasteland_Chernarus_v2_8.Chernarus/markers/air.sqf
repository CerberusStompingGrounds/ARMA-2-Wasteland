if (isnil "airm") then {airm = 0;}; if (airm == 0) then {airm = 1; hint "Vehicle Markers ON";} else {airm = 0; hint "Vehicle Markers OFF";};
while {airm == 1} do
{
	{
		_airm = str _x;
		deleteMarkerLocal _airm;
		_airm = createMarkerLocal [_airm, getPos _x];
		_airm setMarkerTypeLocal "destroyedvehicle";
		_airm setMarkerPosLocal getPos _x;
		_airm setMarkerSizeLocal [0.6, 0.6];
		_airm setMarkerTextLocal format["%1", getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName')];
		if (_x isKindOf "Helicopter") then {_airm setMarkerColorLocal ("ColorRed");} else {_airm setMarkerColorLocal ("ColorRedAlpha");};
	} forEach ([6800, 9200, 0] nearEntities [["Helicopter", "Plane"], 11000]);
	sleep 1;
};
{_airm = str _x; deleteMarkerLocal _airm;} forEach ((entities "Helicopter") + (entities "Plane"));