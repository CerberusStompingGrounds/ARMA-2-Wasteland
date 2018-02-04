//	@file Version: 1.0
//	@file Name: loadbountyManagement.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define bountyManagementDialog 55510
#define bountyManagementPlayerList 55511
#define bountyManagementbountyList 55512
#define bountyManagementInviteButton 55514
#define bountyManagementKickButton 55515
#define bountyManagementDisbandButton 55516
#define bountyManagementLeaveButton 55517
#define bountyManagementAcceptButton 55518
#define bountyManagementDeclineButton 55519
#define bountyManagementInviteText 55520
#define bountyManagementInviteButton1 55521
#define bountyManagementInviteButton2 55522   
#define bountyManagementInfoButton 55523
     
disableSerialization;
				
private ["_start","_dialog","_mybounty","_playerListBox","_bountyListBox","_uid","_namestr","_index","_bountyCreate","_bountyInvite","_bountyKick","_bountyDisband","_bountyLeaveButton","_inbounty","_isLeader","_name","_bountyInvite1","_bountyInvite2","_bountyInfo", "_player","_bountyAmount","_playerUID","_bountyCreatorName"];

closeDialog 0;
_start = createDialog "bountyManagement";			
_dialog = findDisplay bountyManagementDialog;
_display displayAddEventHandler ["KeyDown", "_return = false; if(bountyManagmentActive && (_this select 1) == 1) then {_return = true;}; _return"];
bountyManagmentActive = true;
_playerListBox = _dialog displayCtrl bountyManagementPlayerList;
_bountyListBox = _dialog displayCtrl bountyManagementbountyList;
_bountyInvite = _dialog displayCtrl bountyManagementInviteButton;
_bountyInvite1 = _dialog displayCtrl bountyManagementInviteButton1;
_bountyInvite2 = _dialog displayCtrl bountyManagementInviteButton2;
_bountyInviteText = _dialog displayCtrl bountyManagementInviteText;

_bountyInvite ctrlShow false;
_bountyInvite1 ctrlShow false;
_bountyInvite2 ctrlShow false;
_hasBounty = false;
while{bountyManagmentActive} do
{
  
    //Update player list  
	{
		//Add to list
		_namestr = name(_x);             
		_index = _playerListBox lbAdd _namestr;
		_playerListBox lbSetData [_index, str(_x)];      
	}forEach playableUnits;
    
    //Update bounty list with Bounties already payed for.
    {
		_playerUID = (_x select 1);
		_player = objNull;
		   {
			 if (getPlayerUID _x == _playerUID) then {
				  _player = _x;
			 };
		   } forEach playableUnits;			   
		_bountyCreatorName = (_x select 0);		   
		_bountyAmount = (_x select 2);	
		if (!isNull _player) then
			{
				_namestr = format["%1 ($%2) by %3",name(_player), _bountyAmount, _bountyCreatorName];			
				_index = _bountyListBox lbAdd _namestr;
				_bountyListBox lbSetData [_index, str(_namestr)];				
			};
    }forEach currentBounties;
     
	sleep 0.5;
    _hasBounty = false;
    lbClear _playerListBox;
    lbClear _bountyListBox;
}