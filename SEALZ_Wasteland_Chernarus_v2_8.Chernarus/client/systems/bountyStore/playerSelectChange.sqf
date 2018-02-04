//	@file Version: 1.0
//	@file Name: playerSelectChange.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define bountyManagementDialog 55510
#define bountyManagementPlayerList 55511
#define bountyManagementInviteButton 55514
#define bountyManagementInviteButton1 55521
#define bountyManagementInviteButton2 55522
//#define bountyManagementInfoButton 55523

disableSerialization;

private["_dialog","_playerListBox","_bountyInvite","_target","_index","_playerData","_check","_unitCount","_bountyInvite1","_bountyInvite2"];

_dialog = findDisplay bountyManagementDialog;
_playerListBox = _dialog displayCtrl bountyManagementPlayerList;
_bountyInvite = _dialog displayCtrl bountyManagementInviteButton;
_bountyInvite1 = _dialog displayCtrl bountyManagementInviteButton1;
_bountyInvite2 = _dialog displayCtrl bountyManagementInviteButton2;

_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_check = 0;
			
_bountyInvite ctrlShow true;  
_bountyInvite1 ctrlShow true; 
_bountyInvite2 ctrlShow true; 
