['fuelFull','Fuel Can (Full)','Fuel_can',[],{private["_kmar","_uvbj"];_kmar=nearestObjects[getPosATL player,["LandVehicle","Air"],10];if(count _kmar==0)then{hint'Unable to find vehicle to refuel!'}else{_uvbj=_kmar select 0;if(cursorTarget in _kmar)then{_uvbj=cursorTarget};if(local _uvbj)then{[5,"Refueling Vehicle %1",[_uvbj],{(_this select 0)setFuel 1;['fuelFull']call tfyi;['fuelEmpty']call xpip}]call byng}else{hint"You need to enter and exit the vehicle before refueling."}}}]call xwjs;