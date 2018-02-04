disableserialization;

_unit = _this select 0;
_minDis = 800;
_fadeDis = 0.01;
if (isnil "BIS_fnc_3dCredits_n") then {BIS_fnc_3dCredits_n = 2733;};

BIS_fnc_3dCredits_n cutrsc ["rscDynamicText","plain"];
BIS_fnc_3dCredits_n = BIS_fnc_3dCredits_n + 1;

_display = uinamespace getvariable "BIS_dynamicText";
_control = _display displayctrl 9999;

#define DISPLAY	_display
#define CONTROL	_control

CONTROL ctrlsetfade 1;
CONTROL ctrlcommit 0;
CONTROL ctrlShow true;
CONTROL ctrlEnable true;
CONTROL ctrlcommit 0;

_w = safezoneW;//0.5;
_h = safezoneH;//0.3;

while {alive _unit && ESP == 1 && !visibleMap} do {
		_pos = getPosATL _unit;
		_pos set [ 2 , (_pos select 2) + 2 ];

		_dis = player distance _pos;
		_alpha = abs ((_dis / _minDis) - _fadeDis);
		
		// credits some wierdo over at bohemia forums
		
		if (_alpha <= 1) then {
			_pos2D = worldtoscreen _pos;
			
			if (count _pos2D > 0) then {
				//--- Set the position of the control
				CONTROL ctrlsetposition [(_pos2D select 0) - _w/2, (_pos2D select 1), _w, _h];
				
				//--- Get the Name of the Unit
				_name = name _unit;
				
				//--- Get the health of the Unit
				_health = format["(%1%2)",100-round ((damage _unit)*100),"%h"];
				_rank = "";
				//--- Put everything together to display
				_textShowRank = "";
							_textShowPInfo = format["<t size='0.28' font='Zeppelin33' color='#0000FF'>(%3m) %1 %2</t>",_name,_health,round (_dis)];
				_textShow = _textShowRank + _textShowPInfo;
				
				CONTROL ctrlsetstructuredtext parsetext _textShow;
				CONTROL ctrlsetfade ((_alpha^3)*3);

				CONTROL ctrlcommit 0.01;
			} else {
				CONTROL ctrlsetfade 1;
				CONTROL ctrlcommit 0.1;
			}
		} else {
			CONTROL ctrlsetfade 1;
			CONTROL ctrlcommit 0.1;
		};
		sleep 0.001;
};
CONTROL ctrlShow false;
CONTROL ctrlEnable false;