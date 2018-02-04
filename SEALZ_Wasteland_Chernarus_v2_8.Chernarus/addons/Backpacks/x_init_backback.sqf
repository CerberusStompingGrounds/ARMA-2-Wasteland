// by Xeno
#define __COMP x
#define FUNC(funcname) __COMP##_fnc_##funcname
#define GVAR(varname) __COMP##_##varname
#define QUOTE(qtext) #qtext
#define __pGetVar(pvarname) (player getVariable #pvarname)
#define __pSetVar player setVariable
#define __prma _p removeAction _id
#define __addbp __pSetVar [#x_pbp_id, _p addAction [_s call FUNC(GreyText), "addons\Backpacks\x_backpack.sqf",[],-1,false]]
#define __addmx _p addMagazine _x
#define __addwx _p addWeapon _x

waitUntil {!isNull player};
sleep 1;

_p = player;

FUNC(GreyText) = {"<t color='#f0bfbfbf'>" + _this + "</t>"};

FUNC(GetDisplayName) = {
	private ["_obj_name", "_obj_kind", "_cfg"];
	_obj_name = _this select 0; _obj_kind = _this select 1;
	_cfg = switch (_obj_kind) do {case 0: {"CfgVehicles"};case 1: {"CfgWeapons"};case 2: {"CfgMagazines"};};
	getText (configFile >> _cfg >> _obj_name >> "displayName")
};

FUNC(CreateTrigger) = {
	private ["_pos", "_trigarea", "_trigact", "_trigstatem", "_trigger"];
	_pos = _this select 0; _trigarea = _this select 1; _trigact = _this select 2; _trigstatem = _this select 3;
	_trigger = createTrigger ["EmptyDetector" ,_pos];
	_trigger setTriggerArea _trigarea;
	_trigger setTriggerActivation _trigact;
	_trigger setTriggerStatements _trigstatem;
	_trigger
};

FUNC(playerkr) = {
	private "_p";
	_p = player;
	if ((_this select 0) == 0) then {
		_id = __pGetVar(GVAR(pbp_id));
		if (_id != -9999) then {
			__prma;
			__pSetVar [QUOTE(GVAR(pbp_id)), -9999];
		};
	} else {
		if (count GVAR(backpack_helper) > 0) then {
			{__addmx} forEach (GVAR(backpack_helper) select 0);
			{__addwx} forEach (GVAR(backpack_helper) select 1);
			GVAR(backpack_helper) = [];
		};
		if (count __pGetVar(GVAR(player_backpack)) == 0) then {
			if (primaryWeapon _p != "" && primaryWeapon _p != " ") then {
				_s = ([primaryWeapon _p,1] call FUNC(GetDisplayName)) + " to Backpack";
				if (__pGetVar(GVAR(pbp_id)) == -9999) then {__addbp};
			};
		} else {
			_s = "Weapon " + ([__pGetVar(GVAR(player_backpack)) select 0,1] call FUNC(GetDisplayName));
			if (__pGetVar(GVAR(pbp_id)) == -9999) then {__addbp};
		};
	};
};

GVAR(backpack_helper) = [];
__pSetVar [QUOTE(GVAR(player_backpack)), []];
__pSetVar [QUOTE(GVAR(pbp_id)), -9999];

GVAR(prim_weap_player) = primaryWeapon _p;

if (GVAR(prim_weap_player) != "" && GVAR(prim_weap_player) != " ") then {
	_s = ([GVAR(prim_weap_player),1] call FUNC(GetDisplayName)) + " to Backpack";
	__addbp;
};

FUNC(bpcond) = {
	(primaryWeapon player != GVAR(prim_weap_player) && primaryWeapon player != " " && !dialog)
};

FUNC(bponact) = {
	private "_id";
	GVAR(prim_weap_player) = primaryWeapon player;
	_id = __pGetVar(GVAR(pbp_id));
	if (_id != -9999 && count (__pGetVar(GVAR(player_backpack))) == 0) then {
		player removeAction _id;
		__pSetVar [QUOTE(GVAR(pbp_id)), -9999];
	};
	if (__pGetVar(GVAR(pbp_id)) == -9999 && count (__pGetVar(GVAR(player_backpack))) == 0 && GVAR(prim_weap_player) != "" && GVAR(prim_weap_player) != " ") then {
		__pSetVar [QUOTE(GVAR(pbp_id)), player addAction [format ["%1 to Backpack", [GVAR(prim_weap_player),1] call FUNC(GetDisplayName)] call FUNC(GreyText), "addons\Backpacks\x_backpack.sqf",[],-1,false]];
	};
};

[[0,0,0], [0, 0, 0, false], ["NONE", "PRESENT", true], ["call x_fnc_bpcond","call x_fnc_bponact",""]] call FUNC(CreateTrigger);

_p addEventHandler ["killed", {[0] call FUNC(playerkr)}];
_p addEventHandler ["respawn", {[1] call FUNC(playerkr)}];