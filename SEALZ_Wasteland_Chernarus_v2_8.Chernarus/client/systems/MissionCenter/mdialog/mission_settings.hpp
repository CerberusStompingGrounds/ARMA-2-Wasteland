#include "mission_sys.sqf"

class missionSettings {

	idd = missionsys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'client\systems\MissionCenter\mission_list.sqf'";
	
	class controlsBackground {
		
		class MainBG : w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";		
			moving = true;
			x = 0.0; y = 0.1;
			w = 1.0; h = 0.65;
		};
		
		class MainTitle : w_RscText {
			idc = -1;
			text = "Mission Information";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260; y = 0.112;
			w = 0.3; h = 0.05;
		};
		
	};
	
	class controls {
	//X = SIDEWAYS
	//y = UP AND DOWN
	
		class lightMissionIcon : w_RscPicture {	
	  		idc = lightMission_icon;
        	text = "";
        	x = 0.02; y = 0.19;
			w = 0.10; h = 0.10;
		};
		
		class lightMissionText : w_RscText {
			idc = lightMission_text;
			text = "";
			sizeEx = 0.03;
			x = 0.15; y = 0.22;
			w = 0.9; h = 0.05;
		};
		
		class heavyMissionIcon : w_RscPicture {	
	  		idc = heavyMission_icon;
        	text = "";
        	x = 0.02; y = 0.30;
			w = 0.10; h = 0.10;
		};		
		
		class heavyMissionText : w_RscText {	
			idc = heavyMission_text;
			sizeEx = 0.03;
			text = "";
			x = 0.15; y = 0.33;
			w = 0.9; h = 0.05;
		};
		
		class heli1MissionIcon : w_RscPicture {	
	  		idc = Heli1Mission_icon;
        	text = "";
        	x = 0.02; y = 0.41;
			w = 0.10; h = 0.10;
		};		
		
		class Heli1MissionText : w_RscText {	
			idc = Heli1Mission_text;
			text = "";
			sizeEx = 0.03;
			x = 0.15; y = 0.44;
			w = 0.9; h = 0.05;
		};

		class AirMissionIcon : w_RscPicture {	
	  		idc = AirMission_icon;
        	text = "";
        	x = 0.02; y = 0.52;
			w = 0.10; h = 0.10;
		};
		
		class AirMissionText : w_RscText {	
			idc = AirMission_text;
			sizeEx = 0.03;
			text = "";
			x = 0.15; y = 0.55;
			w = 0.9; h = 0.05;
		};
		
	
	};	
};