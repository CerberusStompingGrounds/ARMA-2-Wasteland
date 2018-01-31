#include "ckbl.sqf"disableSerialization;private["_kjdr"];_kjdr=[_this,0,findDisplay playerMenuDialogIDD,[displayNull]]call jdly;(_kjdr displayCtrl infoTextIDC)ctrlSetStructuredText parseText format["
<t align='left'>Server Uptime</t> <t align='right'>%1</t><br />
<t align='left'>Blufor Players</t> <t align='right'>%2</t><br />
<t align='left'>Indy Players</t> <t align='right'>%3</t><br />
<t align='left'>Money</t> <t align='right'>$%4</t><br />
",[wqav/60/60]call bis_fnc_timetostring,{side _x==west}count playableUnits,{side _x==resistance||side _x==sideEnemy}count playableUnits,[]call pqoo];