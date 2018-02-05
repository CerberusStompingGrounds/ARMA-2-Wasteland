/*
	Description:
	Waits for player to open their menu and
	disables the abort button until the
	server can save their player.
*/
_menuIDD = getNumber (configFile >> "RscDisplayMPInterrupt" >> "idd");
_abortIDC = getNumber (configFile >> "RscDisplayMPInterrupt" >> "controls" >> "CA_B_Abort" >> "idc");
waitUntil { !isNil "PVAR_playerLoaded" };
waitUntil { simulationEnabled player };

while { true } do {
	waitUntil { !isNull findDisplay _menuIDD };
	((findDisplay _menuIDD) displayCtrl _abortIDC) ctrlEnable false;
	titleText ['Saving player...', 'PLAIN', 0.01];
	PVAR_requestSave = [player, player, true, [] call BL_fnc_getGear];
	publicVariableServer "PVAR_requestSave";
	PVAR_requestSaveDone = false;
	waitUntil { PVAR_requestSaveDone };
	titleText ['Player saved', 'PLAIN', 0.01];
	((findDisplay _menuIDD) displayCtrl _abortIDC) ctrlEnable true;
	waitUntil { isNull findDisplay _menuIDD };
	titleFadeout 0.01;
};