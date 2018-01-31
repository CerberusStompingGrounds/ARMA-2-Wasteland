private ['_obj', '_altitude', '_autoOpen', '_objPos'];
_obj = [_this, 0, objNull, [objNull]] call BL_fnc_param;
_altitude = [_this, 1, 500, [0]] call BL_fnc_param;
_autoOpen = [_this, 2, 150, [0]] call BL_fnc_param;

_objPos = getPosATL _obj;
_objPos set [2, _altitude];

_obj setPosATL _objPos;

[_obj, _autoOpen] spawn {
	private ['_obj', '_autoOpen', '_parachute'];
	_obj = _this select 0;
	_autoOpen = _this select 1;
	_parachute = createVehicle ["ParachuteBigEast_EP1", [0,0,0], [], 0, "FLY"];
	_obj allowDamage false;

	waitUntil { (getPosATL _obj) select 2 <= _autoOpen };
	
	_parachute setPosATL getPosATL _obj;
	_parachute setDir getDir _obj;
	_parachute setVelocity velocity _obj;
	_obj attachTo [_parachute, [0,2,0]];

	_particleLifeTime = 15;
	_particleSpeed = 0.2;
	_particleLifting = 1.1;
	_windEffect = 10;
	_particleSize = 0.1;

	_colorRed = 0.4341;
	_colorGreen = 0.1388;
	_colorBlue = 0.4144;
	_colorAlpha = 1;

	_expansion = 0.5;

	[[_obj, [0,0,0]], "MissileEffects1", 0.2, [
		["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,1],
		"",
		"Billboard",
		1,
		_particleLifeTime,
		[0,0,0],
		[0,0,2*_particleSpeed],
		0,
		0.05,
		0.04*_particleLifting,
		0.05*_windEffect,
		[0.5,20], // Particle size
		[
			[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.7*_colorAlpha],
			[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.6*_colorAlpha],
			[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.45*_colorAlpha],
			[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.28*_colorAlpha],
			[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.16*_colorAlpha],
			[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.09*_colorAlpha],
			[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.06*_colorAlpha],
			[1*_colorRed,1*_colorGreen,1*_colorBlue,0.02*_colorAlpha],
			[1*_colorRed,1*_colorGreen,1*_colorBlue,0*_colorAlpha]
		],
		[1,0.55,0.35],
		0.1,
		0.08*_expansion,
		"",
		"",
		""
	], 60] call BL_fnc_particleSourceCreateServer;
	
	sleep 5;
	waitUntil { (getPosATL _obj) select 2 < 2 };
	
	detach _obj;
	deleteVehicle _parachute;
	
	waitUntil { [(velocity _obj),[0,0,0]] call BL_fnc_isEqualTo };
	
	_obj allowDamage true;
};