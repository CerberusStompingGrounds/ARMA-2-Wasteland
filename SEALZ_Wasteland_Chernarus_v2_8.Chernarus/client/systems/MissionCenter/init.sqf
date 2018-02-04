#include "mdialog\mission_sys.sqf"; 

if(dialog) exitwith{closeDialog 0};

disableSerialization;

private["_Dialog","_lightMissiontext","_heavyMissiontext","_Heli1Missiontext","_Heli2Missiontext","_Heli3Missiontext","_Air1Missiontext","_Air2Missiontext","_Air3Missiontext","_missionType","_lightPicture","_vehicleName","_missionName","_Type","_LightAICount","_lightMissionInformation", "_lightMissionAICount","_lightMissionInformationArrayLength","_heavyAICount","_heavyMissionInformation", "_heavyMissionAICount","_heavyMissionInformationArrayLength","_heavyPicture","_lightDist"];

_missionDialog = createDialog "missionSettings";

_Dialog = findDisplay missionsys_DIALOG;
_lightMissiontext = _Dialog displayCtrl lightMission_text;
_lightMissionicon = _Dialog displayCtrl lightMission_icon;
 _heavyMissiontext = _Dialog displayCtrl heavyMission_text;
 _heavyMissionicon = _Dialog displayCtrl heavyMission_icon;
 _Heli1Missiontext = _Dialog displayCtrl Heli1Mission_text;
 _Heli1Missionicon = _Dialog displayCtrl Heli1Mission_icon;
 _AirMissiontext = _Dialog displayCtrl AirMission_text;
 _AirMissionicon= _Dialog displayCtrl AirMission_icon;
// _Air3Missiontext = _Dialog displayCtrl Air3Mission_text;

//_lightMissionInformation = getVariable "lightMissionInformation";
//_lightMissionAICount = getVariable "lightMissionAICount";

_lightMissiontext ctrlSettext format ["There are no current Light Missions available."];
if (!isNil "lightMissionInformation") then 
{ 
 if (typeName lightMissionInformation == "ARRAY") then 
	{
		if !(isNil {lightMissionInformation select 0}) then 
		{
			_lightMissionInformation = (lightMissionInformation select 0);
			_lightMissionInformationArrayLength = count _lightMissionInformation;		
			if (_lightMissionInformationArrayLength > 0) then
				{
					//(Replenbird distance (markerPos "REPLENLZ") < 200) : goto "LAND";
					//_lightDist=fritz distance hans;
					_missionName = (_lightMissionInformation select 1);
					_lightPicture = (_lightMissionInformation select 2);
					_vehicleName = (_lightMissionInformation select 3);
					_lightMissionAICount = (lightMissionAICount select 0);				
					_LightAICount = (_lightMissionAICount select 1);	
					_lightMissionicon ctrlSettext format ["%1", _lightPicture];	
					_lightMissiontext ctrlSettext format ["The %1 has %2 of 4 AI remaining.", _missionName, _LightAICount];				
				};
		};
	};
};

_heavyMissiontext ctrlSettext format ["There are no current Heavy Missions available."];
if (!isNil "heavyMissionInformation") then 
{ 
 if (typeName heavyMissionInformation == "ARRAY") then 
	{
		if !(isNil {heavyMissionInformation select 0}) then 
		{
			_heavyMissionInformation = (heavyMissionInformation select 0);
			_heavyMissionInformationArrayLength = count _heavyMissionInformation;		
			if (_heavyMissionInformationArrayLength > 0) then
				{
					_missionName = (_heavyMissionInformation select 1);
					_heavyPicture = (_heavyMissionInformation select 2);
					_vehicleName = (_heavyMissionInformation select 3);
					_heavyMissionAICount = (heavyMissionAICount select 0);				
					_heavyAICount = (_heavyMissionAICount select 1);	
					_heavyMissionicon ctrlSettext format ["%1", _heavyPicture];	
					_heavyMissiontext ctrlSettext format ["The %1 has %2 of 6 AI remaining.", _missionName, _heavyAICount];				
				};
		};				
	};
};

