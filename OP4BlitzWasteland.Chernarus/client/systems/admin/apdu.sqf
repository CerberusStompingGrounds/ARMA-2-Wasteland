#include "functions\vbvk.sqf"disableSerialization;_gohp=uiNamespace getVariable'adminPanel';_gohp call guen;_xpkp=(_this select 0)lbData(_this select 1);if(typeName bl_adminplayer=="OBJECT")then{_xpkp call{if(_this=="spec")exitwith{["Spectate player",{closeDialog 0;[bl_adminplayer]call smex}]call wxra};if(_this=="freelook")exitwith{["Freelook at player",{[bl_adminplayer]call keuk;closeDialog 0}]call wxra};if(_this=="slay")exitwith{[format["Kill %1 and hide the body.",name bl_adminplayer]]call qljo;["Slay player",{[bl_adminplayer]call kcyx;closeDialog 0}]call wxra};if(_this=="group")exitwith{_sqas=format["Units in %1's group as your client knows about them.<br /><br />",name bl_adminplayer];{_sqas=_sqas+(name _x)+"<br />";true}count(units group bl_adminplayer);[_sqas]call qljo};if(_this=="gear")exitwith{[format["View %1's gear.<br /><br />",name bl_adminplayer]]call qljo;["View Gear",{closeDialog 0;bl_adminplayer action["Gear",objNull]}]call wxra}}}else{bl_adminplayer call{if(_this=="reveal")exitwith{_xpkp call{if(_this=="Man")exitwith{["Toggle Players on map",{fbfr=[player,format['%1 (%2) toggled players on map',name player,getPlayerUID player]];publicVariableServer"fbfr";["Man"]call ufso;closeDialog 0}]call wxra};if(_this=="AllVehicles")exitwith{["Toggle Vehicles on map",{fbfr=[player,format['%1 (%2) toggled vehicles on map',name player,getPlayerUID player]];publicVariableServer"fbfr";["AllVehicles"]call ufso;closeDialog 0}]call wxra};if(_this=="Static")exitwith{["Toggle Base parts on map",{fbfr=[player,format['%1 (%2) toggled base parts on map',name player,getPlayerUID player]];publicVariableServer"fbfr";["Static"]call ufso;closeDialog 0}]call wxra};if(_this=="Reammobox_F")exitwith{["Toggle Ammo boxes on map",{fbfr=[player,format['%1 (%2) toggled ammo boxes on map',name player,getPlayerUID player]];publicVariableServer"fbfr";["Reammobox_F"]call ufso;closeDialog 0}]call wxra};if(_this=="All")exitwith{["Show all types on map",{fbfr=[player,format['%1 (%2) revealed all types on map',name player,getPlayerUID player]];publicVariableServer"fbfr";xhhi=[];["Man"]call ufso;["AllVehicles"]call ufso;["Static"]call ufso;["Reammobox_F"]call ufso;closeDialog 0}]call wxra};if(_this=="Beacons")exitwith{["Show beacons on map",{fbfr=[player,format['%1 (%2) revealed beacons on map',name player,getPlayerUID player]];publicVariableServer"fbfr";xhhi=[];['airBeaconModel'call trss]call ufso;['groundBeaconModel'call trss]call ufso;closeDialog 0}]call wxra};if(_this=="")exitwith{["Hide all types on map",{fbfr=[player,format['%1 (%2) hid all types on map',name player,getPlayerUID player]];publicVariableServer"fbfr";xhhi=[];closeDialog 0}]call wxra}}};if(_this=="missions")exitwith{_zcmo=[];{if((_x select 0 select 0)==_xpkp)exitwith{_zcmo=_x};nil}count(bl_pvar_currenttasks select 2);_vsvz=_zcmo select 3;if(typeName(_vsvz select 0)=="OBJECT")then{_vsvz=getPosATL(_vsvz select 0)};_jvrw=[_vsvz]call kiuw;_nnli=format['%1 of %2',[_vsvz,_jvrw select 1]call knhx,_jvrw select 0];[format['
			%1<br />
			%2<br />
			<br />
			%3<br />',_zcmo select 2 select 1 select 0,_zcmo select 2 select 0 select 0,_zcmo select 0 select 0]]call qljo;zlad=_zcmo select 0 select 0;["Fail Mission",{qdbe=[player,zlad];publicVariableServer"qdbe";closeDialog 0}]call wxra}}};