if (!X_Client) exitWith {};
_veh = vehicle player;
_veh setPos [(getMarkerPos "kick") select 0, (getMarkerPos "kick") select 1, 0];

sleep 5;
_veh setdamage 1;
endMission "LOSER"; 
