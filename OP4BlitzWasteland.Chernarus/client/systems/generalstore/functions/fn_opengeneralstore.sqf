private["_xrlf"];_xrlf=[[]call quwf,'items']call rewl;["General Store",_xrlf,{private["_bmzg"];_bmzg=_this select 1;(_this select 2)ctrlSetStructuredText parseText format["
			<br />
			<t size='1.2'>%1</t><br />
			<t font='Zeppelin33'>Price:</t> $%2<br />
			<br />
			%3
		",_bmzg select 0,_bmzg select 1,_bmzg select 2]},{private["_ucai","_skhg","_lfvn","_hots","_dwxp"];_ucai=_this select 0;_skhg=_this select 1;_lfvn=_this select 2;_hots=0;_dwxp=[]call apdk;{_hots=_hots+(_x select 1)}forEach _ucai;_skhg ctrlSetStructuredText parseText format["
			<br />
			<t font='Zeppelin33'>Money:</t> $%1<br />
			<t font='Zeppelin33'>Total:</t> $%2<br />
		",_dwxp,_hots];if(_dwxp>=_hots&&count _ucai>0)then{_lfvn ctrlEnable true}else{_lfvn ctrlEnable false}},{private["_ucai","_hots"];_ucai=_this select 0;_hots=0;{_hots=_hots+(_x select 1);[]call(_x select 3)}forEach _ucai;_hots call wpoe}]call kfns;