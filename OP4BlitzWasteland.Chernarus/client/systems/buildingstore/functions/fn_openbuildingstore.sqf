private["_ybns","_ncxo"];sjga=[_this,0,[0,0,0],[[]],[3]]call clht;_ybns='buildingStore'call trss;{{if(_x select 0=="")then{_x set[0,getText(configFile>>"CfgVehicles">>(_x select 1)>>"displayName")]};true}count(_x select 1);true}count _ybns;_ncxo=["Building Store",_ybns,{private["_caca"];_caca=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
			<br />
			<t size='1.2'>%1</t><br />
			<br />
			<t font='Zeppelin33'>Price:</t> %2<br />
			<t font='Zeppelin33'>Size:</t> %3<br />
		",_caca select 0,_caca select 2,(_caca select 1)call u_fnc_ic]},{private["_xxym","_nhnx","_uqxk","_dtin","_ddcy","_jogt","_pdvm","_pjvh"];_xxym=_this select 0;_nhnx=_this select 1;_uqxk=_this select 2;_uqxk ctrlEnable false;_dtin=[sjga]call dbvd;{if(_x call u_fnc_np>0)exitwith{_dtin=_x}}forEach(nearestObjects[sjga,["All"],5]);if(isNull _dtin)then{_ddcy=0;{_ddcy=_ddcy+(_x select 2)}forEach _xxym;_nhnx ctrlSetStructuredText parseText format["
				<br />
				No container found in the loading<br />
				area. You will only be able to<br />
				purchase one item at a time.<br />
				<br />
				<t font='Zeppelin33'>Money:</t> $%1<br />
				<t font='Zeppelin33'>Purchase Total:</t> $%2<br />
			",[]call apdk,_ddcy];if(count(_this select 0)==1&&([]call apdk)>=_ddcy)then{_uqxk ctrlEnable true}}else{_jogt=_dtin call u_fnc_np;_pdvm=_dtin call u_fnc_mn;_pjvh=0;_ddcy=0;{_pjvh=_pjvh+((_x select 1)call u_fnc_ic);_ddcy=_ddcy+(_x select 2)}forEach _xxym;(_this select 1)ctrlSetStructuredText parseText format["
				<br />
				<t font='Zeppelin33'>Container Size:</t> %1<br />
				<t font='Zeppelin33'>Container Room Used:</t> %2<br />
				<br />
				<t font='Zeppelin33'>Cart Item(s) Size:</t> %3<br />
				<t font='Zeppelin33'>Room left:</t> %4<br />
				<br />
				<t font='Zeppelin33'>Money:</t> $%5<br />
				<t font='Zeppelin33'>Purchase Total:</t> $%6<br />
			",_jogt,_pdvm,_pjvh,_jogt - _pdvm - _pjvh,[]call apdk,_ddcy];if(_jogt - _pdvm - _pjvh>=0&&count _xxym>0&&([]call apdk)>=_ddcy)then{_uqxk ctrlEnable true}}},{private["_dtin","_fqde","_ddcy"];_dtin=[sjga]call dbvd;_fqde=[];_ddcy=0;{_fqde set[_foreachindex,_x select 1];_ddcy=_ddcy+(_x select 2)}forEach(_this select 0);if(!isNull _dtin)then{[_fqde,_dtin]call u_fnc_sw}else{[_fqde select 0,sjga,"basePart"]call hjvb};_ddcy call wpoe}]call kfns;