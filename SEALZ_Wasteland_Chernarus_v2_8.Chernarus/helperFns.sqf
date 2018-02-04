#include "basebuild.h"




getSpesObjectDef = 
{

private ["_ret","_name"];
_name = _this;

_ret = [];
{

if((_x select BO_NAME) == _name) exitWith
{
_ret = _x;
};

} foreach baseObjects;

_ret
};


createBaseObj = 
{
private ["_piece","_pos","_angle","_pdir","_objname","_objnames","_iscomb","_rotation"];

_piece = _this select 0;
_pos = _this select 1;
_angle = _this select 2;

_pos set[2,0];


_objnames = _piece select BO_DEFNAME;
_oi = (random ((count _objnames ) - 1 ));
_objname = _objnames select _oi;

_rotation = _piece select BO_ROTATION;
//_offset = _piece select BO_OFFSET;
_iscomb = _piece select BO_ISCOMB;

_pdir  = _angle - _rotation;


if(_objname != "empty") then
{

if(_iscomb) then
{

//diag_log format["creating set %1",_objname];

[_pos,_pdir,_objname] execvm "objectmapper.sqf";

}
else
{

_veh = createVehicle [_objname, _pos ,[], 0, "NONE"];
_veh setPosATL  _pos;

_veh setdir _pdir;//([[0,0],_x] call GetAngle);
};

};
};





rotate = 
{
private ["_ox","_oy","_d","_cx","_cy","_f","_ret"];

_origin = _this select 1;
_xf = 0;
_yf = 0;

if(typename _origin == "ARRAY") then
{
_xf = _origin select 0;
_yf = _origin select 1;
}
else
{
_xf = _origin;
_yf = _origin;
};

_ox = ((_this select 0) select 0) - _xf;
_oy = ((_this select 0) select 1) - _yf;
_d = _this select 2;

_cx = ((cos _d)*_ox + (sin _d)*_oy);
_cy = ((cos _d)*_oy - (sin _d)*_ox);

_ret = [_cx+_xf,_cy+_yf];
_ret
};


swapHigher = 
{
private ["_x1","_x2"];

_x1 = (_this select 0);
_x2 = (_this select 1);

if(_x1 > _x2) then
{
_x1 = (_this select 1);
_x2 = (_this select 0);

};

[_x1,_x2]
};

addRoad = 
{
private ["_p1","_p2","_width","_h","_w","_x1","_y1","_x2","_y2","_road","_dx","_dy","_px","_py"];
_p1 = _this select 0;
_p2 = _this select 1;
_width = _this select 2;

//_width = 5;
_h = 0;
_w = 0;
if(  (abs((_p1 select 0) - (_p2 select 0)))  < 0.01 ) then
{
_h = _width;
}
else
{
_w = _width;
};

_xx = [(_p1 select 0), (_p2 select 0)] call swapHigher;
_yy = [(_p1 select 1), (_p2 select 1)] call swapHigher;

_totalWall = _wallPieceSize * _wallLength; // _placeArea

//diag_log  format["aaaaa: %1  %2 %3 %4 %5",  _x1, _y1, _x2,_totalWall];

_x1 = _totalWall * (_xx select 0);
_y1 = _totalWall * (_yy select 0);

_x2 = _totalWall * (_xx select 1);
_y2 = _totalWall * (_yy select 1);


//diag_log  format["aaaaa: %1  %2 %3 %4",  _x1, _y1, _x2,_y2];

_px = _pox;//+ (_opos select 0) ;
_py = _poy;//+ (_opos select 1) ;

_road = [[_x1-_h+_px,_y1-_w+_py], [_x2+_h+_px, _y2+_w+_py]];

//diag_log format["--!!!!--- %1",_road];


_xdist = (_x2-_x1);
_ydist = (_y2-_y1);

if(_xdist < 0) then
{
diag_log  format["errrr: %1  %2 %3",  _xdist];

};

if(_x1 > _x2 || _y1 > _y2) then
{
diag_log  format["ERROR!!!!!!! "];

};

if(debugBaseRoads) then
{
_dx = 0;
_dy = 0;


while { true } do
{
scopename "dbgroad";

//diag_log  format["errrr: %1  %2 %3 %4   %5 %6   %7-%8",  _dx,_dy,_xdist,_ydist,_w,_h,_p1,_p2];


_pos = [((_road select 0)select 0) + _dx, ((_road select 0)select 1) + _dy, 0.7];//[_x1+_dx+_pox,_y1+_dy+_poy,0.7];
_veh = createVehicle ["Sign_sphere100cm_EP1", _pos ,[], 0, "NONE"];
_veh setPosATL _pos;

_pos = [((_road select 0)select 0) + _dx + _h, ((_road select 0)select 1) + _dy + _w, 0.7];//[_x1+_dx+_pox,_y1+_dy+_poy,0.7];
_veh = createVehicle ["Sign_sphere100cm_EP1", _pos ,[], 0, "NONE"];
_veh setPosATL _pos;

if(_h > 0) then
{
_dy = _dy + 2;
if(_dy > _ydist) then { breakOut  "dbgroad"; };
}
else
{
_dx = _dx + 2;
if(_dx > _xdist) then { breakOut  "dbgroad"; };
};
};

}; // if debug


//diag_log  format["NEW ROAD: %1  %2 %3",  _road,  _xdist, _ydist];

_placed = _placed + [_road];

//diag_log  format["..... %1  %2 %3",  _placed];

};


