private ['_config'];
_config = [] call BL_fnc_hashCreate;

// Amount of missions to run at the same time
[_config, 'count', 3] call BL_fnc_hashSet;

// How long to wait after a mission is finished before
// starting another.
[_config, 'delay', 60] call BL_fnc_hashSet;

// How long to wait before the first mission
// after a restart.
[_config, 'roundStartDelay', 60] call BL_fnc_hashSet;

// How long to wait before removing task
[_config, 'taskCleanupDelay', 30] call BL_fnc_hashSet;

// Missions available for selection
[_config, 'missions', [
	// server\systems\missions\{missionName}.sqf, probability of selecting mission
	['missionExampleOne', 0.5] //,
	// ['missionExampleTwo', 0.5],
	// ['missionExampleThree', 0.2]
]] call BL_fnc_hashSet;

_config