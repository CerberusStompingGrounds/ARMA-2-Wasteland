class CfgPatches
{
	class ADDON
	{
		units[] = {};
		requiredAddons[] = {};
		author[] = {"DJRanger"};
		authorUrl = "http://djranger.com";
	};
};

class Extended_PreInit_EventHandlers {
	BL_Headless_PreInit = "BL_HeadlessAddon = true;";
};