disableSerialization;
if (isNil "BIS_fnc_3dCredits_n") then {BIS_fnc_3dCredits_n = 2733;};
BIS_fnc_3dCredits_n cutRsc ["rscDynamicText", "PLAIN"];
BIS_fnc_3dCredits_n = BIS_fnc_3dCredits_n + 1;
_ctrl = ((uiNamespace getvariable "BIS_dynamicText") displayctrl 9999);
_ctrl ctrlShow true; _ctrl ctrlEnable true; _ctrl ctrlSetFade 0;
_unit = _this select 0;
while {(alive _unit) && ((player distance _unit) < xdistance)} do
{
	if (xtags == 0) exitWith {_ctrl ctrlShow false; _ctrl ctrlEnable false;};
	_pos = [(getPosATL _unit) select 0, (getPosATL _unit) select 1, ((getPosATL _unit) select 2) + 2];
	_pos2D = worldToScreen _pos;
	if (count _pos2D > 0) then
	{
		_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
		_text = parseText format ["<t size='0.35' color='#FF1AAA'>%1 (%2m)</t>", name _unit, round (player distance _unit)];
		_ctrl ctrlSetStructuredText _text;
		_ctrl ctrlCommit 0;
	};
	sleep 0.05;
};
_ctrl ctrlShow false;
_ctrl ctrlEnable false;