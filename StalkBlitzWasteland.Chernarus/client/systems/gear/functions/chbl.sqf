#include "ckbl.sqf"private["_lcwu","_vxtp"];_lcwu=_this;_vxtp=configFile>>(_lcwu select 0)>>(_lcwu select 1);((uiNamespace getVariable'gearDialog')displayCtrl itemInfoIDC)ctrlSetStructuredText parseText format["
<br />
<t align='center'>
<img image='%1' size='5' /><br />
%2<br />
Price: $%3<br />
</t>",getText(_vxtp>>"picture"),getText(_vxtp>>"descriptionShort"),_lcwu call jdme];