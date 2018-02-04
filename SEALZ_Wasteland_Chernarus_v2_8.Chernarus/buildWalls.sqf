#include "basebuild.h"

_handle = execvm "helperFns.sqf";
waitUntil {scriptDone _Handle};

_opos = _this select 0;

// For objects inside the base
_spaceBetweenSets = 2.0;
_spaceBetweenObjs = 0.1;
_spaceFromWalls = 10;


_placed = [];

debugBaseRoads = false;


// perimiter of the base
_wallLength = -1;
_wallPieceSize = -1;
//_area = _wallPieceSize * _wallLength;
//_areaD2 = _area / 2;

_placeArea = 0;
_placeAreaD2 = 0;

_pox = 0;
_poy = 0;


gatePiece =
{
private ["_piece","_pos","_d","_w","_ox","_oy","_spx","_spy","_xd","_yd"];
_piece = _this select 0;
_pos = _this select 1;
_d = _this select 2;
_w = _this select 3;
_widthd2 = (_this select 4) / 2;

//_width = 5;

//if(_d == 90 || _d == 180) then{

_ox = _w + _widthd2;
_oy = abs (sin _d) - ((0.5-(abs(sin _d)))); // 0.5 for outer span

//_spx = ((cos _d)*_ox + (sin _d)*_oy) + 1;
//_spy = ((cos _d)*_oy - (sin _d)*_ox) + 1;

_p = [[_ox,_oy],[0.5 ,0.5 ], _d] call rotate;
_spx = _p select 0;
_spy = _p select 1;

_l = 0.5;
_p = [[_ox, 0.5],[0.5,0.5], _d] call rotate;
_spx2 = _p select 0;
_spy2 = _p select 1;


//_xd = cos _d;
//_yd = sin _d;

// [ (_spx) + 0 -  (_l*(sin _d)), ( _spy) + 0 -  (_l*(cos _d))]

_r =  [[_spx,_spy], _p , _wallPieceSize];

_r call addRoad;

//hint format["GATE %1 %2 %3", _r, _widthd2, _w];
//diag_log format["GATE %1 %2", _r,_w];

//};
};


baseObjects = [
["openX3",["empty"], false, 2 * 2.5, 3,[0,0], 0],

["GateBar",["ZavoraAnim"], false, 2 * 2.5, 3,[-0.07,1.2], 0, gatePiece],

["bunkerTower",["Land_Fort_Watchtower_EP1"], false,3.5 * 2.5,1,[-0.8,3.1], 90],

// sets
["bunkerTowerMGWest",["towerFortMgUS"], true, 3.5 * 2.5 ,1 ,[-1.0, 3.2] , 0],

["tentBigCoveredE",["tentBigCoverEast"], true, [8*2,8*2] ,1 ,[0,0] , 0],
["tentCoveredW",["tentCoverUS"], true, [7*2,7*2] ,1 ,[0,0] , 0],
["tentBigCoveredW",["tentBigCoverUS"], true, [8*2,12*2] ,1 ,[0,0] , 0],

["helirepairUS",["helirepairUS"], true, [45,35] ,1 ,[0,0] , 0],
["carRepUs",["carRepUs"], true, [35,35] ,1 ,[0,0] , 0],
["supplyDepot",["supplyDepot"], true, [35,35] ,1 ,[0,0] , 0],

["barracksAreaCoveredUS",["barracksAreaUS"], true, [35,40] ,1 ,[0,0] , 0],


["aaLauncher",["aaLauncher"], true, [35,35] ,1 ,[0,0] , 0],
["aaSandbags",["zuSandbags"], true, 3.5 * 2.5 ,1 ,[0,0] , 0],

//

// walls
["barrierWithWire",["barrierWithWire"], true, [8.5,1] ,1 ,[0,0] , 0],

["Fence_Ind_long",["Fence_Ind_long"], false, [9,0.5] ,1 ,[0,0] , 180],
["Fence_Ind",["Fence_Ind"], false, 0,1 ,[0,0] , 180],



//

["tentEast",["CampEast_EP1"], false,4 * 2.5, 4 ,[0,0], 180],

["tentWest",["Camp"], false,4 * 2.5, 4 ,[0,0], 0],

["tentBeds",["Land_tent_east"], false,4 * 2.5, 4 ,[0,0], 90],

["tentMedicWest",["MASH_EP1"], false,4 * 2.5, 4 ,[0,0], 0],


["cargoCont",["Misc_Cargo1B_military","Land_Misc_Cargo1E_EP1","Misc_Cargo1Bo_military","Land_Misc_Cargo1Eo_EP1"], false,4 * 2.5, 4 ,[0,0], 0],

["conts",["Misc_cargo_cont_net3","Misc_cargo_cont_net2"], false,4 * 2.5, 4 ,[0,0], 0],

["powerGen",["PowGen_Big"], false,4 * 2.5, 4 ,[0,0], 0],

["Barracks",["Barrack2"], false,0, 4 ,[0,0], 180], //  Land_Barrack2_EP1


["Helizone",["HeliH"], false, [22,22] , 1 ,[0,0], 0],


["FieldhHospital",["US_WarfareBFieldhHospital_Base_EP1"], false, 0 , 1 ,[0,0], 0],


["Toilet",["Land_Toilet"], false, 0 , 1 ,[0,0], 180],
["Barrels",["Barrels"], false, 0 , 1 ,[0,0], 0],
["BagStack",["Land_bags_stack_EP1"], false, 0 , 1 ,[0,0], 0],
["AmmoCratesL",["AmmoCrates_NoInteractive_Large"], false, 0 , 1 ,[0,0], 0],
["GarbageCont",["Land_Misc_GContainer_Big"], false, 0 , 1 ,[0,0], 0],
["Crates",["Land_transport_crates_EP1"], false, 0 , 1 ,[0,0], 0]


// [-0.8, 3.1]
];

