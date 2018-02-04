if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Plane Mission State"];

AC_MissionRunning = false;
//AC_WestMissionRunning = false;
//AC_IndyMissionRunning = false;
//_startTime = floor(time);
//_result = 0;

_MMarray = ["mission_AirCraft_east",
			"mission_AirCraft_indy"
			];  


while {true} do
{
    // _currTime = floor(time);
	// if(_currTime - _startTime >= 3300) then {_result = 1;};
    // if(_result == 1) then
    // {
    	// AC_MissionRunning = false;    
    // };
    
 	if (!AC_MissionRunning) then	
    {	
        sleep 15;
	    _mission = _MMarray select (random (count _MMarray - 1));
        execVM format["server\missions\aircraftMissions\%1.sqf",_mission];
		AC_MissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Plane Mission - %1",_mission];
        //_startTime = floor(time);
        //_result = 0;
    } else {
    	sleep 1;  
    }; 	
};