#define ASNUMBER(NUMBER) (if(typeName (NUMBER) != "SCALAR") then {parseNumber (NUMBER)} else {NUMBER})
if(!isServer)exitwith{};[]spawn{brpy=objNull;ybpl=objNull;gvlt=[objNull,objNull];"brpy"addPublicVariableEventHandler{private["_irfy","_kvon","_twjs","_jakr","_bkic","_qizi","_nipz","_items"];_irfy=owner([_this select 1,0,objNull,[player]]call jdly);_kvon=[_this select 1,1,objNull,[objNull]]call jdly;_twjs=[_this select 1,2,"",[""]]call jdly;
#ifdef LOG_LOGGING
diag_log format['Player %1 (#%2) requesting %3 from %4',name(_this select 1 select 0),_irfy,_twjs,_kvon];
#endif
_jakr=objNull;_bkic=_kvon getVariable['LOG_contents',[]];{if(!isNull _jakr)exitwith{};if(!isNil"_x")then{if(typeName _x=="ARRAY")then{if(_x select 0==_twjs)then{if(count _x==2)then{_jakr=[_x select 0,[0,0,0]]call(('createVehicle'call b_fnc_qe)select 1);if(ASNUMBER(_x select 1)==1)then{_bkic set[_foreachindex,"REMOVE"];_bkic=_bkic -["REMOVE"]}else{(_bkic select _foreachindex)set[1,ASNUMBER(_x select 1)-1]}}else{_jakr=[_x select 0,[0,0,0]]call(('createVehicle'call b_fnc_qe)select 1);_jakr setDamage ASNUMBER(_x select 1);clearMagazineCargoGlobal _jakr;clearWeaponCargoGlobal _jakr;_qizi=_x select 2;_nipz=_x select 3;for"_wdwz"from 0 to(count(_qizi select 0))do{_jakr addMagazineCargoGlobal[_qizi select 0 select _wdwz,ASNUMBER(_qizi select 1 select _wdwz)]};for"_wdwz"from 0 to(count(_nipz select 0))do{_jakr addWeaponCargoGlobal[_nipz select 0 select _wdwz,ASNUMBER(_nipz select 1 select _wdwz)]};_jakr setVariable['LOG_contents',_x select 4,true];_bkic set[_foreachindex,"REMOVE"];_bkic=_bkic -["REMOVE"]}}}else{if(typeOf _x==_twjs)then{_x enableSimulation true;_jakr=_x;_bkic set[_foreachindex,nil]}}}}forEach _bkic;_kvon setVariable['LOG_contents',_bkic,true];daqi=_jakr;_irfy publicVariableClient"daqi"};"ybpl"addPublicVariableEventHandler{private["_irfy","_xljx","_slmw"];_xljx=[_this select 1,0,objNull,[objNull]]call jdly;_slmw=[_this select 1,1,[0,0,0],[[]],[3]]call jdly;_irfy=owner _xljx;if(local _xljx)then{_xljx setVelocity _slmw}else{tfyk=[_xljx,_slmw];_irfy publicVariableClient"tfyk"}};"gvlt"addPublicVariableEventHandler{(_this select 1 select 1)setOwner owner(_this select 1 select 0)}};