/*
	Description:
	Adds weapons to vehicle and returns
	what was added.
	
	Parameter(s):
	_veh - Vehicle to add to
	_cargoGroups - Groups of items to select from. See vehicleTownSpawns config.
	
	Returns:
	Array - [weapons, magazines, items] matches format of weapon/magazine/itemCargo commands
*/

private ["_veh","_cargoGroups","_cargo","_weaponsAdded","_count","_index","_magsAdded","_item"];
_veh = [_this, 0, objNull, [objNull]] call BL_fnc_param;
_cargoGroups = [_this, 1, [], [[]]] call BL_fnc_param;
_cargo = _cargoGroups select floor random count _cargoGroups;

clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;

_weaponsAdded = [[], []];
{
	_count = (_x select 1) + floor random  (_x select 2);
	if ( _count > 0 ) then {
		_item = _x select 0;
		if ( typeName _item == "ARRAY" ) then {
			_item = _item select floor random count _item;
		};
		
		_veh addWeaponCargoGlobal [_item, _count];
		_index = count (_weaponsAdded select 0);
		(_weaponsAdded select 0) set [_index, _item];
		(_weaponsAdded select 1) set [_index, _count];
	};
} forEach (_cargo select 0);

_magsAdded = [[], []];
{
	_count = (_x select 1) + floor random  (_x select 2);
	if ( _count > 0 ) then {
		_item = _x select 0;
		if ( typeName _item == "ARRAY" ) then {
			_item = _item select floor random count _item;
		};

		_veh addMagazineCargoGlobal [_item, _count];
		_index = count (_magsAdded select 0);
		(_magsAdded select 0) set [_index, _item];
		(_magsAdded select 1) set [_index, _count];
	};
} forEach (_cargo select 1);

if ( count (_weaponsAdded select 0) == 0 ) then {
	_weaponsAdded = [];
};

if ( count (_magsAdded select 0) == 0 ) then {
	_magsAdded = [];
};

[_weaponsAdded, _magsAdded]