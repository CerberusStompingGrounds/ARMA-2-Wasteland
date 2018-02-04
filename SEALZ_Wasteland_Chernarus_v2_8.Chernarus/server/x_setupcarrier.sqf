// by Xeno
#define THIS_FILE "x_setupcarrier.sqf"
if (!isServer) exitWith {};

_LHDspawnpoint = [getPosASL LHD_Center select 0, getPosASL LHD_Center select 1, -0.9];
{
	_dummy = createVehicle [_x, _LHDspawnpoint, [], 0, "NONE"];
	_dummy setdir 270;
	_dummy setPos _LHDspawnpoint;
} foreach ["Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"];
