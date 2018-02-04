
_veh = vehicle player;
if (_veh distance LHD_Center > 40) then {};
if (_veh distance LHD_Center < 40) then {
if (vehicle player isKindOf "RHIB2Turret") exitwith {_veh attachTo [aav_4,[0,0,-5.5]];hint "Docking"};
if (vehicle player isKindOf "RHIB") exitwith {_veh attachTo [aav_1,[0,0,-5.5]];hint "Docking"};
if (vehicle player isKindOf "Zodiac") exitwith {_veh attachTo [aav_2,[0,0,-5.2]];hint "Docking"};
if (vehicle player isKindOf "PBX") exitwith {_veh attachTo [aav_3,[0,0,-4.8]]};hint "Docking"};

if (_veh distance LHD_Center1 > 40) then {};
if (_veh distance LHD_Center1 < 40) then {
if (vehicle player isKindOf "RHIB2Turret") exitwith {_veh attachTo [aav_4a,[0,0,-5.5]];hint "Docking"};
if (vehicle player isKindOf "RHIB") exitwith {_veh attachTo [aav_1a,[0,0,-5.5]];hint "Docking"};
if (vehicle player isKindOf "Zodiac") exitwith {_veh attachTo [aav_2a,[0,0,-5.2]];hint "Docking"};
if (vehicle player isKindOf "PBX") exitwith {_veh attachTo [aav_3a,[0,0,-4.8]]};hint "Docking"};




/*
RHIB2Turret
if (vehicle player isKindOf "RHIB") exitwith {_veh attachTo [aav_1,[0,0,-5.5]]};
if (vehicle player isKindOf "Zodiac") exitwith {_veh attachTo [aav_2,[0,0,-5.2]]};
if (vehicle player isKindOf "PBX") exitwith {_veh attachTo [aav_3,[0,0,-4.8]]};


