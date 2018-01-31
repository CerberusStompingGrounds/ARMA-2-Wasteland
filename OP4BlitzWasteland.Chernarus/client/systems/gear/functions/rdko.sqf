#include "vbvk.sqf"private["_krar","_mvkv"];_krar=_this;_mvkv=configFile>>(_krar select 0)>>(_krar select 1);((uiNamespace getVariable'gearDialog')displayCtrl itemInfoIDC)ctrlSetStructuredText parseText format["
<br />
<t align='center'>
<img image='%1' size='5' /><br />
%2<br />
Price: $%3<br />
</t>",getText(_mvkv>>"picture"),getText(_mvkv>>"descriptionShort"),_krar call vcxu];