_heli1Missiontext ctrlSettext format ["There are no current Heli Missions available."];
if (!isNil "heli1MissionInformation") then 
{ 
 if (typeName heli1MissionInformation == "ARRAY") then 
	{
		if !(isNil {heli1MissionInformation select 0}) then 
			{		
				_heli1MissionInformation = (heli1MissionInformation select 0);
				_heli1MissionInformationArrayLength = count _heli1MissionInformation;		
				if (_heli1MissionInformationArrayLength > 0) then
					{
						_missionName = (_heli1MissionInformation select 1);
						_heli1Picture = (_heli1MissionInformation select 2);
						_vehicleName = (_heli1MissionInformation select 3);
						_heli1MissionAICount = (heli1MissionAICount select 0);				
						_heli1AICount = (_heli1MissionAICount select 1);	
						_heli1Missionicon ctrlSettext format ["%1", _heli1Picture];	
						_heli1Missiontext ctrlSettext format ["The %1 has %2 of 10 AI remaining.", _missionName, _heli1AICount];				
					};
			};
	};
};

_airMissiontext ctrlSettext format ["There are no current Air Missions available."];
if (!isNil "aircraftMissionInformation") then 
{ 
//_airMissiontext ctrlSettext format ["2. There are no active Heavy Missions."];
 if (typeName aircraftMissionInformation == "ARRAY") then 
	{
		if !(isNil {aircraftMissionInformation select 0}) then 
			{		
				//_airMissiontext ctrlSettext format ["3. There are no active Heavy Missions."];
				_aircraftMissionInformation = (aircraftMissionInformation select 0);
				_airMissionInformationArrayLength = count _aircraftMissionInformation;
				if (_airMissionInformationArrayLength > 0) then
					{
						_missionName = (_aircraftMissionInformation select 1);
						_airPicture = (_aircraftMissionInformation select 2);
						_vehicleName = (_aircraftMissionInformation select 3);
						_aircraftMissionAICount = (aircraftMissionAICount select 0);				
						_airAICount = (_aircraftMissionAICount select 1);	
						_airMissionicon ctrlSettext format ["%1", _airPicture];	
						_airMissiontext ctrlSettext format ["The %1 has %2 of 20 AI remaining.", _missionName, _airAICount];				
					};
			};
	};
};

// _mainTextColour = "#52bf90";
// _successTextColour = "#17FF41";
// _failTextColour = "#FF1717";
// _greenColour = "#008000";
// _subTextColour = "#FFFFFF";

//<t color='#17FF41'>Light Mission</t>



// _lightMissiontext ctrlSettext format ["<t align='center'><img size='3' image='%1'/></t><t align='center' color='%5'>The %3 has %4 of 4 AI remaining.</t>", _picture, _vehicleName, _missionName, _LightAICount,_mainTextColour];
/* _heavyMissiontext ctrlSetText format["Heavy Mission: There are %1 of 6 enemies remaining.", "2"];
_Heli1Missiontext ctrlSetText format["Heli 1 Mission: There are %1 of 10 enemies remaining.", "5"];
_Heli2Missiontext ctrlSettext format["Heli 2 Mission: There are %1 of 10 enemies remaining.", "10"];
_Heli3Missiontext ctrlSetText format["Heli 3 Mission: There are %1 of 10 enemies remaining.", "6"];
_Air1Missiontext ctrlSetText format["Air 1 Mission: There are %1 of 20 enemies remaining.", "14"];
_Air2Missiontext ctrlSettext format["Air 2 Mission: There are %1 of 20 enemies remaining.", "8"];
_Air3Missiontext ctrlSetText format["Air 3 Mission: There are %1 of 20 enemies remaining.", "12"]; */



