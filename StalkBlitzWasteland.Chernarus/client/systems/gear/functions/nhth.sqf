#include "ckbl.sqf"private["_vjmx","_bwzw"];_vjmx=[]call pqoo;_bwzw=zqht call fped;((uiNamespace getVariable'gearDialog')displayCtrl gearCartInfoIDC)ctrlSetStructuredText parseText format["
Cash: <t align='right'>$%1</t><br />
Loadout Cost: <t align='right'>$%2</t><br />
Total: <t align='right'>$%3</t><br />
",_vjmx,_bwzw,_vjmx - _bwzw];