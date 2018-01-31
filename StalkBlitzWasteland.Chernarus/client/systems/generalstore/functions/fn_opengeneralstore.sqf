private["_szqm"];_szqm=[[]call awsb,'items']call uvzk;["General Store",_szqm,{private["_hedh"];_hedh=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
			<br />
			<t size='1.2'>%1</t><br />
			<t font='Zeppelin33'>Price:</t> $%2<br />
			<br />
			%3
		",_hedh select 0,_hedh select 1,_hedh select 2]},{private["_uzcv","_jplc","_fnfs","_acxi","_kaug"];_uzcv=_this select 0;_jplc=_this select 1;_fnfs=_this select 2;_acxi=0;_kaug=[]call pqoo;{_acxi=_acxi+(_x select 1)}forEach _uzcv;_jplc ctrlSetStructuredText parseText format["
			<br />
			<t font='Zeppelin33'>Money:</t> $%1<br />
			<t font='Zeppelin33'>Total:</t> $%2<br />
		",_kaug,_acxi];if(_kaug>=_acxi&&count _uzcv>0)then{_fnfs ctrlEnable true}else{_fnfs ctrlEnable false}},{private["_uzcv","_acxi"];_uzcv=_this select 0;_acxi=0;{_acxi=_acxi+(_x select 1);[]call(_x select 3)}forEach _uzcv;_acxi call tziw}]call kqml;