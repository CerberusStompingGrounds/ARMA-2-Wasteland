#include "ckbl.sqf"private["_pqyj","_kgso"];_pqyj=[]call pqoo;_kgso=seyj call fped;((uiNamespace getVariable'gearDialog')displayCtrl gearCartInfoIDC)ctrlSetStructuredText parseText format["
Cash: <t align='right'>$%1</t><br />
Loadout Cost: <t align='right'>$%2</t><br />
Total: <t align='right'>$%3</t><br />
",_pqyj,_kgso,_pqyj - _kgso];((uiNamespace getVariable'gearDialog')displayCtrl gearPurchaseIDC)ctrlEnable(_kgso<=_pqyj&&count seyj>0);