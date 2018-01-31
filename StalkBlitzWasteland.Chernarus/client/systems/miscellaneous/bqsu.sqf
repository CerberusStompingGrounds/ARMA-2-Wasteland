zipf=false;(findDisplay 46)displayAddEventHandler['KeyDown',"
	if ( (_this select 1) in (actionKeys 'MoveForward') ) then {
		zipf = true;
	}
	else {
		if ( zipf && (_this select 1) in (actionKeys 'GetOver') && vehicle player == player && alive player ) then {
			if ( animationState player != 'ActsPercMrunSlowWrflDf_FlipFlopPara' ) then {
				_power = 3.5;
				_speed = _power / 2;
				_velocity = velocity player;

				player setvelocity [(_velocity select 0) + _speed * sin getdir player,
					(_velocity select 1) + _speed * cos getdir player,
					(_velocity select 2) + _power];
					
				'ActsPercMrunSlowWrflDf_FlipFlopPara' call iycd;
			};
			true
		};
	};
"];(findDisplay 46)displayAddEventHandler['KeyUp',"
	if ( (_this select 1) in (actionKeys 'MoveForward') ) then {
		zipf = false;
	};
"];