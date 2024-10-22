//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

waitUntil{objectSpawnComplete};

private ["_counter","_pos","_markerName","_marker","_hint","_safePos","_countActual","_boxes", "_nerfBoxes", "_currBox"];

_counter = 0;
_countActual = 0;
_nerfBoxes = ["basicUS1","basicUS2","specialUS1","basicRU1","basicRU2","specialRU1","specialX1","launcherUS","launcherRU","basicGUE","basicBAF","basicUN","basicPMC","basicGER","basicTK"];

diag_log format["Weapon Caches Spawning"];

while {_counter < 600} do
{
    _pos = getMarkerPos format ["Spawn_%1", _counter];
    _currBox = _nerfBoxes select (random (count _nerfBoxes - 1));
    _safePos = [_pos, 25, 50, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    [_currBox, _safePos] execVM "server\spawning\boxCreation.sqf";
    
        
    // _markerName = format["marker%1",_counter];
	// _marker = createMarker [_markerName, _safePos];
	// _marker setMarkerType "dot";
	// _marker setMarkerSize [1.25, 1.25];
	// _marker setMarkerColor "ColorBlack";
    
    
    
    _counter = _counter + 4;
    _countActual = _countActual + 1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_countActual];
ammoCrateSpawnComplete = true;