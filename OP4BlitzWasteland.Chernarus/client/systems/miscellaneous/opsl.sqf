_cthd=vehicle player;while{true}do{waitUntil{sleep 1;_cthd!=vehicle player};_cthd=vehicle player;if(_cthd isKindOf"Air"&&!(_cthd getVariable['haloJumpAdded',false]))then{_cthd setVariable['haloJumpAdded',true];_cthd addAction['<t color="#00a3e1"><img image="client\systems\miscellaneous\icons\halo.paa" /> HALO Jump</t>',"kwmm.sqf",{[]spawn{_cthd=vehicle player;_stut=getDir _cthd;player action['eject',_cthd];waitUntil{(vehicle player)isKindOf"ParachuteBase"};deleteVehicle(vehicle player);waitUntil{(vehicle player)==player};player setDir _stut;player setVelocity velocity _cthd;[player,getPosATL player,_stut]call bplm}},-12,false,true,"","_target == vehicle player"]};waitUntil{sleep 1;_cthd!=vehicle player}};