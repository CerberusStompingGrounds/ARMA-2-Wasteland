//scriptName "DynO\data\scripts\objectMapper.sqf";

/////////////////////////////////////////////////////
////////////////// MODIFIED VERSION /////////////////
/////////////////////////////////////////////////////


/*
	File: objectMapper.sqf
	Author: Joris-Jan van 't Land

	Description:
	Takes an array of data about a dynamic object template and creates the objects.

	Parameter(s):
	_this select 0: position of the template - Array [X, Y, Z]
	_this select 1: azimuth of the template in degrees - Number 
	_this select 2: objects for the template - Array / composition class - String / tag list - Array
	_this select 3: (optional) randomizer value (how much chance each object has of being created. 0.0 is 100% chance) - Number

	Returns:
	Created objects (Array)
*/

//Validate parameter count
if ((count _this) < 3) exitWith {hint "Log: [objectMapper] Function requires at least 3 parameters!"; []};

private ["_pos", "_azi", "_objs", "_rdm"];
_objs = _this select 0;
_azi = _this select 1;
_pos = _this select 2;

//Optionally pass a randomizer value.
if ((count _this) > 3) then 
{
	_rdm = _this select 3;
} 
else 
{
	_rdm = 0;
};

//Validate parameters
if ((typeName _pos) != (typeName [])) exitWith {hint "Log: [objectMapper] Template position (0) must be an Array!"; []};
if ((typeName _azi) != (typeName 0)) exitWith {hint "Log: [objectMapper] Template azimuth (1) must be a Number!"; []};
if (!((typeName _objs) in [(typeName ""), (typeName [])])) exitWith {hint "Log: [objectMapper] Template objects (2) must be a String or Array!"; []};
if ((typeName _rdm) != (typeName 0)) exitWith {hint "Log: [objectMapper] Randomizer value (3) must be a Number!"; []};
if ((_rdm < 0.0) || (_rdm > 1.0)) exitWith {hint "Log: [objectMapper] Randomizer value (3) must be a Number between 0.0 and 1.0!"; []};

private ["_newObjs"];

//See if an object array, specific composition class or tag array was given.
private ["_cfgObjectComps", "_script"];
_cfgObjectComps = configFile >> "CfgObjectCompositions";
_test = "";

if ((typeName _objs) == (typeName "")) then 
{
	//Composition class was given.
	_arr = getArray(_cfgObjectComps >> _objs);
	_script = "compositions\" + _objs + ".sqf" ; //getText(_cfgObjectComps >> _objs >> "objectScript");
	_objs = [];
	_test = "err " + str(_arr);
} 
else 
{
	private ["_testSample"];
	_testSample = _objs select 0;
	if ((typeName _testSample) != (typeName [])) then 
	{
		//Tag list was given.
		private ["_queryTags"];
		_queryTags = +_objs;
		_objs = [];
		
		//Make a list of candidates which match all given tags.
		private ["_candidates"];
		_candidates = [];
		
		for "_i" from 0 to ((count _cfgObjectComps) - 1) do 
		{
			private ["_candidate", "_candidateTags"];
			_candidate = _cfgObjectComps select _i;
			_candidateTags = getArray(_candidate >> "tags");
			
			//_test =  _test + str(_candidate) + " " + str(_candidateTags);
			
			//Are all tags in this candidate?
			if (({_x in _candidateTags} count _queryTags) == (count _queryTags)) then 
			{
				_candidates = _candidates + [getText(_candidate >> "objectScript")];
			};
		};
	//	copytoclipboard _test;
		//Select a random candidate.
		_script = _candidates select (floor (random (count _candidates)));
	};
};

//If the object array is in a script, call it.
if (!isNil "_script") then 
{
	_objs = call (compile (preprocessFileLineNumbers _script));
};

//Make sure there are definitions in the final object array.
if ((count _objs) == 0) exitWith {hint format["Log: [objectMapper] No elements in the object composition array! '%1' %2 %3"
,_script,_cfgObjectComps, _test]; []};

_newObjs = [];

private ["_posX", "_posY"];
_posX = _pos select 0;
_posY = _pos select 1;

//Function to multiply a [2, 2] matrix by a [2, 1] matrix.
private ["_multiplyMatrixFunc"];
_multiplyMatrixFunc =
{
	private ["_array1", "_array2", "_result"];
	_array1 = _this select 0;
	_array2 = _this select 1;

	_result =
	[
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];

	_result
};

for "_i" from 0 to ((count _objs) - 1) do
{
	//Check randomizer for each object.
	if ((random 1) > _rdm) then 
	{
		private ["_obj", "_type", "_relPos", "_azimuth", "_fuel", "_damage", "_newObj"];
		_obj = _objs select _i;
		_type = _obj select 0;
		_relPos = _obj select 1;
		_azimuth = _obj select 2;
		
		//Optionally map fuel and damage for backwards compatibility.
		if ((count _obj) > 3) then {_fuel = _obj select 3};
		if ((count _obj) > 4) then {_damage = _obj select 4};
	
		//Rotate the relative position using a rotation matrix.
		private ["_rotMatrix", "_newRelPos", "_newPos"];
		_rotMatrix =
		[
			[cos _azi, sin _azi],
			[-(sin _azi), cos _azi]
		];
		_newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
	
		//Backwards compatability causes for height to be optional.
		private ["_z"];
		if ((count _relPos) > 2) then {_z = _relPos select 2} else {_z = 0};
	
		_newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
	
		//Create the object and make sure it's in the correct location.
		_newObj = _type createVehicle _newPos;
		_newObj setDir (_azi + _azimuth);
		_newObj setPosATL _newPos;
		
		//If fuel and damage were grabbed, map them.
		if (!isNil "_fuel") then {_newObj setFuel _fuel};
		if (!isNil "_damage") then {_newObj setDamage _damage};
	
		_newObjs = _newObjs + [_newObj];
	};
};

_newObjs