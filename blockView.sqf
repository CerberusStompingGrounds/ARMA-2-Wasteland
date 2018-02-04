while {alive player} do {
	if(cameraView == "GROUP") then {
		vehicle player switchCamera "EXTERNAL";
		player globalchat "Commander view disabled";	
	};
	sleep 1;
};