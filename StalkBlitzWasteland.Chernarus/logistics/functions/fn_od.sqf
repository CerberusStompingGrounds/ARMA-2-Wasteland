private["_pwug","_payu","_nyxs","_rsxo","_oizx","_xwdo","_jkuu","_ffqw","_iarf","_ireh"];_pwug=[_this,0,objNull,[objNull]]call jdly;_payu=[_this,1,objNull,[objNull]]call jdly;_nyxs=[_this,2,true,[true]]call jdly;detach _payu;_rsxo=_pwug call b_fnc_nx;_oizx=_payu call b_fnc_nx;_xwdo=boundingBox _pwug;_jkuu=boundingCenter _pwug;_ffqw=[_payu,0]call b_fnc_sd;if(_nyxs)then{_payu attachTo[_pwug,[0,-((_rsxo select 1)/2+(_oizx select 1)/2),-((_rsxo select 2)/2 -(_oizx select 2)/2)]]}else{_iarf=_pwug modelToWorld[0,0,0];_ireh=_payu modelToWorld[0,0,0];_payu attachTo[_pwug,[0,(_iarf select 1)-(_ireh select 1),-((_rsxo select 2)/2+2)]]};if((_ffqw select 0)>(_ffqw select 1))then{_payu setDir 90};_pwug setVariable['LOG_towedObject',_payu,true];_payu setVariable['LOG_towedTo',_pwug,true];['towedVehicle',[_pwug,_payu]]call b_fnc_xp;_pwug