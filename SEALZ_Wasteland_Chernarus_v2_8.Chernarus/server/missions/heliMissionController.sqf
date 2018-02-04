if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Heli Mission State - mission_AirCraft_East"];

AC_EastHeliMissionRunning = false;
//_startTime = floor(time);
//_result = 0;

while {true} do
{
    // _currTime = floor(time);
	// if(_currTime - _startTime >= 3300) then {_result = 1;};
    // if(_result == 1) then
    // {
    	// AC_EastHeliMissionRunning = false;    
    // };
	if (!AC_EastHeliMissionRunning) then	
    {
        sleep 15;
        execVM format["server\missions\aircraftMissions\mission_Heli_east.sqf"];
		AC_EastHeliMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Heli Mission - mission_Heli_east"];
        //_startTime = floor(time);
        //_result = 0;
    } else {
    	sleep 1;  
    }; 
};