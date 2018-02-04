//	@file Version: 1.0
//	@file Name: antiCheatClient.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13

while { true } do {
	player enableSimulation true;
	disableUserInput false;

	player hideObject false;
	[nil, player, "loc", rHideObject, false] call RE;

	player removeAllEventHandlers "Killed";
	player removeAllEventHandlers "Respawn";
	player removeAllEventHandlers "handleDamage";

	player addEventHandler["Respawn", { _this call onRespawn; }];
	player addEventHandler["Killed", { _this call onKilled; }];
	player addEventHandler["handleDamage", { _this select 2 }];
	player allowDamage true;

	{
		if(currentWeapon player == _x) exitWith {
			removeAllWeapons player;

			titleText ["", "BLACK IN", 0];
			titleText ["ERROR: User performed an illegal operation.\n\n If the problem persists, contact your system administrator or stop using hacked items.", "BLACK"];
			sleep 10;
			titleFadeOut 10;

			endMission "LOSER";
		};
	} forEach weaponBlackList;

	{
		if ((typeOf (vehicle player)) == _x) then {
			deleteVehicle (vehicle player);
			playSound "IncomingChallenge";

			titleText ["", "BLACK IN", 0];
			titleText ["ERROR: User performed an illegal operation.\n\n If the problem persists, contact your system administrator or stop using hacked items.", "BLACK"];
			sleep 10;
			titleFadeOut 10;
		};
	} forEach vehicleBlacklist;

	sleep 1.0;
};
