#include "vbvk.sqf"blec=missionNamespace getVariable['blec',[]];yfqf=missionNamespace getVariable['yfqf',false];blec set[count blec,_this];if(typeName yfqf=="BOOL")then{yfqf=[]spawn{disableSerialization;private["_wwya","_qjpn","_sbsk","_afqv","_enqf"];while{count blec>0}do{_enqf=blec select 0;blec set[0,"REMOVE"];blec=blec -["REMOVE"];_wwya=[_enqf,0,"",[""]]call clht;_qjpn=[_enqf,1,[1,1,1,1],[[]],[4]]call clht;_sbsk=[_enqf,2,"",[""]]call clht;_afqv=[_enqf,3,5,[0]]call clht;_vaji=uiNamespace getVariable'HUD';_jwfw=_vaji displayCtrl HUDnotificationIDC;_afai=_vaji displayCtrl HUDnotificationTextIDC;_pgbb=_vaji displayCtrl HUDnotificationIconIDC;_pgbb ctrlSetText _wwya;_pgbb ctrlSetTextColor _qjpn;_afai ctrlSetStructuredText parseText _sbsk;_jwfw ctrlSetFade 1;_afai ctrlSetFade 1;_pgbb ctrlSetFade 1;_jwfw ctrlCommit 0;_afai ctrlCommit 0;_pgbb ctrlCommit 0;_jwfw ctrlShow true;_afai ctrlShow true;_pgbb ctrlShow true;_jwfw ctrlSetFade 0;_afai ctrlSetFade 0;_pgbb ctrlSetFade 0;_jwfw ctrlCommit 1;_afai ctrlCommit 1;_pgbb ctrlCommit 1;sleep _afqv;_jwfw ctrlSetFade 1;_afai ctrlSetFade 1;_pgbb ctrlSetFade 1;_jwfw ctrlCommit 1;_afai ctrlCommit 1;_pgbb ctrlCommit 1;sleep 2;_jwfw ctrlShow false;_afai ctrlShow false;_pgbb ctrlShow false};yfqf=false}};