

{
    lightMissionInformation set [_forEachIndex, "REMOVETHISCRAP"];
	lightMissionInformation = lightMissionInformation - ["REMOVETHISCRAP"];
    publicVariable "LightMission";    

}forEach lightMissionInformation;
lightMissionInformation = [];
{
	 _missionType = (_x select 0);
	 _missionName = (_x select 1);	 
	 _picture = (_x select 2);
	 _vehicleName = (_x select 3);
	lightMissionInformation = lightMissionInformation + [_x select 0];
} forEach lightMissionInformation;


{
    lightMissionAICount set [_forEachIndex, "REMOVETHISCRAP"];
	lightMissionAICount = lightMissionAICount - ["REMOVETHISCRAP"];
    publicVariable "lightMissionAICount";    

}forEach lightMissionAICount;
lightMissionAICount = [];
{
	 _missionType = (_x select 0);
	 _unitsAlive = (_x select 1);

	lightMissionAICount = lightMissionAICount + [_x select 0];
} forEach lightMissionAICount;