private ['_group', '_loc', '_units', '_spread', '_maxDist', '_aware', '_bounty', '_nice', '_cbParams', '_cb'];
_group    = [_this, 0, false, [grpNull, false]] call BL_fnc_param;
_loc      = [_this, 1, [0,0,0], [[]], [2, 3]] call BL_fnc_param;
_units    = [_this, 2, [], [[]]] call BL_fnc_param;
_spread   = [_this, 3, 100, [0]] call BL_fnc_param;
_maxDist  = [_this, 4, 300, [0]] call BL_fnc_param;
_aware    = [_this, 5, true, [true, []]] call BL_fnc_param;
_bounty   = [_this, 6, BL_aiBountyAmount, [0]] call BL_fnc_param;
_nice     = [_this, 7, true, [true]] call BL_fnc_param;
_cbParams = [_this, count _this-2, [], [[]]] call BL_fnc_param;
_cb       = [_this, count _this-1, {}, [{}]] call BL_fnc_param;

if ( typeName _group == "BOOL" ) then {
	_group = createGroup civilian;
};

if ( count _loc == 2 ) then {
	_loc set [2, 0];
};

if ( typeName _aware == "BOOL" ) then {
	if ( _aware ) then {
		// Loop time, accuracy, radius
		_aware = [5, 1, 1000];
	}
	else {
		_aware = [];
	};
};

private ['_spawnedUnits', '_spawnPos', '_spacing', '_spawnPositions'];
_spawnedUnits = [];
_spacing = _spread/(count _units);
_spawnPositions = [];

// Spawn all units into group
{
	_spawnPos = [];
	
	while { count _spawnPos == 0 } do {
		_pos = [_loc, random _spread, random 359] call BIS_fnc_relPos;
		
		if ( ({_x distance _pos < _spacing} count _spawnPositions) == 0 ) then {
			_intersects = lineIntersectsWith [ATLtoASL _pos, ATLtoASL [
				_pos select 0,
				_pos select 1,
				(_pos select 2)+10
			], objNull, objNull, false];
			
			if ( count _intersects == 0 ) then {
				_spawnPos = _pos;
			};
		};
	};
	
	if (_nice) then {
		// If nice use spawn. Will add a slight delay and will only run when there is time.
		[_spawnedUnits, _group, _x, _spawnPos] spawn {
			(_this select 0) set [count (_this select 0), (_this select 1) createUnit [
				_this select 2,
				_this select 3,
				[],
				0,
				"NONE"
			]];
		};
	}
	else {
		_spawnedUnits set [count _spawnedUnits, _group createUnit [_x, _spawnPos, [], 0, "NONE"]];
	};
	
	_spawnPositions set [count _spawnPositions, _spawnPos];
	
	nil
} count _units;

if ( count _aware > 0 ) then {
	// Loop to make AI aware of near players.
	([_loc, _group] + _aware) spawn {
		_loc      = _this select 0;
		_group    = _this select 1;
		_timer    = _this select 2;
		_accuracy = _this select 3;
		_radius   = _this select 4;
		
		waitUntil { (count units _group) > 0 };
		while { {alive _x} count units _group > 0 } do {
			sleep _timer;
		
			{
				_group reveal [_x, _accuracy];
			} count ([_loc, _radius] call BL_fnc_nearUnits);
		};
	};
};

// Keep AI from running away
if ( _maxDist > 0 ) then {
	[_maxDist, _loc, _group] spawn {
		_maxDist = _this select 0;
		_loc     = _this select 1;
		_group   = _this select 2;
		
		waitUntil { (count units _group) > 0 };
		while { {alive _x} count (units _group) > 0 } do {
			sleep 10;
			
			{
				if ( _x distance _loc > _maxDist ) then {
					// Kill the cowards!
					_x setDamage 1;
				};
				nil
			} count (units _group);
		};
	};
};

// If using _nice we need to call cb when all units are spawned.
if ( _nice ) then {
	[_spawnedUnits, count _units, _group, _bounty, _cbParams, _cb] spawn {
		waitUntil { count (_this select 0) == (_this select 1) };
		
		[_this select 0] call BL_fnc_statTrackAIUnits;
		{ _x setVariable ['bounty', _this select 3]; } count (_this select 0);
		
		[_this select 4, [_this select 2]] call (_this select 5);
	};
}
else {
	[_spawnedUnits] call BL_fnc_statTrackAIUnits;
	{ _x setVariable ['bounty', _bounty]; } count _spawnedUnits;
};

// Return group. If using nice it won't have all units yet.
_group