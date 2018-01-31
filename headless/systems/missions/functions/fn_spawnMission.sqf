private ["_config","_missions","_mission"];
_config = call BL_fnc_missionsConfig;
_missions = [_config, 'missions'] call BL_fnc_hashGet;

_mission = [_missions, 1] call BL_fnc_selectRandom;
_mission = call compile preprocessFileLineNumbers format['\x\bl_headless\addons\systems\missions\missions\%1.sqf', _mission select 0];

private ['_missionInit'];
_missionInit = [_mission, 0, {}, [{}]] call BL_fnc_param;

[{
	private ['_missionInit', '_missionName', '_missionDesc', '_missionLoc', '_missionRun', '_initResult', '_missionCode'];
	_initResult = _this select 0;
	
	_missionName = [_this select 1, 1, '', [{}, '']] call BL_fnc_param;
	_missionDesc = [_this select 1, 2, '', [{}, '']] call BL_fnc_param;
	_missionLoc  = [_this select 1, 3, [], [[], {}, objNull]] call BL_fnc_param;
	_missionRun  = [_this select 1, 4, {}, [{}]] call BL_fnc_param;
	
	if ( typeName _missionLoc == "CODE" ) then {
		_missionLoc = [_initResult] call _missionLoc;
	};

	if ( typeName _missionName == "CODE" ) then {
		_missionName = [_initResult, _missionLoc] call _missionName;
	};

	if ( typeName _missionDesc == "CODE" ) then {
		_missionDesc = [_initResult, _missionLoc] call _missionDesc;
	};

	// Creates task/waypoint/notice on all clients
	missionCount = missionCount + 1;
	_missionCode = format['mission%1', missionCount];

	[true, _missionCode, [
		_missionDesc,
		_missionName,
		_missionName
	], _missionLoc, 'CREATED', 0] call BL_fnc_taskCreate;

	// Spawn mission's init
	[runningMissions, _missionCode, [_initResult, _missionCode, _missionLoc] spawn _missionRun] call BL_fnc_hashSet;

	if ( count _missionLoc == 2 && typeName (_missionLoc select 0) == "OBJECT" ) then {
		_missionLoc = _missionLoc select 0
	};

	[runningMissionLocations, _missionCode, _missionLoc] call BL_fnc_hashSet;
}, _mission] spawn _missionInit;