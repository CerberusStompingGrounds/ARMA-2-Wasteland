#include "planestoreDefines.sqf"

class planeshopd {

	idd = planeshop_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] execVM 'client\systems\planeStore\populateplaneStore.sqf'";

	class controlsBackground {
		
		class MainBackground: w_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";

			x = 0.1875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.837499 * safezoneW;
			h = 0.661111 * safezoneH;
		};
		
		class ItemSelectedPicture: w_RscPicture
		{
			idc = planeshop_plane_pic;
			text = "";

			x = 0.502604 * safezoneW + safezoneX;
			y = 0.236111 * safezoneH + safezoneY;
			w = 0.0891668 * safezoneW;
			h = 0.0753702 * safezoneH;
		};

		class ItemSelectedInfo: w_RscStructuredText
		{
			idc = planeshop_plane_Info;
			text = "";

			x = 0.440104 * safezoneW + safezoneX;
			y = 0.50463 * safezoneH + safezoneY;
			w = 0.214166 * safezoneW;
			h = 0.192963 * safezoneH;
		};

		class ItemSelectedPrice: w_RscStructuredText
		{
			idc = planeshop_plane_TEXT;
			text = "";

			x = 0.502604 * safezoneW + safezoneX;
			y = 0.317594 * safezoneH + safezoneY;
			w = 0.0891667 * safezoneW;
			h = 0.068889 * safezoneH;
		};

		class DialogTitleText: w_RscText
		{
			idc = -1;
			text = "plane Store Menu";

			x = 0.203125 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};

		class PlayerMoneyText: w_RscText
		{
			idc = planeshop_money;
			text = "Cash:";

			x = 0.6875 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};

		class CartTotalText: w_RscText
		{
			idc = planeshop_total;
			text = "Total: $0";

			x = 0.6875 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};
	};
	
	class controls {
		
		class SelectionList: w_RscListbox
		{
			idc = planeshop_plane_list;
			onLBSelChanged = "[] execvm 'client\systems\planeStore\planeInfo.sqf'";

			x = 0.3125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0916666 * safezoneW;
			h = 0.422222 * safezoneH;
		};

		class CartList: w_RscListbox
		{
			idc = planeshop_cart;
			onLBSelChanged = "[] execvm 'client\systems\planeStore\planeInfo.sqf'";

			x = 0.690104 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0916666 * safezoneW;
			h = 0.422222 * safezoneH;
		};

		class AddToCart: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\planeStore\addToCart.sqf'";
			text = "Add";

			x = 0.515625 * safezoneW + safezoneX;
			y = 0.375 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;

		};

		class RemoveFromCart: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\planeStore\removeFromCart.sqf'";
			text = "Remove";

			x = 0.515625 * safezoneW + safezoneX;
			y = 0.425 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;

		};

		class BuyToCrate: w_RscButton
		{
			idc = -1;
			onButtonClick = "[1] execVM 'client\systems\planeStore\buyplanes.sqf'";
			text = "Buy to plane Pad";

			x = 0.609375 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.088 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.1,0.95,0.1,1};

		};

		class BuyToPlayer: w_RscButton
		{
			idc = -1;
			onButtonClick = "[0] execVM 'client\systems\planeStore\buyplanes.sqf'";
			text = "Buy to plane Pad and take pilot seat";

			x = 0.703125 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.1,0.95,0.1,1};

		};

		class BuySellEquipment: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\planeStore\sellWeapon.sqf'";
			text = "Sell Current Weapon";

			x = 0.40625 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.096 * safezoneW;
			h = 0.040 * safezoneH;

		};

		class CancelButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Cancel";

			x = 0.203125 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.072 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.95,0.1,0.1,1};

		};

		class StoreButton0: w_RscButton
		{
			idc = -1;
			onButtonClick = "[0] execVM 'client\systems\planeStore\populateplaneStore.sqf'";
			text = "Choppers";

			x = 0.203125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.088 * safezoneW;
			h = 0.040 * safezoneH;
	
		};		
	};
};