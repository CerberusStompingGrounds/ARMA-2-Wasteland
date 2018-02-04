
_veh = vehicle player;

if (_veh distance LHD_Center < 50) then {detach _veh;Hint "Launching"};
if (_veh distance LHD_Center > 50) then {};
if (_veh distance LHD_Center1 < 50) then {detach _veh;Hint "Launching"};
if (_veh distance LHD_Center1 > 50) then {};



