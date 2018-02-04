(findDisplay 46) displayRemoveEventHandler ["KeyDown", theKeyControl];
ctrl_onKeyDown =
{
	private ["_key", "_return"];
	_ctrl = _this select 3;
	_shift = _this select 2;
	_key = _this select 1;
	_return = false;
	
	if(_key == 70) then
	{
		execVM format['%1ajmenu.sqf',HMDIR];	
	};
	
	if(footSpeedKeys == "1") then
	{
		_speed = 1;
		_vel = velocity player;
		
		switch (_key) do
		{
			case 17 : // W - forward
			{
				_dir = direction player;
				player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
			};
			case 30 : // A - left
			{
				_dir = (direction player - 90);
				player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
			};
			case 31 : // S - back
			{
				_dir = (direction player - 180);
				player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
			};
			case 32 : // D - right
			{
				_dir = (direction player + 90);
				player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];
			};
			case 42 : // left shift - moves higher
			{
				player setVelocity [(_vel select 0),(_vel select 1),(10)];
			};
			case 29 : // left ctrl - moves lower
			{
				player setVelocity [(_vel select 0),(_vel select 1),(-10)];
			};
			case 57 : // space - emergency brake, freeze in air
			{
				player setVelocity [0, 0, 0];
			};
		};
	}
	else
	{
		switch (_key) do
		{
			case 17 : {};
			case 30 : {};
			case 31 : {};
			case 32 : {};
			case 42 : {};
			case 29 : {};
			case 57 : {};
		};
	};	
	_return
};

waitUntil {!isNull (findDisplay 46)};
theKeyControl = (findDisplay 46) displayAddEventHandler ["keyDown", "_this call ctrl_onKeyDown"];