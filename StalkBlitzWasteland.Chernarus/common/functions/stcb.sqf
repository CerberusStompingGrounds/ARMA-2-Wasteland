private["_omxm","_gycz","_zxlj","_eqqh","_kpvy"];_omxm=[_this,0,[],[[]]]call jdly;_gycz=[_this,1,-1,[0]]call jdly;_zxlj=[_this,2,-1,[0]]call jdly;if(_zxlj==-1&&_gycz>=0)then{_zxlj=1;{if(_x select _gycz<_zxlj)then{_zxlj=_x select _gycz}}forEach _omxm};if(_gycz>=0)then{_eqqh=random 1+_zxlj;_kpvy=[];{if(1-(_x select 1)<=_eqqh)then{_kpvy set[count _kpvy,_x]}}count _omxm;_kpvy select floor random count _kpvy}else{_omxm select floor random count _omxm};