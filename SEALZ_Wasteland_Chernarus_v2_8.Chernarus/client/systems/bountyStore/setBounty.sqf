//	@file Version: 1.0
//	@file Name: inviteTobounty.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

//if(player != leader group player) exitWith {player globalChat format["you are not the leader and can't invite people"];};

#define bountyManagementDialog 55510
#define bountyManagementPlayerList 55511

disableSerialization;

private["_dialog","_playerListBox","_bountyInvite","_target","_index","_playerData","_check","_unitCount","_hasBounty"];
_switch = _this select 0;
_dialog = findDisplay bountyManagementDialog;
_playerListBox = _dialog displayCtrl bountyManagementPlayerList;

_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
//_hasBounty = false;
_check = 0;

//Check selected data is valid   			
{if (str(_x) == _playerData) then {_target = _x;_check = 1;};}forEach playableUnits;

diag_log "Invite to bounty: Before the checks";

//Checks
if(_check == 0) exitWith{player globalChat "you must select someone to place a bounty on first";};
diag_log "Invite to bounty: After the checks";

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		
		if(10000 > (player getVariable "cmoney")) exitWith {hint "You do not have the $10,000 to cover the bounty"};
		currentBounties set [count currentBounties,[name player,getPlayerUID _target, 10000]];
		publicVariableServer "currentBounties";
		_target setVehicleInit format["if (name player == ""%1"") then {player globalChat ""A $10,000 bounty has been placed on your head by %2"";};",name _target,name player];
		player globalChat format["you have placed a $10,000 bounty on %1's head. He will not be pleased!",name _target];
		_playerMoney = player getVariable "cmoney";
		player setVariable["cmoney",_playerMoney - 10000,false];		
	};
	
	//Buy To Crate
	case 1:
	{
		if(25000 > (player getVariable "cmoney")) exitWith {hint "You do not have the $25,000 to cover the bounty"};
		currentBounties set [count currentBounties,[name player,getPlayerUID _target, 25000]];	
		publicVariableServer "currentBounties"; 
		_target setVehicleInit format["if (name player == ""%1"") then {player globalChat ""A $25,000 bounty has been placed on your head by %2"";};",name _target,name player];
		player globalChat format["you have placed a $25,000 bounty on %1's head. He will not be pleased!",name _target];
		_playerMoney = player getVariable "cmoney";
		player setVariable["cmoney",_playerMoney - 25000,false];
		//TO DO: add to the message system to broadcast every 10 minutes that there is a bounty
	};
	
	//Buy To Crate
	case 2:
	{
		if(50000 > (player getVariable "cmoney")) exitWith {hint "You do not have the $50,000 to cover the bounty"};
		currentBounties set [count currentBounties,[name player,getPlayerUID _target, 50000]];
		publicVariableServer "currentBounties"; 
		_target setVehicleInit format["if (name player == ""%1"") then {player globalChat ""A $50,000 bounty has been placed on your head by %2"";};",name _target,name player];
		player globalChat format["you have placed a $50,000 bounty on %1's head. He will not be pleased!",name _target];
		_playerMoney = player getVariable "cmoney";
		player setVariable["cmoney",_playerMoney - 50000,false];
		//TO DO: For the 50k bounty we will track the users.
	};	
};

processInitCommands;
clearVehicleInit _target;

