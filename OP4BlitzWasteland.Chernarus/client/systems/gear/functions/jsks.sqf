#include "vbvk.sqf"private["_ghwq","_rhks"];_ghwq=[]call apdk;_rhks=ieex call jmin;((uiNamespace getVariable'gearDialog')displayCtrl gearCartInfoIDC)ctrlSetStructuredText parseText format["
Cash: <t align='right'>$%1</t><br />
Loadout Cost: <t align='right'>$%2</t><br />
Total: <t align='right'>$%3</t><br />
<br />
<br />
TWS SNIPERS, HEAVY ROCKETS AVAILABLE AT GUNSTORES! <t align='left'></t><br />
",_ghwq,_rhks,_ghwq - _rhks];