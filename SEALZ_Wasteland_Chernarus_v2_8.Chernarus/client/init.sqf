//@file Version: 1.0
//@file Name: init.sqf
//@file Author: [404] Deadbeat
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if(!X_Client) exitWith {};

mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
currentMissionsMarkers = [];
currentRadarMarkers = [];
//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {player == player};
waitUntil{time > 2};

//Call client compile list.
player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";
waitUntil{playerCompiledScripts};

//Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

//Player setup
player call playerSetup;
waitUntil {playerSetupComplete};

//Setup player events.
if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];
//Setup player menu scroll action.
[] execVM "client\clientEvents\onMouseWheel.sqf";

//Setup Key Handler
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

"currentDate" addPublicVariableEventHandler {[] call timeSync};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

//client Executes
[] execVM "client\functions\initSurvival.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
[] execVM "client\functions\createTownMarkers.sqf";
[] execVM "client\functions\createGunStoreMarkers.sqf";
[] execVM "client\functions\createGeneralStoreMarkers.sqf";
[] execVM "client\functions\createHeliStoreMarkers.sqf";
[] execVM "client\functions\createBaseStoreMarkers.sqf";
[] execVM "client\functions\createVehicleStoreMarkers.sqf";
[] execVM "client\functions\createPlaneStoreMarkers.sqf";
[] execVM "client\functions\createBountyStoreMarkers.sqf";
//[] execVM "client\functions\loadAtmosphere.sqf";  createBaseStoreMarkers
[] execVM "client\functions\playerTags.sqf";
[] execVM "client\functions\groupTags.sqf";
[] call updateMissionsMarkers;
[] call updateRadarMarkers;

if (isNil "FZF_IC_INIT") then   {
	call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};
sleep 1;
true spawn playerSpawn;
[] spawn FZF_IC_INIT;
[] execVM "client\functions\createCarrierMarkers.sqf"; //enable markers for carriers