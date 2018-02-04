#include "basebuild.h"


_wallLength = 50;
_wallType = "";
_wallPieceSize = 2.5;

_opos = _this select 0;
_wallLength = _this select 1;
_wallType = _this select 2;
//_wallPieceSize = _this select 3;

_wallPiece = _wallType call getSpesObjectDef;
if(count _wallPiece == 0) exitWith { hint format ["invalid wall piece name %1", _wallPiece]; };


_wallPieceSize = (_wallPiece select BO_DIMENSION) select 0;

_area = _wallPieceSize * _wallLength;
_areaD2 = _area / 2;

// needed by building placement
_placeArea = _area - _spaceFromWalls;
_placeAreaD2 = _placeArea  / 2;

_pox = (_opos select 0) - _placeAreaD2;
_poy = (_opos select 1) - _placeAreaD2;
////


//diag_log format["wall length: %1",_wallPieceSize];


_special = _this select 3;



//_dirs = [[0,-1],[1,0],[0,1],[-1,0]];
_dirs = [[-1,0],[0,-1],[1,0],[0,1]];



_start = _wallPieceSize * (_wallLength / 2) - (_wallPieceSize / 2);




_curdir = 0;


{
//_x = _dirs select 0;

_skipNextTiles = 0;

for [{_i=0},{_i < _wallLength },{_i=_i+1}] do
{


if(_skipNextTiles <= 0) then
{

_piece = [];
for [{_si=0},{_si < (count _special) },{_si=_si+1}] do
{
scopename "spesLoop";

_spes = _special select _si;

if((floor(_spes select 1)) == _i) then
{
_piece = (_spes select 0) call getSpesObjectDef;

breakOut "spesLoop";
};

};

_xm = (_x select 0);
_ym = (_x select 1);

_objname = "";//_wallType;
_rotation = 0;
_off = [0,0];
_iscomb = false;
_reqTileSpace = 0;



if(count _piece == 0) then
{
_piece = _wallPiece;
};

//if(count _piece > 0) then
//{
/*
_objnames = _piece select BO_DEFNAME;
_oi = (random ((count _objnames ) - 1 ));
_objname = _objnames select _oi;
*/
_rotation = _piece select BO_ROTATION;
_offset = _piece select BO_OFFSET;
_iscomb = _piece select BO_ISCOMB;


_reqTileSpace = ((_piece  select  BO_TILESIZE)  / _wallPieceSize);
_skipNextTiles = 0;
if(_reqTileSpace > 1.0) then
{
_skipNextTiles = floor _reqTileSpace;
};


_ox = (_offset select 0);
_oy = (_offset select 1);
_d = _curdir;

_off = [((cos _d)*_ox + (sin _d)*_oy),  ((cos _d)*_oy - (sin _d)*_ox)  ];

//};



_pos = [_xm * _i * _wallPieceSize  - (_ym * _areaD2) - (_xm * _start)  +  (_opos select 0) + (_off select 0), _ym * _i * _wallPieceSize - (_xm * _areaD2) - (_ym * _start) +  (_opos select 1)  + (_off select 1)];





_angle = _ym atan2 _xm ;
_pdir = (_angle-_rotation);
/*
if(_iscomb) then
{
[_pos,_pdir,_objname] execvm "objectmapper.sqf";

}
else
{
_veh = createVehicle [_objname, _pos ,[], 0, "NONE"];
_pos set[2,0];
_veh setPosATL  _pos;

_veh setdir (_angle-_rotation);//([[0,0],_x] call GetAngle);
};



*/


//if(count _piece > 0) then
//{
[_piece,_pos,_angle] call createBaseObj;

// call the script
if(count _piece >= BO_SCRIPT) then
{
_script = _piece select BO_SCRIPT;
[_piece,_pos,_curdir, _i / _wallLength, _wallPieceSize / _area, 5 / _area] call _script;
};
/*
}
else
{
_veh = createVehicle [_objname, _pos ,[], 0, "NONE"];
_pos set[2,0];
_veh setPosATL  _pos;
_veh setdir (_angle-_rotation);
};
*/

}
else
{
_skipNextTiles = _skipNextTiles - 1;
};

};

_curdir = _curdir + 90; 
} foreach _dirs;