private["_yhix"];_yhix='vehicStore'call trss;{{if(_x select 0=="")then{_x set[0,getText(configFile>>"CfgVehicles">>(_x select 1)>>"displayName")]};true}count(_x select 1);true}count _yhix;["Vehicle Store",_yhix,{private["_cbyd"];_cbyd=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
<br />
<t size='1.5' align='left'>%1</t>
<t size='1.5' align='right'>$%2</t><br />
<img image='%3' size='8' align='center'/><br />
%4
		",_cbyd select 0,_cbyd select 2,getText(configFile>>"cfgVehicles">>(_cbyd select 1)>>"picture"),getText(configFile>>"cfgVehicles">>(_cbyd select 1)>>"Library">>"libTextDesc")]},{private["_fyba","_rols","_sitm","_xxbf","_ttuv"];_fyba=_this select 0;_rols=_this select 1;_sitm=_this select 2;_xxbf=0;_ttuv=[]call apdk;{_xxbf=_xxbf+(_x select 2)}forEach _fyba;_rols ctrlSetStructuredText parseText format["
<br />
Money: $%1<br />
Total: $%2<br />
<br />
You may only purchase one vehicle at a time. Make sure the pad is clear!
		",_ttuv,_xxbf];if(_ttuv>=_xxbf&&count _fyba==1)then{_sitm ctrlEnable true}else{_sitm ctrlEnable false}},{private["_xxbf"];_xxbf=(_this select 0 select 0 select 2);_uwmj=(_this select 0 select 0 select 1);_tnsh=(getPosATL player)nearestObject"HeliHCivil";[_uwmj,getPosATL _tnsh,"purchase",[_xxbf,_tnsh],{player reveal(_this select 0);(_this select 1 select 0)call wpoe},"CAN_COLLIDE",false,getDir _tnsh,true]call hjvb}]call kfns;