// Land_HBarrier_large


{
_objnames = _x select BO_DEFNAME;
_objname = _objnames select 0;

_isComb = _x select BO_ISCOMB;

_dim = _x select BO_DIMENSION;
if(_objname != "empty" ) then
{

if( (typename _dim) != "ARRAY") then
{

if(!_isComb) then
{

_veh = createVehicle [_objname, [0,0,100000000] ,[], 0, "NONE"];
_bbox = boundingbox _veh; 
deleteVehicle  _veh;
_bmin = _bbox select 0;
_bmax = _bbox select 1;


_3dsizex = (-(_bmin select 0) ) +  (_bmax select 0);
_3dsizey = (-(_bmin select 1) ) +  (_bmax select 1);

_x set[BO_DIMENSION, [_3dsizex,_3dsizey] ];

}
else
{
_x set[BO_DIMENSION, [25,25] ];
};

};


};

} foreach baseObjects;


//_special = [["bunkerTowerMGWest", 5],["GateBar", floor( _wallLength / 2 - 1)]];


//_wallLength = _area;

_buildings = 
[
["tentWest",[2,2], 1],

["tentEast",[2,2], 1],

["tentWest",[2,1], 1],

["tentBeds",[2,1], 1],
["tentBeds",[2,2], 1],
["tentMedicWest",[1,1], 1],

["Barracks",[2,1], 2],
["powerGen",[1,1], 1],
["conts",[2,1], 1],
["cargoCont",[1,1], 1],

["conts",[3,2], 1],
["cargoCont",[2,2], 1],

["Toilet",[4,1], 1],
["AmmoCratesL",[1,2], 1],
["BagStack",[1,1], 2],
["GarbageCont",[1,1], 1],
["Barrels",[1,1], 2],


["Helizone",[3,2], 1],

["aaLauncher",[1,1], 2],
["aaSandbags",[1,1], 2],

["barracksAreaCoveredUS",[1,1],2],
["helirepairUS",[1,1],1],
["carRepUs",[1,1],1],
["supplyDepot",[1,1],1],



["tentBigCoveredW",[1,1],2],

["tentCoveredW",[1,1],2],

["tentBigCoveredE",[1,1],2]



];


//"Land_HBarrier_large" [10.3873,4.20287]

_wallLength1 = 25;
_wallLength2 = 35;
_dif = _wallLength2 / _wallLength1;
_gatePos = 10;
_special1 = [["bunkerTowerMGWest", 5],["GateBar", _gatePos]];
_special2 = [ ["openX3", _dif *  _gatePos]];


[_opos, _wallLength2, "Fence_Ind_long",_special2] call MakeWall;


