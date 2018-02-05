call compile preprocessFileLineNumbers "\x\bl_headless\addons\compile.sqf";

BL_fnc_missionsConfig = compile preprocessFileLineNumbers "\x\bl_headless\addons\config\missions.sqf";
BL_fnc_rareVehiclesConfig = compile preprocessFileLineNumbers "\x\bl_headless\addons\config\rareVehicles.sqf";
BL_fnc_vehicleTownSpawnsConfig = compile preprocessFileLineNumbers "\x\bl_headless\addons\config\vehicleTownSpawns.sqf";

call compile preprocessFileLineNumbers "\x\bl_headless\addons\systems\missions\init.sqf";
call compile preprocessFileLineNumbers "\x\bl_headless\addons\systems\rareVehicleSpawns\init.sqf";
call compile preprocessFileLineNumbers "\x\bl_headless\addons\systems\vehicleTownSpawns\init.sqf";

// http://killzonekid.com/arma-scripting-tutorials-how-to-skip-briefing-screen-in-mp/
[] spawn {
	waitUntil {
		if (!isNull findDisplay 53) exitWith {
			ctrlActivate (findDisplay 53 displayCtrl 1);
			findDisplay 53 closeDisplay 1;
			true
		};
		false
	};
};