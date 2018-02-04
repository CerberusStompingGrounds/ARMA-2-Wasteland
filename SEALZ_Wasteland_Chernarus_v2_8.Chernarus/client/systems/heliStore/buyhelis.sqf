
//	@file Version: 1.0
//	@file Name: buyhelis.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "helidialog\helistoreDefines.sqf";
disableSerialization;

if(heliStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay helishop_DIALOG;
_cartlist = _dialog displayCtrl helishop_cart;
_totalText = _dialog displayCtrl helishop_total;
_playerMoneyText = _Dialog displayCtrl helishop_money;
_size = lbSize _cartlist;

switch(_switch) do 
{
	//Buy To Heli Pad and get in pilot seat.
	case 0: 
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
                _weapon = (configFile >> "cfgVehicles" >> _class);          
                diag_log format["Adding class %1 of weapon %2 of type %3",_class,_weapon,getNumber(_weapon >> "type")];
				_randomPosPlane = getMarkerPos ("HeliStoreMarker"); //*************************************************TO DO
				_plane2 = createVehicle [_class,[(_randomPosPlane select 0), (_randomPosPlane select 1),0],[], 0, "NONE"];
				_plane2 setdamage 0;
				_plane2 setVariable["original",1,true];	
				player assignAsDriver _plane2;
				player moveInDriver _plane2;
                     		
			}}forEach HeliArray;
		};

		player setVariable["cmoney",_playerMoney - heliStoreCart,false];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		heliStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", heliStoreCart];
		lbClear _cartlist;
		
		
		
	};
	
	//Buy To Heli Pad
	case 1:
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
                _weapon = (configFile >> "cfgVehicles" >> _class);
                
                diag_log format["Adding class %1 of weapon %2 of type %3",_class,_weapon,getNumber(_weapon >> "type")];

				_randomPosPlane = getMarkerPos ("HeliStoreMarker"); //*************************************************TO DO
				_plane2 = createVehicle [_class,[(_randomPosPlane select 0), (_randomPosPlane select 1),0],[], 0, "NONE"];
				_plane2 setdamage 0;
				_plane2 setVariable["original",1,true];		                
                     		
			}}forEach HeliArray;
		};

		player setVariable["cmoney",_playerMoney - heliStoreCart,false];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		heliStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", heliStoreCart];
		lbClear _cartlist;
	};
};
