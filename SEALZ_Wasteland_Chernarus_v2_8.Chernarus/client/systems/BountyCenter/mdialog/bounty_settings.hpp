#include "bounty_sys.sqf"

class bountySettings {

	idd = bountysys_DIALOG;
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
			text = "Bounty Information";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260; y = 0.112;
			w = 0.3; h = 0.05;
		};
		
	};
	
	class controls {
	//X = SIDEWAYS
	//y = UP AND DOWN
		class bountyListBox : w_Rsclist {
			idc = bountyManagementbountyList;
			//x = 0.490; y = 0.200;
			x = 0.020; y = 0.200;
			w = 0.670; h = 0.425;
		};
		
	
	};	
};