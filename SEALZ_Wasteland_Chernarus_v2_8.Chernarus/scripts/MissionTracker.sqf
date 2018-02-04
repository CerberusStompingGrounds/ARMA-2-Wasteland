_pos = _this select 0;
_aiCnt = _this select 1;
_varname = _this select 2;
_color = _this select 3;
_aiCntTotal = _this select 4;

private ["_text","_pos1"];
createMarkerLocal [_varname, [0,0]];
_varname setMarkerShape "ICON";
_varname setMarkerColor _color;
_varname setMarkerSize [1,1];
_varname setMarkerType "dot";
_varname setMarkerPos [_pos select 0, (_pos select 1) - 50, 0];
_text = format ["There are %1 of %2 AI remaining", _aiCnt,_aiCntTotal];
_varname setMarkerTextLocal(_text);		
sleep 0.1;

if (_aiCnt < 1) then
	{
		deleteMarker _varname;
		diag_log format ["#############################DELETED MARKER %1 #############################", _varname];		
	};
	

	//exitWith {};