if (isnil "hackm") then {hackm = 0;}; if (hackm == 0) then {hackm = 1; hint "Hacked Air ON";} else {hackm = 0; hint "Hacked Air OFF";};
while {hackm == 1} do
{
	{
		_hackm = str _x;
		deleteMarkerLocal _hackm;
		_hackm = createMarkerLocal [_hackm, getPos _x];
		_hackm setMarkerTypeLocal "destroyedvehicle";
		_hackm setMarkerPosLocal getPos _x;
		_hackm setMarkerSizeLocal [0.8, 0.8];
		_hackm setMarkerTextLocal format["%1", getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName')];
		if (_x isKindOf "A10") then {_hackm setMarkerColorLocal ("ColorYellow");} else {_hackm setMarkerColorLocal ("ColorYellow");};
	} forEach ([6800, 9200, 0] nearEntities [["A10", "A10_US_EP1", "F35B", "C130J", "C130J_US_EP1", "AV8B2", "AV8B"], 11000]);
	sleep 1;
};
{_hackm = str _x; deleteMarkerLocal _hackm;} forEach ((entities "All"));
