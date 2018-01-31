#include "vbvk.sqf"private["_bxvt","_fkbg"];_bxvt=[]call apdk;_fkbg=psgj call jmin;((uiNamespace getVariable'gearDialog')displayCtrl gearCartInfoIDC)ctrlSetStructuredText parseText format["
Cash: <t align='right'>$%1</t><br />
Loadout Cost: <t align='right'>$%2</t><br />
Total: <t align='right'>$%3</t><br />
",_bxvt,_fkbg,_bxvt - _fkbg];((uiNamespace getVariable'gearDialog')displayCtrl gearPurchaseIDC)ctrlEnable(_fkbg<=_bxvt&&count psgj>0);