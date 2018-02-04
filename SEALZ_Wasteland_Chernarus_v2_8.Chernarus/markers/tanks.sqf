if (isnil "tankm") then {tankm = 0;}; if (tankm == 0) then {tankm = 1; hint "Vehicle Markers ON";} else {tankm = 0; hint "Vehicle Markers OFF";};
while {tankm == 1} do
{
	{
		_vm = str _x;
		deleteMarkerLocal _vm;
		_tankm = createMarkerLocal [_vm, getPos _x];
		_tankm setMarkerTypeLocal "destroyedvehicle";
		_tankm setMarkerPosLocal getPos _x;
		_tankm setMarkerSizeLocal [0.8, 0.8];
		_tankm setMarkerTextLocal format["%1", getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName')];
		if (_x isKindOf "Tank") then {_tankm setMarkerColorLocal ("ColorGreen");} else {_tankm setMarkerColorLocal ("ColorGreenAlpha");};
	} forEach ([6800, 9200, 0] nearEntities [["Tank"], 11000]);
	sleep 1;
};
{_tankm = str _x; deleteMarkerLocal _tankm;} forEach ((entities "Tank") + (entities ""));