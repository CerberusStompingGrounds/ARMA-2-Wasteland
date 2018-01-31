private["_rlhv","_thkz"];tjnd=[_this,0,[0,0,0],[[]],[3]]call jdly;_rlhv='buildingStore'call bdra;{{if(_x select 0=="")then{_x set[0,getText(configFile>>"CfgVehicles">>(_x select 1)>>"displayName")]};true}count(_x select 1);true}count _rlhv;_thkz=["Building Store",_rlhv,{private["_tuuh"];_tuuh=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
			<br />
			<t size='1.2'>%1</t><br />
			<br />
			<t font='Zeppelin33'>Price:</t> %2<br />
			<t font='Zeppelin33'>Size:</t> %3<br />
		",_tuuh select 0,_tuuh select 2,(_tuuh select 1)call b_fnc_fq]},{private["_nzjw","_dvar","_udgl","_bqca","_ujna","_sxyi","_qfse","_pwan"];_nzjw=_this select 0;_dvar=_this select 1;_udgl=_this select 2;_udgl ctrlEnable false;_bqca=[tjnd]call zgxt;{if(_x call b_fnc_rc>0)exitwith{_bqca=_x}}forEach(nearestObjects[tjnd,["All"],5]);if(isNull _bqca)then{_ujna=0;{_ujna=_ujna+(_x select 2)}forEach _nzjw;_dvar ctrlSetStructuredText parseText format["
				<br />
				No container found in the loading<br />
				area. You will only be able to<br />
				purchase one item at a time.<br />
				<br />
				<t font='Zeppelin33'>Money:</t> $%1<br />
				<t font='Zeppelin33'>Purchase Total:</t> $%2<br />
			",[]call pqoo,_ujna];if(count(_this select 0)==1&&([]call pqoo)>=_ujna)then{_udgl ctrlEnable true}}else{_sxyi=_bqca call b_fnc_rc;_qfse=_bqca call b_fnc_we;_pwan=0;_ujna=0;{_pwan=_pwan+((_x select 1)call b_fnc_fq);_ujna=_ujna+(_x select 2)}forEach _nzjw;(_this select 1)ctrlSetStructuredText parseText format["
				<br />
				<t font='Zeppelin33'>Container Size:</t> %1<br />
				<t font='Zeppelin33'>Container Room Used:</t> %2<br />
				<br />
				<t font='Zeppelin33'>Cart Item(s) Size:</t> %3<br />
				<t font='Zeppelin33'>Room left:</t> %4<br />
				<br />
				<t font='Zeppelin33'>Money:</t> $%5<br />
				<t font='Zeppelin33'>Purchase Total:</t> $%6<br />
			",_sxyi,_qfse,_pwan,_sxyi - _qfse - _pwan,[]call pqoo,_ujna];if(_sxyi - _qfse - _pwan>=0&&count _nzjw>0&&([]call pqoo)>=_ujna)then{_udgl ctrlEnable true}}},{private["_bqca","_ecbn","_ujna"];_bqca=[tjnd]call zgxt;_ecbn=[];_ujna=0;{_ecbn set[_foreachindex,_x select 1];_ujna=_ujna+(_x select 2)}forEach(_this select 0);if(!isNull _bqca)then{[_ecbn,_bqca]call b_fnc_lw}else{[_ecbn select 0,tjnd,"basePart"]call upgo};_ujna call tziw}]call kqml;