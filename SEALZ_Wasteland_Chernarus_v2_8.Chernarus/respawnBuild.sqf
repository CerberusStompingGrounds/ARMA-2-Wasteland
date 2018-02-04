
_build = _this;

_typeof = typeof _build;

_pos = getposatl _build;
_angle = getdir _build;


while{ true } do
{
sleep 1;

if(damage _build >= 1) then
{
hint "destroyed";

deleteVehicle _build;

_build = createVehicle [_typeof, _pos, [], 0, "NONE"];
_build setdir _angle;
_build setposatl _pos;

};




};

