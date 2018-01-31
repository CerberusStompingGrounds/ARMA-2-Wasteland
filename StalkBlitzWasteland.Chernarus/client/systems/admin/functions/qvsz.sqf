#define DIK_ESCAPE          0x01
#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B
#define DIK_MINUS           0x0C    /* - on main keyboard */
#define DIK_EQUALS          0x0D
#define DIK_BACK            0x0E    /* backspace */
#define DIK_TAB             0x0F
#define DIK_Q               0x10
#define DIK_W               0x11
#define DIK_E               0x12
#define DIK_R               0x13
#define DIK_T               0x14
#define DIK_Y               0x15
#define DIK_U               0x16
#define DIK_I               0x17
#define DIK_O               0x18
#define DIK_P               0x19
#define DIK_LBRACKET        0x1A
#define DIK_RBRACKET        0x1B
#define DIK_RETURN          0x1C    /* Enter on main keyboard */
#define DIK_LCONTROL        0x1D
#define DIK_A               0x1E
#define DIK_S               0x1F
#define DIK_D               0x20
#define DIK_F               0x21
#define DIK_G               0x22
#define DIK_H               0x23
#define DIK_J               0x24
#define DIK_K               0x25
#define DIK_L               0x26
#define DIK_SEMICOLON       0x27
#define DIK_APOSTROPHE      0x28
#define DIK_GRAVE           0x29    /* accent grave */
#define DIK_LSHIFT          0x2A
#define DIK_BACKSLASH       0x2B
#define DIK_Z               0x2C
#define DIK_X               0x2D
#define DIK_C               0x2E
#define DIK_V               0x2F
#define DIK_B               0x30
#define DIK_N               0x31
#define DIK_M               0x32
#define DIK_COMMA           0x33
#define DIK_PERIOD          0x34    /* . on main keyboard */
#define DIK_SLASH           0x35    /* / on main keyboard */
#define DIK_RSHIFT          0x36
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_LMENU           0x38    /* left Alt */
#define DIK_SPACE           0x39
#define DIK_CAPITAL         0x3A
#define DIK_F1              0x3B
#define DIK_F2              0x3C
#define DIK_F3              0x3D
#define DIK_F4              0x3E
#define DIK_F5              0x3F
#define DIK_F6              0x40
#define DIK_F7              0x41
#define DIK_F8              0x42
#define DIK_F9              0x43
#define DIK_F10             0x44
#define DIK_NUMLOCK         0x45
#define DIK_SCROLL          0x46    /* Scroll Lock */
#define DIK_NUMPAD7         0x47
#define DIK_NUMPAD8         0x48
#define DIK_NUMPAD9         0x49
#define DIK_SUBTRACT        0x4A    /* - on numeric keypad */
#define DIK_NUMPAD4         0x4B
#define DIK_NUMPAD5         0x4C
#define DIK_NUMPAD6         0x4D
#define DIK_ADD             0x4E    /* + on numeric keypad */
#define DIK_NUMPAD1         0x4F
#define DIK_NUMPAD2         0x50
#define DIK_NUMPAD3         0x51
#define DIK_NUMPAD0         0x52
#define DIK_DECIMAL         0x53    /* . on numeric keypad */
#define DIK_OEM_102         0x56    /* < > | on UK/Germany keyboards */
#define DIK_F11             0x57
#define DIK_NUMPADENTER     0x9C    /* Enter on numeric keypad */
disableserialization;if(count _this<=1)exitwith{_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];if!(isnull _efse)exitwith{};createdialog"RscDisplayCamera"};disableserialization;_nbqh=[_this,0,"Init",[displaynull,""]]call jdly;_this=[_this,1,[]]call jdly;switch _nbqh do{case"Init":{_kdzd=[(position cameraon select 0),(position cameraon select 1),(position cameraon select 2)+2];_efse="camera"camcreate _kdzd;_efse cameraeffect["internal","back"];_efse campreparefov 0.7;_efse camcommitprepared 0;showcinemaborder false;cameraEffectEnableHUD true;vehicle cameraon switchcamera cameraview;missionnamespace setvariable['bis_fnc_camera_cam',_efse];bis_fnc_camera_lmb=false;bis_fnc_camera_rmb=false;bis_fnc_camera_keys=[];bis_fnc_camera_lmbclick=[0,0];bis_fnc_camera_rmbclick=[0,0];bis_fnc_camera_pitchbank=[0,0];bis_fnc_camera_fov=0.7;bis_fnc_camera_iconcamera="";bis_fnc_camera_vision=0;bis_fnc_camera_visiblehud=true;_iuln=true call nsmq;_qmdf=_iuln select(count _iuln - 1);for"_dkez"from 0 to(_qmdf - 1)do{bis_fnc_camera_keys set[_dkez,false]};_kior=_this select 0;bis_fnc_camera_display=_kior;_kior displayaddeventhandler["keydown","with (uinamespace) do {['KeyDown',_this] call raeq;};"];_kior displayaddeventhandler["keyup","with (uinamespace) do {['KeyUp',_this] call raeq;};"];_kior displayaddeventhandler["mousebuttondown","with (uinamespace) do {['MouseButtonDown',_this] call raeq;};"];_kior displayaddeventhandler["mousebuttonup","with (uinamespace) do {['MouseButtonUp',_this] call raeq;};"];_kior displayaddeventhandler["mousezchanged","with (uinamespace) do {['MouseZChanged',_this] call raeq;};"];_uyph=_kior displayctrl 3140;_uyph ctrladdeventhandler["mousemoving","with (uinamespace) do {['Mouse',_this] call raeq;};"];_uyph ctrladdeventhandler["mouseholding","with (uinamespace) do {['Mouse',_this] call raeq;};"];ctrlsetfocus _uyph;cuttext["","plain"];titletext["","plain"];clearradio;enableradio false};case"Mouse":{_kior=ctrlparent(_this select 0);_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_cpgc=bis_fnc_camera_pitchbank;_cebg=_cpgc select 0;_geeq=_cpgc select 1;if(bis_fnc_camera_lmb||bis_fnc_camera_rmb)then{_ajff=_this select 1;_viuz=_this select 2;if(bis_fnc_camera_lmb)then{_vrgo=bis_fnc_camera_lmbclick select 0;_gyma=bis_fnc_camera_lmbclick select 1;_yptm=(getposatl _efse select 2)max 1 min 256;_cqqb=(_ajff - _vrgo)*_yptm/2;_ihph=-(_viuz - _gyma)*_yptm/2;_kdzd=getposasl _efse;_kdzd=[_kdzd,_ihph,direction _efse]call bis_fnc_relpos;_kdzd=[_kdzd,_cqqb,direction _efse+90]call bis_fnc_relpos;_efse setposasl _kdzd}else{_vrgo=bis_fnc_camera_rmbclick select 0;_gyma=bis_fnc_camera_rmbclick select 1;_cqqb=(_ajff - _vrgo)*180;_ihph=-(_viuz - _gyma)*180;if(bis_fnc_camera_keys select DIK_LCONTROL)then{_geeq=(_geeq+_cqqb*0.1)max -180 min+180;bis_fnc_camera_pitchbank set[1,_geeq]}else{_efse setdir(direction _efse+_cqqb);_cebg=(_cebg+_ihph)max -90 min+90};[_efse,_cebg,_geeq]call bis_fnc_setpitchbank;bis_fnc_camera_rmbclick=[_ajff,_gyma]}};_shnu=screentoworld[0.5,0.5];_iymu=getposasl _efse;_cygn=[_shnu select 0,_shnu select 1,getterrainheightasl _shnu];_asak=lineIntersectswith[_iymu,_cygn,objnull,objnull,true];_htbn=_kior displayctrl 31421;_rtai=objnull;if(count _asak>0)then{_vgtl=_kior displayctrl 3142;_rtai=_asak select(count _asak - 1);missionnamespace setvariable['bis_fnc_camera_target',_rtai];_wcgz=boundingbox _rtai;_ibdy=(abs((_wcgz select 0)select 2)+abs((_wcgz select 1)select 2))/2;_lvfg=worldtoscreen[position _rtai select 0,position _rtai select 1,(getposatl _rtai select 2)+_ibdy/2];if(count _lvfg>0)then{_xkds=abs((_wcgz select 0)select 0)+abs((_wcgz select 1)select 0)max abs((_wcgz select 0)select 1)+abs((_wcgz select 1)select 1)max abs((_wcgz select 0)select 2)+abs((_wcgz select 1)select 2);_ohiv=_efse distance _rtai;_kbbl=(_xkds/_ohiv/2)max 0.1;_htbn ctrlsetposition[(_lvfg select 0)- safezoneX -((_kbbl/2)*3/4),(_lvfg select 1)- safezoneY -(_kbbl/2),_kbbl*3/4,_kbbl]}else{missionnamespace setvariable['bis_fnc_camera_target',objnull];_htbn ctrlsetposition[-10,-10,0,0]}}else{missionnamespace setvariable['bis_fnc_camera_target',objnull];_htbn ctrlsetposition[-10,-10,0,0]};_htbn ctrlcommit 0;_xzcw=direction _efse;_mmgr=round(_xzcw/45);_nrka=["str_move_n","str_move_ne","str_move_e","str_move_se","str_move_s","str_move_sw","str_move_w","str_move_nw"]select _mmgr;_nrka=localize _nrka;_oczg=_kior displayctrl 31420;_oczg ctrlsettext("\n\n"+"X = "+str(position _efse select 0)+"\n"+"Y = "+str(position _efse select 1)+"\n"+"Z = "+str(position _efse select 2)+"\n"+"FOV = "+str(bis_fnc_camera_fov)+"\n"+"Dir = "+str(round _xzcw)+"° ("+_nrka+")\n"+"Pitch = "+str(round(_cebg))+"°\n"+"Bank = "+str(round(_geeq)%360)+"°\n"+"bis_fnc_camera_target = "+str(_rtai)+"\n");_lyqy={_cqqb=_this select 0;_ihph=_this select 1;_jlhw=_this select 2;_shnu=getposasl _efse;_aapj=(direction _efse)+_cqqb*90;_kdzd=[(_shnu select 0)+((sin _aapj)*_bohg*_ihph),(_shnu select 1)+((cos _aapj)*_bohg*_ihph),(_shnu select 2)+_jlhw*_bohg];_kdzd set[2,(_kdzd select 2)max(getterrainheightasl _kdzd)];_efse setposasl _kdzd};_bxyk={_cqqb=_this select 0;_ihph=_this select 1;_cpgc=_efse call bis_fnc_getpitchbank;_efse setdir(direction _efse+_cqqb);[_efse,(_cpgc select 0)+_ihph,0]call bis_fnc_setpitchbank};_bohg=0.1;if(bis_fnc_camera_keys select DIK_LMENU)then{_bohg=_bohg*100};if(bis_fnc_camera_keys select DIK_LSHIFT)then{_bohg=_bohg*10};if(bis_fnc_camera_keys select DIK_RSHIFT)then{_bohg=_bohg/10};if(bis_fnc_camera_keys select DIK_W)then{[0,1,0]call _lyqy};if(bis_fnc_camera_keys select DIK_S)then{[0,-1,0]call _lyqy};if(bis_fnc_camera_keys select DIK_A)then{[-1,1,0]call _lyqy};if(bis_fnc_camera_keys select DIK_D)then{[1,1,0]call _lyqy};if(bis_fnc_camera_keys select DIK_Q)then{[0,0,1]call _lyqy};if(bis_fnc_camera_keys select DIK_Z)then{[0,0,-1]call _lyqy};if(bis_fnc_camera_keys select DIK_NUMPAD1)then{[-1,-1]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD1)then{[-1,-1]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD2)then{[+0,-1]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD3)then{[+1,-1]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD4)then{[-1,+0]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD6)then{[+1,+0]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD7)then{[-1,+1]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD8)then{[+0,+1]call _bxyk};if(bis_fnc_camera_keys select DIK_NUMPAD9)then{[+1,+1]call _bxyk};if(bis_fnc_camera_keys select DIK_ADD)then{bis_fnc_camera_fov=(bis_fnc_camera_fov - 0.01)max 0.01;_efse campreparefov bis_fnc_camera_fov;_efse camcommitprepared 0};if(bis_fnc_camera_keys select DIK_SUBTRACT)then{bis_fnc_camera_fov=(bis_fnc_camera_fov+0.01)min 1;_efse campreparefov bis_fnc_camera_fov;_efse camcommitprepared 0}};case"MouseButtonDown":{_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_wofu=_this select 1;_ajff=_this select 2;_viuz=_this select 3;_fpdc=_this select 4;_tgyc=_this select 5;_qjpv=_this select 6;if(_wofu>0)then{bis_fnc_camera_rmb=true;bis_fnc_camera_rmbclick=[_ajff,_viuz]}else{bis_fnc_camera_lmb=true;bis_fnc_camera_lmbclick=[_ajff,_viuz]};bis_fnc_camera_pitchbank=_efse call bis_fnc_getpitchbank};case"MouseButtonUp":{_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_wofu=_this select 1;if(_wofu>0)then{bis_fnc_camera_rmb=false;bis_fnc_camera_rmbclick=[0,0]}else{bis_fnc_camera_lmb=false;bis_fnc_camera_lmbclick=[0,0]};bis_fnc_camera_pitchbank=_efse call bis_fnc_getpitchbank};case"MouseZChanged":{_kior=_this select 0;_hzcz=_kior displayctrl 3141;if!(ctrlenabled _hzcz)then{_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_mpuu=vectordir _efse;_jlhw=(_this select 1)*10;_gwcv=(_mpuu select 0)*_jlhw;_itcz=(_mpuu select 1)*_jlhw;_sewv=(_mpuu select 2)*_jlhw;_kdzd=getposasl _efse;_kdzd=[(_kdzd select 0)+_gwcv,(_kdzd select 1)+_itcz,(_kdzd select 2)+_sewv];_kdzd set[2,(_kdzd select 2)max(getterrainheightasl _kdzd)];_efse setposasl _kdzd}};case"KeyDown":{_kior=_this select 0;_key=_this select 1;_fpdc=_this select 2;_tgyc=_this select 3;_qjpv=_this select 4;_ozai=false;bis_fnc_camera_keys set[_key,true];_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_cxrj={_zukq=profilenamespace getvariable["BIS_fnc_camera_positions",[]];if(_tgyc)then{_zukq set[_this,_kzvo];profilenamespace setvariable["BIS_fnc_camera_positions",_zukq];saveprofilenamespace;_kior call nnxf}else{_vdny=_zukq select _this;if!(isnil"_vdny")then{["Paste",_vdny]call raeq}};_ozai=true};_kzvo=[worldname,position _efse,direction _efse,bis_fnc_camera_fov,bis_fnc_camera_pitchbank,sliderposition(_kior displayctrl 31430),sliderposition(_kior displayctrl 31432),sliderposition(_kior displayctrl 31434),sliderposition(_kior displayctrl 31436),sliderposition(_kior displayctrl 31438)];switch(_key)do{case(DIK_1):{1 call _cxrj};case(DIK_2):{2 call _cxrj};case(DIK_3):{3 call _cxrj};case(DIK_4):{4 call _cxrj};case(DIK_5):{5 call _cxrj};case(DIK_6):{6 call _cxrj};case(DIK_7):{7 call _cxrj};case(DIK_8):{8 call _cxrj};case(DIK_9):{9 call _cxrj};case(DIK_0):{0 call _cxrj};case(DIK_F1):{_kior createdisplay"RscDisplayDebugPublic";_mzgx=true};case(DIK_NUMPAD5):{bis_fnc_camera_pitchbank=[0,0];[0,0]call _bxyk;bis_fnc_camera_fov=0.7;_kdzd=position _efse;_xzcw=direction _efse;_efse cameraeffect["terminate","back"];camdestroy _efse;_efse="camera"camcreate _kdzd;_efse cameraeffect["internal","back"];_efse setdir _xzcw;missionnamespace setvariable['bis_fnc_camera_cam',_efse]};case(DIK_M):{_uyph=_kior displayctrl 3140;_hzcz=_kior displayctrl 3141;if(ctrlenabled _hzcz)then{_uyph ctrlenable true;_hzcz ctrlenable false;ctrlsetfocus _hzcz;_hzcz ctrlsetposition[-10,-10,0.8*safezoneW,0.8*safezoneH];_hzcz ctrlcommit 0}else{_uyph ctrlenable false;_hzcz ctrlenable true;ctrlsetfocus _hzcz;_whqi=[safezoneX+0.1*safezoneW,safezoneY+0.1*safezoneH,0.8*safezoneW,0.8*safezoneH];_hzcz ctrlsetposition _whqi;_hzcz ctrlcommit 0;_hzcz ctrlmapanimadd[0,0.1,position _efse];ctrlmapanimcommit _hzcz;{player reveal[_x,4]}foreach allunits}};case(DIK_H);case(DIK_L):{_jfve=[_kior displayctrl 3142,_kior displayctrl 3143];if(bis_fnc_camera_visiblehud)then{{_x ctrlsetfade 1}foreach _jfve;(_kior displayctrl 3142)ctrlenable false;cameraEffectEnableHUD false}else{{_x ctrlsetfade 0}foreach _jfve;(_kior displayctrl 3142)ctrlenable true;cameraEffectEnableHUD true};bis_fnc_camera_visiblehud=!bis_fnc_camera_visiblehud;{_x ctrlcommit 0.1}foreach _jfve};case(DIK_X):{if(_tgyc)then{["Paste",_kzvo]spawn{copytoclipboard format["%1 call raeq;",_this]}}};case(DIK_C):{if(_tgyc)then{_kzvo spawn{copytoclipboard format["%1",_this]}}};case(DIK_V):{if(_tgyc)then{_pawf=call compile copyfromclipboard;if(typename _pawf==typename[])then{_pawf=[[_pawf],0,[],[[]],[10]]call tylb;if(count _pawf==10)then{["Paste",_pawf]call raeq}else{["Wrong format of camera params (""%1"")",copyfromclipboard]call bis_fnc_error}}}};case(DIK_N):{bis_fnc_camera_vision=bis_fnc_camera_vision+1;_cusu=bis_fnc_camera_vision%4;switch(_cusu)do{case 0:{camusenvg false;false SetCamUseTi 0};case 1:{camusenvg true;false SetCamUseTi 0};case 2:{camusenvg false;true SetCamUseTi 0};case 3:{camusenvg false;true SetCamUseTi 1}}};case(DIK_P):{if(_tgyc)then{if(cheatsenabled)then{_slxq=format(["SplendidCamera\%1_['%2',%3,%4,%5,%6,%7,%8,%9,%10,%11].png",profilename]+_kzvo);_slxq call compile"diag_screenshot _this;"}}};case(DIK_ESCAPE):{["Exit",[]]call raeq};default{}};_ozai};case"KeyUp":{bis_fnc_camera_keys set[_this select 1,false]};case"MapDraw":{_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_hzcz=_this select 0;_hzcz drawIcon[bis_fnc_camera_iconcamera,[0,1,1,1],position _efse,32,32,direction _efse,"",1]};case"MapClick":{_hzcz=_this select 0;_wofu=_this select 1;_aqka=_this select 2;_mvrr=_this select 3;if(_wofu==0)then{_saqv=_hzcz ctrlmapscreentoworld[_aqka,_mvrr];_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_efse setpos[_saqv select 0,_saqv select 1,getposatl _efse select 2]}};case"Paste":{_this spawn{disableserialization;[]call raeq;waituntil{!isnil{uinamespace getvariable'bis_fnc_camera_display'}};with uinamespace do{_gtnh=[_this,0,"",[""]]call tylb;if(_gtnh!=worldname)exitwith{["Camera params are for world ""%1"", you're currently on ""%2""",_gtnh,worldname]call bis_fnc_error};_shnu=[_this,1,position player,[[]],[3]]call tylb;_aapj=[_this,2,direction player,[0]]call tylb;_cvps=[_this,3,bis_fnc_camera_fov,[0]]call tylb;_cpgc=[_this,4,[0,0],[[]],[2]]call tylb;_cebg=[_cpgc,0,0,[0]]call tylb;_geeq=[_cpgc,1,0,[0]]call tylb;_kior=uinamespace getvariable['bis_fnc_camera_display',displaynull];_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_efse setpos _shnu;_efse setdir _aapj;bis_fnc_camera_fov=_cvps;[_efse,_cebg,_geeq]call bis_fnc_setpitchbank;_efse campreparefov bis_fnc_camera_fov;_efse camcommitprepared 0;bis_fnc_camera_pitchbank=_cpgc}}};case"Exit":{with missionnamespace do{_efse=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_efse cameraeffect["terminate","back"];camdestroy _efse;bis_fnc_camera_cam=nil;bis_fnc_camera_target=nil};bis_fnc_camera_display=nil;bis_fnc_camera_lmb=nil;bis_fnc_camera_rmb=nil;bis_fnc_camera_keys=nil;bis_fnc_camera_lmbclick=nil;bis_fnc_camera_rmbclick=nil;bis_fnc_camera_pitchbank=nil;bis_fnc_camera_fov=nil;bis_fnc_camera_iconcamera=nil;bis_fnc_camera_vision=nil;bis_fnc_camera_visiblehud=nil;camusenvg false;false SetCamUseTi 0;setacctime 1;setaperture -1;enableradio true;if((productVersion select 4)=="Development")then{_ogya=[]call(uinamespace getvariable"bis_fnc_displayMission");_okfb=_ogya displayctrl 11400;_okfb ctrlsetfade 0;_okfb ctrlcommit 0}}};