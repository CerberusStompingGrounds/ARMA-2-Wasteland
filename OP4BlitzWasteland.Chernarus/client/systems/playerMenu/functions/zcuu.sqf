#include "vbvk.sqf"private["_xcnu","_dvcq","_kven","_vlap"];_xcnu=[_this,0,[],[[]]]call clht;_dvcq=[_this,1,(findDisplay playerMenuDialogIDD),[displayNull]]call clht;_kven=[_dvcq displayCtrl groupBtn1IDC,_dvcq displayCtrl groupBtn2IDC,_dvcq displayCtrl groupBtn3IDC,_dvcq displayCtrl groupBtn4IDC];uqoz=_xcnu;for"_vlap"from 0 to count _kven do{if(_vlap<count _xcnu)then{(_kven select _vlap)ctrlSetText(_xcnu select _vlap select 0);(_kven select _vlap)ctrlShow true}else{(_kven select _vlap)ctrlShow false}};