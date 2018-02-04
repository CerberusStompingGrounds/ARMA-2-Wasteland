if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Heavy Mission State"];

//Main Mission Array
_MMarray = ["mission_HeavyTank",
			"mission_AAA",
			"mission_Artillery"
			];          

mainMissionRunning = false;
//_startTime = floor(time);
//_result = 0;

while {true} do
{
    // _currTime = floor(time);
	// if(_currTime - _startTime >= 3300) then {_result = 1;};
    
    // if(_result == 1) then
    // {
    	// mainMissionRunning = false;    
    // };
    
	if(!mainMissionRunning) then
    {
        sleep 15;
        _mission = _MMarray select (random (count _MMarray - 1));
        execVM format ["server\missions\mainMissions\%1.sqf",_mission];
		mainMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Heavy Mission - %1",_mission];
        //_startTime = floor(time);
        //_result = 0;
    } else {
    	sleep 1;  
    };    
};