if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Light Mission State"];

//Main Mission Array
_MMarray = [ 
			"mission_lightArtillery",
			"mission_Truck",
			 "mission_lightAAA"];	
//_MMarray = ["mission_lightAAA"];
			 
sideMissionRunning = false;
//_startTime = floor(time);
//result = 0;

while {true} do
{
    // _currTime = floor(time);
	// if(_currTime - _startTime >= 3300) then {_result = 1;};
    // if(_result == 1) then
    // {
    	// sideMissionRunning = false;    
    // };
    
	if(!sideMissionRunning) then
    {
        sleep 15;
        _mission = _MMarray select (random (count _MMarray - 1));
        execVM format ["server\missions\sideMissions\%1.sqf",_mission];
		sideMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Light Mission - %1",_mission];
        //_startTime = floor(time);
        //_result = 0;
    } else {
    	sleep 1;  
    };    
};