#include "functions\ckbl.sqf"disableSerialization;_encn=_this select 0;_hcbk=[]call ufnn;uiNamespace setVariable['gearDialog',_encn];(_encn displayCtrl buyGunIDC)ctrlShow false;(_encn displayCtrl buyAmmoIDC)ctrlShow false;(_encn displayCtrl gearPurchaseIDC)ctrlEnable false;seyj=[];[]call hpjj;[(_encn displayCtrl itemsListIDC),[_hcbk,'pistols']call uvzk]call bzai;