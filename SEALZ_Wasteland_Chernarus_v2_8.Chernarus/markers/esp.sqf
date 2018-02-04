xdistance = 1200;

if (isNil "xtags") then
{
	xtags = 0;
};

if (xtags == 0) then
{
	xtags = 1;
	hint "ESP ON";
	_a = [];
	while {xtags == 1} do
	{
		_count = count ((position player) nearEntities [["CAManBase"], xdistance]);
		{
			if (((_x in _a) && !(alive _x)) or ((_x in _a) && ((player distance _x) > xdistance))) then {_a = _a - [_x];};
			if ((_x != player) && (getPlayerUID _x != "") && (name _x != "") && !(_x in _a) && ((player distance _x) < xdistance)) then
			{
				_a = _a + [_x];
				[_x] execVM "markers\esp2.sqf";
				sleep 1;
			};
		} forEach playableUnits;
		waitUntil {_count != count ((position player) nearEntities [["CAManBase"], xdistance])};
	};
}

else
{
	xtags = 0;
	hint "ESP OFF";
};