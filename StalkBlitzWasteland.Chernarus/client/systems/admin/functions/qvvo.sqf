#include "defineDIKCodes.inc"_dkmw={allUnits};if(count _this<=1)exitwith{_lqqa=missionnamespace getvariable['vpud',objnull];if!(isnull _lqqa)exitwith{};createdialog"RscSpectator"};disableserialization;_vbje=[_this,0,"init",[""]]call jdly;_bxej=[_this,1,[],[[]]]call jdly;switch _vbje do{case"Init":{disableserialization;_lvtq=_bxej select 0;rogy=_lvtq;mhan=0;afrl=true;ajoa=true;gxkw=false;oref=[];if(isnil{erhl})then{erhl=[false,false,false]};ouqm=gettext(configfile>>"cfgingameui">>"cursor">>"select");_hwgy=_lvtq;_tfzu=_hwgy displayaddeventhandler["keydown","with uinamespace do {['keyDown',_this,''] call cxwi};"];_cwjl=_hwgy displayaddeventhandler["keyup","with uinamespace do {['keyUp',_this,''] call cxwi};"];_npam=getposatl cameraon;_npam set[2,(_npam select 2)+2];_stxj="camera"camcreate _npam;_stxj cameraeffect["terminate","back"];_stxj setdir direction cameraon;_stxj camCommand"manual off";_stxj camCommand"inertia on";showcinemaborder false;showhud false;missionnamespace setvariable['iivu',[[],[],[],[],[],[],[],[],[],[]]];missionnamespace setvariable['ssvr',["","","","","","","","","",""]];with missionnamespace do{_lkzj=[]call _dkmw;xksb=_stxj;vpud=if(player in _lkzj)then{player}else{if(count _lkzj>0)then{_lkzj select 0}else{objnull}};if!(isnull vpud)then{vehicle vpud switchcamera cameraview}else{[]spawn{with uinamespace do{["keyDown",[displaynull,DIK_RIGHT,false,false,false],""]call cxwi;["keyUp",[displaynull,DIK_RIGHT,false,false,false],""]call cxwi}}}};missionnamespace setvariable["RscStatic_mode",0];if!(erhl select 0)then{erhl set[0,true];with missionnamespace do{}};_pxxk=[position _stxj,vectorup _stxj,vectordir _stxj,velocity _stxj];(rogy displayCtrl 3141)ctrlSetText(name(missionNamespace getVariable'vpud'));waituntil{_lmyp=if!(isnil{missionnamespace getvariable"RscSpectator_allowFreeCam"})then{missionnamespace getvariable"RscSpectator_allowFreeCam"}else{true};if(!ajoa&&!_lmyp)then{["switchView",[false,true],""]call cxwi};_uemi=time+0.1;waituntil{isnull _stxj||time>_uemi};if(isnull _stxj)then{_stxj="camera"camcreate getposatl cameraon;_stxj cameraeffect["internal","back"];_stxj setpos(_pxxk select 0);_stxj setvectordir(_pxxk select 1);_stxj setVectorup(_pxxk select 2);_stxj setvelocity(_pxxk select 3);_stxj camCommand"inertia on";_stxj camCommand"manual on";with missionnamespace do{xksb=_stxj}};_pxxk=[position _stxj,vectordir _stxj,vectorup _stxj,velocity _stxj];isNull _lvtq};showhud true;_lvtq closedisplay 2;_hwgy displayremoveeventhandler["keydown",_tfzu];_hwgy displayremoveeventhandler["keyup",_cwjl];rogy=nil;gxkw=nil;oref=nil;_stxj cameraeffect["terminate","back"];camdestroy _stxj;with missionnamespace do{vpud=nil;xksb=nil};player switchcamera"internal"};case"keyDown":{_key=_bxej select 1;if!(_key in oref)then{oref set[count oref,_key]};_hsgi=(DIK_LCONTROL)in oref;_jvlu=false;_tsya=0;_juzp=false;_stxj=missionnamespace getvariable['xksb',objnull];_dcwk=ajoa;_nhzw={with missionnamespace do{ssvr set[_this,name vpud]}};_zjvf={with missionnamespace do{_yboo=ssvr select _this;_vqli=name vpud;_lkzj=[]call _dkmw;{if(name _x==_yboo&&_yboo!=_vqli)exitwith{_jvlu=true;vpud=_x}}foreach _lkzj}};_ouro={with missionnamespace do{_jmsi=if(_dcwk)then{[_dcwk,name vpud,cameraview]}else{[_dcwk,position xksb,vectordir xksb,vectorup xksb,velocity _stxj]};iivu set[_this,_jmsi]}};_hwtl={_jmsi=(missionnamespace getvariable'iivu')select _this;_dcwk=_jmsi select 0;_zfno=ajoa;_bdbf=str _dcwk!=str _zfno;ajoa=_dcwk;if(_bdbf)then{ajoa=!ajoa};if(_dcwk)then{_yboo=_jmsi select 1;_xqbk=_jmsi select 2;_lkzj=[]call _dkmw;{if(name _x==_yboo)exitwith{_jvlu=true;missionnamespace setvariable['vpud',_x]}}foreach _lkzj;["switchView",[false,_bdbf],""]call cxwi;cameraon switchcamera _xqbk}else{["switchView",[false,_bdbf],""]call cxwi;_oqji=_jmsi select 1;_xjps=_jmsi select 2;_cuxa=_jmsi select 3;_hyty=_jmsi select 4;_stxj camcommand"manual off";_stxj campreparetarget objnull;_stxj camcommitprepared 0;_stxj setpos _oqji;_stxj setvectordir _xjps;_stxj setvectorup _cuxa;_stxj setvelocity _hyty;_stxj camcommand"manual on"}};switch _key do{case(DIK_SPACE):{if!(gxkw)then{["switchView",[_hsgi,true],""]call cxwi;_juzp=true}};case(DIK_LMENU):{if!(gxkw)then{["switchView",[_hsgi,false],""]call cxwi;_juzp=true}};case(DIK_NUMPAD0):{_juzp=!_dcwk};case(DIK_N):{mhan=mhan+1;_lvjk=mhan%3;switch(_lvjk)do{case 0:{camusenvg false;false SetCamUseTi 0};case 1:{camusenvg true;false SetCamUseTi 0};case 2:{camusenvg false;true SetCamUseTi 0};case 3:{camusenvg false;true SetCamUseTi 1}};_juzp=true};case(DIK_LEFT):{_tsya=-1;_jvlu=true;_juzp=true};case(DIK_RIGHT):{_tsya=+1;_jvlu=true;_juzp=true};case(DIK_DOWN):{_tsya=-10;_jvlu=true;_juzp=true};case(DIK_UP):{_tsya=+10;_jvlu=true;_juzp=true};case(DIK_F1):{if(_hsgi)then{0 call _nhzw}else{0 call _zjvf};_juzp=true};case(DIK_F2):{if(_hsgi)then{1 call _nhzw}else{1 call _zjvf};_juzp=true};case(DIK_F3):{if(_hsgi)then{2 call _nhzw}else{2 call _zjvf};_juzp=true};case(DIK_F4):{if(_hsgi)then{3 call _nhzw}else{3 call _zjvf};_juzp=true};case(DIK_F5):{if(_hsgi)then{4 call _nhzw}else{4 call _zjvf};_juzp=true};case(DIK_F6):{if(_hsgi)then{5 call _nhzw}else{5 call _zjvf};_juzp=true};case(DIK_F7):{if(_hsgi)then{6 call _nhzw}else{6 call _zjvf};_juzp=true};case(DIK_F8):{if(_hsgi)then{7 call _nhzw}else{7 call _zjvf};_juzp=true};case(DIK_F9):{if(_hsgi)then{8 call _nhzw}else{8 call _zjvf};_juzp=true};case(DIK_F10):{if(_hsgi)then{9 call _nhzw}else{9 call _zjvf};_juzp=true};case(DIK_1):{if(_hsgi)then{0 call _ouro}else{0 call _hwtl};_juzp=true};case(DIK_2):{if(_hsgi)then{1 call _ouro}else{1 call _hwtl};_juzp=true};case(DIK_3):{if(_hsgi)then{2 call _ouro}else{2 call _hwtl};_juzp=true};case(DIK_4):{if(_hsgi)then{3 call _ouro}else{3 call _hwtl};_juzp=true};case(DIK_5):{if(_hsgi)then{4 call _ouro}else{4 call _hwtl};_juzp=true};case(DIK_6):{if(_hsgi)then{5 call _ouro}else{5 call _hwtl};_juzp=true};case(DIK_7):{if(_hsgi)then{6 call _ouro}else{6 call _hwtl};_juzp=true};case(DIK_8):{if(_hsgi)then{7 call _ouro}else{7 call _hwtl};_juzp=true};case(DIK_9):{if(_hsgi)then{8 call _ouro}else{8 call _hwtl};_juzp=true};case(DIK_0):{if(_hsgi)then{9 call _ouro}else{9 call _hwtl};_juzp=true}};with missionnamespace do{_lkzj=[]call _dkmw;if(_jvlu&&count _lkzj>0)then{_hfyp=_lkzj find vpud;_hfyp=_hfyp+_tsya;_hfyp=((count _lkzj)+_hfyp)%(count _lkzj);vpud=_lkzj select _hfyp;((uiNamespace getVariable'rogy')displayCtrl 3141)ctrlSetText(name vpud);if(_dcwk)then{vehicle vpud switchcamera cameraview}}};_juzp};case"keyUp":{_key=_bxej select 1;oref=oref -[_key]};case"switchView":{_hsgi=_bxej select 0;_gffm=_bxej select 1;_lmyp=if!(isnil{missionnamespace getvariable"RscSpectator_allowFreeCam"})then{missionnamespace getvariable"RscSpectator_allowFreeCam"}else{true};_lqqa=missionnamespace getvariable['vpud',player];if(!_lmyp&&isnull _lqqa)then{_stxj camCommand"manual off";_stxj cameraeffect["terminate","back"];player switchcamera"internal"}else{if!(_gffm)then{ajoa=!ajoa};if(ajoa)then{if(_lmyp)then{if(!_hsgi)then{_fepk=_lqqa selectionposition"pilot";_vyzc=getarray(configfile>>"CfgVehicles">>typeof vehicle _lqqa>>"extCameraPosition");if(count _vyzc!=3)then{_vyzc=[0,0,0]};_novp=[0,0,0];_novp set[0,(_fepk select 0)+(_vyzc select 0)];_novp set[1,(_fepk select 1)+(_vyzc select 2)];_novp set[2,(_fepk select 2)+(_vyzc select 1)];_stxj setpos(_lqqa modeltoworld _novp);_stxj campreparetarget vehicle _lqqa;_stxj camcommitprepared 0};_stxj setvelocity[0,0,0];_stxj camcommand"manual on";_stxj cameraeffect["internal","back"];cameraeffectenablehud true;if(_gffm)then{missionnamespace setvariable["RscStatic_mode",0];("RscSpectator_fade"call bis_fnc_rsclayer)cutrsc["rscstatic","plain"]}else{("RscSpectator_fade"call bis_fnc_rsclayer)cuttext["","black in"]};if!(erhl select 1)then{erhl set[1,true];with missionnamespace do{[["spectating","spectatorfreeview"]]spawn bis_fnc_advhint}}};ajoa=!ajoa}else{if(_gffm)then{_stxj camCommand"manual off";_stxj cameraeffect["terminate","back"];_stxj setvelocity[0,0,0];vehicle _lqqa switchcamera cameraview;if(_lmyp)then{if(_gffm)then{missionnamespace setvariable["RscStatic_mode",0]}else{}};if!(erhl select 2)then{erhl set[2,true];with missionnamespace do{}}};ajoa=!ajoa}}}};