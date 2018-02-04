#define bountyManagementDialog 55510
#define bountyManagementPlayerList 55511
#define bountyManagementbountyList 55512
#define bountyManagementInviteButton 55514
#define bountyManagementKickButton 55515
#define bountyManagementDisbandButton 55516
#define bountyManagementLeaveButton 55517
#define bountyManagementAcceptButton 55518
#define bountyManagementDeclineButton 55519
#define bountyManagementInviteText 55520
#define bountyManagementInviteButton1 55521
#define bountyManagementInviteButton2 55522 
#define bountyManagementInfoButton 55523

class bountyManagement {

	idd = bountyManagementDialog;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
		
		class MainBG : w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";		
			moving = true;
			x = 0.0; y = 0.1;
			w = 1.35; h = 0.65;
		};
		
		class MainTitle : w_RscText {
			idc = -1;
			text = "Bounty Management";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260; y = 0.112;
			w = 0.3; h = 0.05;
		};

		class InviteTitleText : w_RscText {
			idc = -1;
			text = "Players";
			sizeEx = 0.025;
			shadow = 2;		
			x = 0.0875; y = 0.155;
			w = 0.3; h = 0.050;
		};

		class bountyTitleText : w_RscText {
			idc = -1;
			text = "Player Bounties";
			sizeEx = 0.025;
			shadow = 2;		
			x = 0.5575; y = 0.155;
			w = 0.3; h = 0.050;
		};

		class InviteText: w_RscStructuredText
		{
			idc = bountyManagementInviteText;
			text = "";
			size = 0.025;

			x = 0.255; y = 0.500;
			w = 0.235; h = 0.075;
		};
	};
	
	class controls {

		class PlayerListBox : w_Rsclist {
			idc = bountyManagementPlayerList;
			onLBSelChanged = "[] execVM 'client\systems\bountyStore\playerSelectChange.sqf'";
			x = 0.020; y = 0.200;
			w = 0.235; h = 0.425;
		};

		class bountyListBox : w_Rsclist {
			idc = bountyManagementbountyList;
			x = 0.490; y = 0.200;
			w = 0.435; h = 0.425;
		};

		class CloseButton : w_RscButton {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0; bountyManagmentActive = false;";
			x = 0.02; y = 0.68;
			w = 0.125; h = 0.033 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
		
		class InfoButton : w_RscButton {
			idc = -1;
			text = "Information";
			onButtonClick = "[] execVM 'client\systems\bountyStore\Information.sqf'";
			//x = 0.3075; y = 0.200;
			x = 0.150; y = 0.68;
			w = 0.125; h = 0.033 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};
		
		class InviteButton : w_RscButton {
			idc = bountyManagementInviteButton;
			text = "Set Bounty ($10,000)";
			onButtonClick = "[0] execVM 'client\systems\bountyStore\setBounty.sqf'";
			x = 0.275; y = 0.200;
			w = 0.199; h = 0.033 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};
		class InviteButton1 : w_RscButton {
			idc = bountyManagementInviteButton1;
			text = "Set Bounty ($25,000)";
			onButtonClick = "[1] execVM 'client\systems\bountyStore\setBounty.sqf'";
			x = 0.275; y = 0.300;
			w = 0.199; h = 0.033 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};
		class InviteButton2 : w_RscButton {
			idc = bountyManagementInviteButton2;
			text = "Set Bounty ($50,000)";
			onButtonClick = "[2] execVM 'client\systems\bountyStore\setBounty.sqf'";
			x = 0.275; y = 0.400;
			w = 0.199; h = 0.033 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};		
	};
};