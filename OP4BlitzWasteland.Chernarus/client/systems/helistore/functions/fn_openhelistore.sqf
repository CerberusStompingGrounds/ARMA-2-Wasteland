private["_tkob"];_tkob='heliStore'call trss;{{if(_x select 0=="")then{_x set[0,getText(configFile>>"CfgVehicles">>(_x select 1)>>"displayName")]};true}count(_x select 1);true}count _tkob;["Helicopter Store",_tkob,{private["_jrua"];_jrua=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
<br />
<t size='1.5' align='left'>%1</t>
<t size='1.5' align='right'>$%2</t><br />
<img image='%3' size='8' align='center'/><br />
%4
		",_jrua select 0,_jrua select 2,getText(configFile>>"cfgVehicles">>(_jrua select 1)>>"picture"),getText(configFile>>"cfgVehicles">>(_jrua select 1)>>"Library">>"libTextDesc")]},{private["_ffdb","_oqds","_ccqi","_blso","_pahw"];_ffdb=_this select 0;_oqds=_this select 1;_ccqi=_this select 2;_blso=0;_pahw=[]call apdk;{_blso=_blso+(_x select 2)}forEach _ffdb;_oqds ctrlSetStructuredText parseText format["
<br />
Money: $%1<br />
Total: $%2<br />
<br />
You may only purchase one helicopter at a time. Make sure the pad is clear!
		",_pahw,_blso];if(_pahw>=_blso&&count _ffdb==1)then{_ccqi ctrlEnable true}else{_ccqi ctrlEnable false}},{private["_blso"];_blso=(_this select 0 select 0 select 2);_yhho=(_this select 0 select 0 select 1);_xnxh=(getPosATL player)nearestObject"HeliH";[_yhho,getPosATL _xnxh,"purchase",[_blso,_xnxh],{player reveal(_this select 0);(_this select 1 select 0)call wpoe},"CAN_COLLIDE",false,getDir _xnxh,true]call hjvb}]call kfns;