//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
//_type = _this select 1;
_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
if(isnil {_player getVariable "cmoney"}) then {_player setVariable["cmoney",0,true];};

private["_KillerName","_Playername","_KillerWep","_player","_killer","_mainTextColour","_successTextColour","_failTextColour","_townTextColour","_subTextColour","_missionType","_wDName","_wPic","_town_name","_hint", "_showKillMsg","_playerKilled","_totalBountyAmt","_bountyRewarded","_killerMoney","_killerTemp","_killerUID","_m", "_isGrouped","_isBounty"];
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_townTextColour = "#4BC9B0";

_showKillMsg = true;
_KillerName = name _killer; //Need to make sure we have a killer
_Playername = name _player; //Need to make sure we have a player
_KillerWep = currentWeapon _killer; 
_KillerVeh = vehicle _killer;

if (_KillerWep == "Colt1911") then 
{
	_showKillMsg = false
};
if (_KillerWep == "Makarov") then 
{
	_showKillMsg = false
};
if (_KillerWep == "glock17_EP1") then 
{
	_showKillMsg = false
};	
_wDName = getText(configFile >> "cfgWeapons" >> _KillerWep >> "displayName");
if (_wDName == "")then {
	//We dot have a weapon Name. Try to get the vehicle they were in.
	_wDName = getText (configFile >> "cfgVehicles" >> typeOf _KillerVeh >> "displayName");	
};

_wPic =  getText(configFile >> "cfgWeapons" >> _KillerWep >> "picture");
if (_wPic == "")then {
	//We dot have a weapon Pic Name. Try to get the vehicle they were in.
	_wPic = getText (configFile >> "cfgVehicles" >> typeOf _KillerVeh >> "picture");	
};
	
_closesttown = (nearestLocations [_player,["NameCityCapital","NameCity","NameVillage"],10000]) select 0;
_town_name = text _closesttown;
 
//***************************************************

PlayerCDeath = [_player];
publicVariable "PlayerCDeath";
if (isServer) then {
	_id = PlayerCDeath spawn serverPlayerDied; 
};

if(!local _player) exitwith {};
diag_log format["#####Initial Kill##### Killer: %1 Killer Side: %2 Killer Weapon: &3 Killer Vehicle: %4, Victim: %5 Victim Side: %6",_KillerName, side _killer, _KillerWep, _KillerVeh, _Playername, side _player];

//if you are Resistance and you did not kill yourself
/* if (!(str(playerSide) in ["WEST", "EAST"]) && (_player != _killer)) then
	{
		diag_log format["#####CIV On CIV Kill##### Killer: %1 Killer Side: %2 Killer Weapon: &3 Killer Vehicle: %4, Victim: %5 Victim Side: %6",_KillerName, side _killer, _KillerWep, _KillerVeh, _Playername, side _player];
		_isGrouped = false;
	//If you are not in a group and killed another res. Add Score.		
		{
			_isGrouped = true;
		} forEach units group _killer;
		
	if(!_isGrouped) then
		{
			//_killer addScore 2;
		diag_log format["#####Killer not in Group. Good Kill##### Killer: %1 Killer Side: %2 Killer Weapon: &3 Killer Vehicle: %4, Victim: %5 Victim Side: %6",_KillerName, side _killer, _KillerWep, _KillerVeh, _Playername, side _player];			
			_killer setVehicleInit format["if (name player == ""%1"") then {_killer addScore 2;};",_KillerName];
		} else
		{
			//We need to see if they are in the group or not.
			if (group _player != group _killer) then
				{
					diag_log format["#####Killer not in Same Group. Good Kill##### Killer: %1 Killer Side: %2 Killer Weapon: &3 Killer Vehicle: %4, Victim: %5 Victim Side: %6",_KillerName, side _killer, _KillerWep, _KillerVeh, _Playername, side _player];				
					_killer setVehicleInit format["if (name player == ""%1"") then {_killer addScore 2;};",_KillerName];
				}else
				{
					diag_log format["#####Killer not Same Group. TEAM Kill##### Killer: %1 Killer Side: %2 Killer Weapon: &3 Killer Vehicle: %4, Victim: %5 Victim Side: %6",_KillerName, side _killer, _KillerWep, _KillerVeh, _Playername, side _player];					
					pvar_PlayerTeamKiller = objNull;
					if(_killer isKindOf "CAManBase") then {
						pvar_PlayerTeamKiller = _killer;
					} else {
						_veh = (_killer);
						_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
						_paths = [[-1]];
						if (count _trts > 0) then {
							for "_i" from 0 to (count _trts - 1) do {
								_trt = _trts select _i;
								_trts2 = _trt >> "turrets";
								_paths = _paths + [[_i]];
								for "_j" from 0 to (count _trts2 - 1) do {
									_trt2 = _trts2 select _j;
									_paths = _paths + [[_i, _j]];
								};
							};
						};
						_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
						_suspects = [];
						{
							_weps = (_veh weaponsTurret _x) - _ignore;
							if(count _weps > 0) then {
								_unt = objNull;
								if(_x select 0 == -1) then {_unt = driver _veh;}
								else {_unt = _veh turretUnit _x;};
								if(!isNull _unt) then {
									_suspects = _suspects + [_unt];
								};
							};
						} forEach _paths;

						if(count _suspects == 1) then {
							pvar_PlayerTeamKiller = _suspects select 0;
						};
					};
	
				};
		};	
	}; */

