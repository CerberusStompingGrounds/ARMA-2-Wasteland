if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started SEALZ Mission State"];

sealzMissionRunning = false;
//_startTime = floor(time);
//_result = 0;

while {true} do
{
    // _currTime = floor(time);
	// if(_currTime - _startTime >= 3300) then {_result = 1;};
    // if(_result == 1) then
    // {
    	// sealzMissionRunning = false;    
    // };
    
	if(!sealzMissionRunning) then
    {
        sleep 15;
		//_mission = ["mission_TWS_Sniper","mission_DrugLord","mission_IllegalArmsDealer","mission_Terrorists"] call BIS_fnc_selectRandom;
		_mission = ["mission_TWS_Sniper"] call BIS_fnc_selectRandom;			
        execVM format ["server\missions\sealzMissions\%1.sqf",_mission];
		sealzMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New SEALZ Mission - %1",_mission];
        //_startTime = floor(time);
        //_result = 0;
    } else {
    	sleep 1;  
    };    
};