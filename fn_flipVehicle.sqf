_veh = [_this, 0, vehicle player, [objNull]] call BL_fnc_param;
private["_lastFlipTime", "_timeRemaining", "_canFlip"];

//find out how to make this a global parameter
_lastFlipTime = _veh getVariable "lastFlipTime";
//find out how to make this a global parameter
_canFlip = true;

if ( _veh == player ) then {
	{
		if !( _x isKindOf "Man" ) exitwith {
			_veh = _x;
		};
	} count (nearestObjects [getPosATL player, ["AllVehicles"], 10]);
};
if (!isNil { _lastFlipTime } ) then {
	_timeRemaining == 30 - floor(time - _lastFlipTime);
	if(_timeRemaining < 0) then {
		_timeRemaining = 0;
	};
	if(_timeRemaining > 0 ) then {
		player systemChat format["Please wait %1 before attempting to flip this vehicle"];
		_canFlip = false;
	};
};
if ( _veh != player && !isNull _veh && _canFlip) then {
	if ( (_veh call BIS_fnc_absSpeed) < 3 ) then {
		if ( local _veh ) then {
			[_veh, true] call BL_fnc_enableSimulation;
			_veh allowDamage false;
			_veh setVectorUp [0,0,1];
			_veh setVelocity [0,0,3];
			
			_veh spawn {
				_time = diag_tickTime;
				waitUntil { ([velocity _this, [0,0,0]] call BL_fnc_isEqualTo) || diag_tickTime - _time > 5 };
				_this allowDamage true;
			};
		}
		else {
			[[_veh], "BL_fnc_flipVehicle", _veh] call BL_fnc_MP;
		};
		closeDialog 0;
	}
	else {
		hint "You can't flip a moving vehicle";
	};
};