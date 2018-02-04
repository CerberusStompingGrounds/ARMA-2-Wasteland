
_tank = vehicle (_this select 0);
_group = group (_this select 0);
_fac = _this select 1;
_angle = _this select 2;

{_x disableAI "move"; } foreach (units _group);

//_tank setdir (getdir _fac);

_fac animate ["vrata1", 1];
_fac animate ["vrata2", 1];

sleep 3;



_spd = 5;

_time = time;
_pos = getpos _tank;

while { true && alive _tank  && (_pos distance (getpos _tank)) < 20 } do
{

//_angle = (getdir _fac);
_d = vectorDir _tank;
_tank setVectorDir [sin _angle, cos _angle, _d select 2];




_tank setVelocity [(sin _angle) * _spd, (cos _angle) * _spd, 0 ];



0.0001;
};

_fac animate ["vrata1", 0];
_fac animate ["vrata2", 0];


{_x disableAI "move"; } foreach (units _group);