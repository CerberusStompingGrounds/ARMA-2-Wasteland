_lsdfp_olddmgv = damage (vehicle player);

if (_lsdfp_olddmgv <=0) then {

hint "***Your vehicle is not damaged***";
}
else
{

hint "***Open Repair Kit***";

sleep 2;

lsdfp_repkitused=true; 
publicvariable "lsdfp_repkitused";


_lsdfp_classskillv = 0.9;
_lsdfp_classfuelv = 0.9;

// Damage calculation 
_lsdfp_dmgv = damage (vehicle player);
_lsdfp_healv = random 0.1;
_lsdfp_newdmgv = _lsdfp_dmgv - _lsdfp_healv;
_lsdfp_newnewdmgv = _lsdfp_newdmgv - _lsdfp_classskillv;
(vehicle player) setdamage _lsdfp_newnewdmgv;

// Fuel calculation 
_lsdfp_vehfuelv = fuel (vehicle player);
_lsdfp_vehfuelnewv = _lsdfp_vehfuelv + _lsdfp_classfuelv;
(vehicle player) setfuel _lsdfp_vehfuelnewv;

_lsdfp_healv = _lsdfp_dmgv - _lsd_fp_newnewdmgv;

if (_lsdfp_newnewdmgv <= 0) then {

hint "***Vehicle completely repaired!***";

}
else
{

hint format ["***Unable to repair: %1 dmg points***",_lsdfp_newnewdmgv];

};
};