[_opos, _wallLength1, "barrierWithWire", _special1] call MakeWall;






//[[0.5,0.0], [0.5,0.5], 5] call addRoad;
//[[0.0,0.5], [1.0,0.5],5] call addRoad;


// should have some variables set
if(_wallLength < 0 || _wallPieceSize < 0) exitWith { hint "wall variables not set"; };
if(isnil "_placeArea") exitWith { hint "_placeArea not set"; };

//diag_log format["%1", typename _placeArea];

// buildings in the base
_step = 2;

_failcount = 0;


while{count _buildings > 0 } do
{

//_placeI = (random ((count _buildings ) - 1 )) ;
//_place = _buildings select _placeI;

_largest = -1;
_biggestPlaceable = [];
_i = 0;
_placeI = -1;

{
_place = _x;
_piece = (_place select 0) call getSpesObjectDef;
_dim = _piece select BO_DIMENSION;
_size = (_dim select 0) + (_dim select 1),
if(_size > _largest) then
{
_largest = _size;
_biggestPlaceable = _place;
_placeI = _i;
};
_i = _i + 1;
} foreach _buildings;

if(_placeI == -1) exitWith { hint "error, couldnt determine largest placeable"; };

_place = _biggestPlaceable;


_piece = (_place select 0) call getSpesObjectDef;
/*
_objnames = _piece select BO_DEFNAME;
_oi = (random ((count _objnames ) - 1 ));
_objname = _objnames select _oi;
*/



_dim = _piece select BO_DIMENSION;

_s = _place select 1;
_sizex = _s select 0;
_sizey = _s select 1;

_objrotation = _piece select BO_ROTATION;

_placeNum = _place select 2;

scopename "findSpotLoop";
_wasplaced = false;


_space = _spaceBetweenObjs;
_3dsizex = (_dim select 0) + _space;
_3dsizey = (_dim select 1) + _space;


_xsd = _3dsizex / 2;
_ysd = _3dsizey / 2;




_rotStart = (floor(random 3)) * 90;
//_rotStart = 0;
_placementA = _rotStart;




//sleep 2.3;

_maxY = _placeAreaD2 ;
_ia = 0;
while{ _ia < 4} do
{
_ia = _ia + 1;

//player sidechat format["angle : %1", _placementA];

_lx = floor(random (_placeArea));
_ly = 0;//floor(random _maxY);//(_placeArea);

for [{_x= 0},{_x < _placeArea},{_x=_x+_step}] do
//for [{_y= 0},{_y < _placeArea},{_y=_y+_step}] do
{
for [{_y= 0},{_y < _maxY},{_y=_y+_step}] do
//for [{_x= 0},{_x < _placeArea},{_x=_x+_step}] do
{
_cx = _x + _lx;
if(_cx >= _placeArea) then { _cx = _x - _placeArea + _lx; };
_cy = _y + _ly;
if(_cy >= _maxY) then { _cy = _y - _maxY + _ly; };


// unrotated rect
_rectStartx = _cx - _xsd;
_rectStarty = _cy - _ysd;
_roWidth = _sizex*_3dsizex;
_roHeight = _sizey*_3dsizey;
//_p = [[_roWidth,_roHeight], _placeAreaD2, _placementA] call rotate;
_rectsizex = _roWidth; //_p select 0;
_rectsizey = _roHeight; //_p select 1;

_rectEndx = _rectStartx + _rectsizex;
_rectEndy = _rectStarty + _rectsizey;

_rw = _placeAreaD2 + 0;
_ry = _placeAreaD2 + 0;

// rotate the rect
_p1 = [[_rectStartx,_rectStarty], [_rw,_ry], _placementA] call rotate;

_p2 = [[_rectEndx,_rectEndy],[_rw,_ry], _placementA] call rotate;

_rectStartx = (_p1 select 0) + _pox;
_rectStarty = (_p1 select 1) + _poy;

_rectEndx = (_p2 select 0) + _pox;
_rectEndy = (_p2 select 1) + _poy;



_startx = (_cx) ;
_starty = (_cy) ;

/*
// rotate the object first placement point
_p = [[_cx,_cy],_placeAreaD2, _placementA] call rotate;

_cx = _p select 0;
_cy = _p select 1;

_startx = (_cx) + _pox;
_starty = (_cy) + _poy;
*/


if(_rectStartx > _rectEndx) then
{
_s = _rectEndx;
_rectEndx = _rectStartx;
_rectStartx = _s;
};


if(_rectStarty > _rectEndy) then
{
_s = _rectEndy;
_rectEndy = _rectStarty;
_rectStarty = _s;
};


_blocked = false;

if(_rectStartx <= ((_opos select 0) - _placeAreaD2) ) then
{
_blocked = true;
};
if(_rectStarty <= ((_opos select 1) - _placeAreaD2) ) then
{
_blocked = true;
};

if(_rectEndx >= ((_opos select 0) + _placeAreaD2) ) then
{
_blocked = true;
};

if(_rectEndy >= ((_opos select 1) + _placeAreaD2) ) then
{
_blocked = true;
};

if(!_blocked) then
{
{

_pos = _x select 0;
_px = _pos select 0;
_py = _pos select 1;
_rectend2 = _x select 1;

if( !
 ( _rectStartx > ( (_rectend2 select 0)) || _rectEndx < _px  
|| _rectStarty > ( (_rectend2 select 1)) || _rectEndy < _py  )) then
{
_blocked = true;
};

} foreach _placed;
};

//_blocked = false;


if(!_blocked) then
{


_gap = _spaceBetweenSets;

/*
_veh = createVehicle ["Sign_sphere100cm_EP1", [_rectStartx,_rectStarty] ,[], 0, "NONE"];
_veh setPosATL  [_rectStartx,_rectStarty,1];

_veh = createVehicle ["Sign_sphere100cm_EP1", [_rectEndx,_rectEndy] ,[], 0, "NONE"];
_veh setPosATL  [_rectEndx,_rectEndy,1];

_veh = createVehicle ["Sign_sphere100cm_EP1", [_rectStartx,_rectEndy] ,[], 0, "NONE"];
_veh setPosATL  [_rectStartx,_rectEndy,1];
_veh = createVehicle ["Sign_sphere100cm_EP1", [_rectEndx,_rectStarty] ,[], 0, "NONE"];
_veh setPosATL  [_rectEndx,_rectStarty,1];
*/

_placed = _placed + [  [[_rectStartx-_gap,_rectStarty-_gap], [_rectEndx+_gap, _rectEndy+_gap]]  ];

//_failcount = 0;

for [{_y2=0},{_y2 < _sizey},{_y2=_y2+1}] do
{
for [{_x2=0},{_x2 < _sizex},{_x2=_x2+1}] do
{
_p = [[_startx + _x2* _3dsizex, _starty +  _y2* _3dsizey], [_rw,_ry], _placementA] call rotate; // todo

_pos = [ ((_p select 0) ) + _pox ,((_p select 1) ) + _poy, 0 ];


[_piece,_pos,_placementA] call createBaseObj;

/*
_veh = createVehicle [_objname, _pos ,[], 0, "NONE"];
//player sidechat format["zzz: %1 %2 %3",_pos,[_sizex,_sizey],[_x2,_y2]];

_veh setPosATL  _pos;

_veh setdir (_placementA + _objrotation);
*/
};
};

/*
_pos = [_startx + _pox , _starty + _poy, 0 ];
_veh = createVehicle ["FlagCarrierUSA_EP1", _pos ,[], 0, "NONE"];
_veh setPosATL  _pos;
*/

_wasplaced = true;

breakTo "findSpotLoop";

};

};
};

_placementA = _placementA + 90;
if(_placementA >= 360) then { _placementA = 0; };
};


if(_wasplaced && _placeNum > 1) then
{
_place set[2, _placeNum - 1];
//_buildings set[_placeI, _place];
}
else // remove always failed or not
{
_buildings set[_placeI, -1];
_buildings = _buildings - [-1];


if(!_wasplaced) then
{
_failcount = _failcount + 1;

player sidechat format["Failed to place: %1 %2",_piece select BO_NAME, _dim];
};

};


player sidechat format["Buildings left to place: %1",count _buildings];

//player sidechat format["Loop: %1 %2 %3",_wasplaced,_failcount,_buildings];

};

_all = false;
if(_failcount == 0) then
{
_all = true;
};

_str = format["Base built. AllPlaced:%1 NumFailed:%2", _all,_failcount];
hint _str;
diag_log _str;