if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
//if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"]) && ()) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};
//if (name(_player) != "Error: No unit") then
//if ((_killerName != "Error: No unit") or (_Playername != "Error: No unit") or (_killerName != "Error: No vehicle") or (_Playername != "Error: No vehicle")) then{
	if(!isNull(pvar_PlayerTeamKiller) && (!isNull _player) && (!isNull _killer)) then 
	{
		//Send the Team Kill Meassage
		_missionType = "=SEALZ=<br/>Team Kill Message";
		_hint = parseText format ["<t align='center' color='%10' shadow='2' size='1.75'>%1</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%6</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> was used by <t color='%9'>%6</t> to TEAM KILL <t color='%10'>%7</t> near the town of <t color='%11'>%8</t>.</t>", _missionType, _wPic, _wDName, _mainTextColour, _subTextColour, _KillerName, _Playername, _town_name,_successTextColour,_failTextColour,_townTextColour];
		
		publicVar_teamkillMessage = pvar_PlayerTeamKiller;
		publicVariable "publicVar_teamkillMessage";
	};

	if((_player == _killer) && (isNull(pvar_PlayerTeamKiller))) then
	{
		//Killed by self
		if (_showKillMsg) then
		{
			_missionType = "=SEALZ=<br/>Darwin Award";
			_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Darwin Award</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%6</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> is on the dead body of <t color='%10'>%7</t> near the town of <t color='%11'>%8</t>. He has somehow managed to kill himself.</t>", _missionType, _wPic, _wDName, _mainTextColour, _subTextColour, _KillerName, _Playername, _town_name,_successTextColour,_failTextColour,_townTextColour];		
		};

	};

	//(isnil {_player getVariable "cmoney"})
	if((_player != _killer) && (isNull(pvar_PlayerTeamKiller))) then 
	{
		_isBounty = true;
		if (isNull _killer) then
			{
				//No killer was passed in.
				 _missionType = "=SEALZ=<br/>Unknown Kill Message";
				 _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ= Kill Message</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%6</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A mysterious death has occurred near <t color='%11'>%8</t>.</t>", _missionType, _wPic, _wDName, _mainTextColour, _subTextColour, _KillerName, _Playername, _town_name,_successTextColour,_failTextColour,_townTextColour];			
				_isBounty = false;
			};
		if (isNull _player) then
			{
				//No player was passed in.
				 _missionType = "=SEALZ=<br/>Unknown Kill Message";
				 _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ= Kill Message</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%6</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A mysterious death has occurred near <t color='%11'>%8</t>.</t>", _missionType, _wPic, _wDName, _mainTextColour, _subTextColour, _KillerName, _Playername, _town_name,_successTextColour,_failTextColour,_townTextColour];_isBounty = false;			
			};
			
		_totalBountyAmt = 0;
		_bountyRewarded = false;
		//We need to check if the killer will receive a bounty
		{
			_playerKilled = (_x select 1);
			_bountyAmount = (_x select 2);
			if((getPlayerUID _player == _playerKilled) && (isPlayer _killer)) then
				{
					_totalBountyAmt = _totalBountyAmt + _bountyAmount;
					_bountyRewarded = true;
					//Delete the bounty from array.				
					currentBounties set [_forEachIndex,"REMOVETHISCRAP"];
					currentBounties = currentBounties - ["REMOVETHISCRAP"];
					publicVariableServer "currentBounties";
					sleep 0.5;  					
				};
		}forEach currentBounties;

		if ((_bountyRewarded) && (_isBounty)) then
			{
				_killer setVehicleInit format["if (name player == ""%1"") then{_PlayerMoney = (player getVariable ""cmoney"");player setVariable[""cmoney"", (_PlayerMoney + %2), true];};",_KillerName, _totalBountyAmt];
				_killer setVehicleInit format["if (name player == ""%1"") then {player globalChat ""You have been awarded a $%2 bounty for killing %3"";};",_KillerName,_totalBountyAmt,_Playername];
				_missionType = "=SEALZ=<br/>Bounty Claimed!";
				_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Bounty Claimed!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%6</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> was used by <t color='%9'>%6</t> to murder <t color='%10'>%7</t> near the town of <t color='%11'>%8</t>. A $%12 bounty was claimed. Check around the corpse for your reward. Nice Work!</t>", _missionType, _wPic, _wDName, _mainTextColour, _subTextColour, _KillerName, _Playername, _town_name,_successTextColour,_failTextColour,_townTextColour, _totalBountyAmt];	
				processInitCommands;
				clearVehicleInit _killer;				
			} else
			{
				//Killed by a player
				_missionType = "=SEALZ=<br/>Kill Message";
				_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>=SEALZ=<br/>Kill Message</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%6</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> was used by <t color='%9'>%6</t> to murder <t color='%10'>%7</t> near the town of <t color='%11'>%8</t>.</t>", _missionType, _wPic, _wDName, _mainTextColour, _subTextColour, _KillerName, _Playername, _town_name,_successTextColour,_failTextColour,_townTextColour];			
			};
	};

[nil,nil,rHINT,_hint] call RE;	

private["_a","_b","_c","_d","_e","_f","_m","_player","_killer", "_to_delete"];

_to_delete = [];
_to_delete_quick = [];

if((_player getVariable "cmoney") > 0) then {
	_m = "EvMoney" createVehicle (position _player);
	_m setVariable["money", (_player getVariable "cmoney"), true];
	_m setVariable ["owner", "world", true];
	_to_delete = _to_delete + [_m];
};

if((_player getVariable "medkits") > 0) then {
	for "_a" from 1 to (_player getVariable "medkits") do {	
		_m = "CZ_VestPouch_EP1" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

if((_player getVariable "repairkits") > 0) then {
	for "_b" from 1 to (_player getVariable "repairkits") do {	
		_m = "Suitcase" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

publicVar_objectsToDelete = [_to_delete, _to_delete_quick];
publicVariableServer "publicVar_objectsToDelete";

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["", "BLACK OUT", 1];
};