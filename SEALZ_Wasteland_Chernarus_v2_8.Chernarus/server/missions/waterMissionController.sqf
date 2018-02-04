if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Water Mission State"];

//Main Mission Array
// _MMarray = ["mission_Pirates"];
			
waterMissionRunning = false;
waterMissionRunning2 = false;
waterMissionRunning3 = false;
// _startTime = floor(time);
// _startTime2 = floor(time);
// _startTime3 = floor(time);
//_result = 0;
//_result2 = 0;
//_result3 = 0;
while {true} do
{
    // _currTime = floor(time);
	// if(_currTime - _startTime >= 3300) then {_result = 1;};
    // if(_result == 1) then
    // {
    	// waterMissionRunning = false;  	
    // };
    
	if(!waterMissionRunning) then
    {
        sleep 15;
        execVM format ["server\missions\waterMissions\mission_Pirates.sqf","mission_Pirates"];
		waterMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Water Mission - %1","mission_Pirates"];
        //_startTime = floor(time);
        //_result = 0;
    } else {
    	sleep 1;  
    };

    // _currTime2 = floor(time);
	// if(_currTime2 - _startTime2 >= 3300) then {_result2 = 1;};
    // if(_result2 == 1) then
    // {
    	// waterMissionRunning2 = false;
    // };
    
	if(!waterMissionRunning2) then
    {
        sleep 30;
        execVM format ["server\missions\waterMissions\mission_Pirates2.sqf","mission_Pirates2"];
		waterMissionRunning2 = true;
        diag_log format["WASTELAND SERVER - Execute New Water Mission - %1","mission_Pirates2"];
        //_startTime2 = floor(time);
       // _result2 = 0;
    } else {
    	sleep 1;  
    }; 

	
    // _currTime3 = floor(time);
	// if(_currTime3 - _startTime3 >= 3300) then {_result3 = 1;};
    // if(_result3 == 1) then
    // {
    	// waterMissionRunning3 = false; 		
    // };	
	if(!waterMissionRunning3) then
    {
        sleep 45;
        execVM format ["server\missions\waterMissions\mission_Pirates3.sqf","mission_Pirates3"];
		waterMissionRunning3 = true;
        diag_log format["WASTELAND SERVER - Execute New Water Mission - %1","mission_Pirates3"];
        //_startTime3 = floor(time);
        //_result3 = 0;
    } else {
    	sleep 1;  
    }; 	
};