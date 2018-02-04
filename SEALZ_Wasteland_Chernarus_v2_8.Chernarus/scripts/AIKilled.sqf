_victim = _this select 0;
_killer = _this select 1;
_groupType = _this select 2;

 _killer addScore 2;
 
 if(_groupType == "pirates") then
	{
		_bountyAmount = _this select 3;
		_killer setVehicleInit format["if (name player == ""%1"") then{_PlayerMoney = (player getVariable ""cmoney"");player setVariable[""cmoney"", (_PlayerMoney + %2), true];};",name _killer,_bountyAmount];
		_killer setVehicleInit format["if (name player == ""%1"") then {player globalChat ""You have been awarded a $%2 bounty for killing a pirate."";};",name _killer,_bountyAmount];
		processInitCommands;
		clearVehicleInit _killer;			
	};
 
 //hint format["NameOfKiller: %2, Victim: %1",name _victim, name _killer];
diag_log format["NameOfKiller: %2, Victim: %1",name _victim, name _killer];