private ["_angle","_p1","_x1","_y1","_p2","_x2","_y2"];

_p1 =  _this select 0;
_x1 = _p1 select 0;
_y1 = _p1 select 1;

_p2 =  _this select 1;
_x2 = _p2 select 0;
_y2 = _p2 select 1;


_angle = ( _x2 - _x1) atan2 (_y2 - _y1);

_angle