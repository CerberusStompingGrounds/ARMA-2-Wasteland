#include "mdialog\bounty_sys.sqf"; 

if(dialog) exitwith{closeDialog 0};

disableSerialization;

private["_Dialog","_bountyListBox","_playerUID","_bountyCreatorName","_player","_bountyCreator","_bountyAmount"];

_missionDialog = createDialog "bountySettings";

_Dialog = findDisplay bountysys_DIALOG;
_bountyListBox = _Dialog displayCtrl bountyManagementbountyList;

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
				_namestr = format["There is a $%2 bounty on %1's head. Courtesy of %3",name(_player), _bountyAmount, _bountyCreatorName];			
				_index = _bountyListBox lbAdd _namestr;
				_bountyListBox lbSetData [_index, str(_namestr)];	
			};	
    }forEach currentBounties;
     
	//sleep 0.5;
    //lbClear _bountyListBox;

 



