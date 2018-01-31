private["_fyoh"];_fyoh='heliStore'call bdra;{{if(_x select 0=="")then{_x set[0,getText(configFile>>"CfgVehicles">>(_x select 1)>>"displayName")]};true}count(_x select 1);true}count _fyoh;["Helicopter Store",_fyoh,{private["_ppas"];_ppas=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
<br />
<t size='1.5' align='left'>%1</t>
<t size='1.5' align='right'>$%2</t><br />
<img image='%3' size='8' align='center'/><br />
%4
		",_ppas select 0,_ppas select 2,getText(configFile>>"cfgVehicles">>(_ppas select 1)>>"picture"),getText(configFile>>"cfgVehicles">>(_ppas select 1)>>"Library">>"libTextDesc")]},{private["_nwll","_vokq","_uuvz","_lhsp","_euuh"];_nwll=_this select 0;_vokq=_this select 1;_uuvz=_this select 2;_lhsp=0;_euuh=[]call pqoo;{_lhsp=_lhsp+(_x select 2)}forEach _nwll;_vokq ctrlSetStructuredText parseText format["
<br />
Money: $%1<br />
Total: $%2<br />
<br />
You may only purchase one helicopter at a time. Make sure the pad is clear!
		",_euuh,_lhsp];if(_euuh>=_lhsp&&count _nwll==1)then{_uuvz ctrlEnable true}else{_uuvz ctrlEnable false}},{private["_lhsp"];_lhsp=(_this select 0 select 0 select 2);_gogn=(_this select 0 select 0 select 1);_rnqo=(getPosATL player)nearestObject"HeliH";[_gogn,getPosATL _rnqo,"purchase",[_lhsp,_rnqo],{player reveal(_this select 0);(_this select 1 select 0)call tziw},"CAN_COLLIDE",false,getDir _rnqo,true]call upgo}]call kqml;