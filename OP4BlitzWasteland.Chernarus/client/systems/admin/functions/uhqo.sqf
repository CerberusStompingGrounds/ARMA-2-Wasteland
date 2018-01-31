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
disableserialization;if(count _this<=1)exitwith{_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];if!(isnull _okwq)exitwith{};createdialog"RscDisplayCamera"};disableserialization;_usef=[_this,0,"Init",[displaynull,""]]call clht;_this=[_this,1,[]]call clht;switch _usef do{case"Init":{_gkuw=[(position cameraon select 0),(position cameraon select 1),(position cameraon select 2)+2];_okwq="camera"camcreate _gkuw;_okwq cameraeffect["internal","back"];_okwq campreparefov 0.7;_okwq camcommitprepared 0;showcinemaborder false;cameraEffectEnableHUD true;vehicle cameraon switchcamera cameraview;missionnamespace setvariable['bis_fnc_camera_cam',_okwq];bis_fnc_camera_lmb=false;bis_fnc_camera_rmb=false;bis_fnc_camera_keys=[];bis_fnc_camera_lmbclick=[0,0];bis_fnc_camera_rmbclick=[0,0];bis_fnc_camera_pitchbank=[0,0];bis_fnc_camera_fov=0.7;bis_fnc_camera_iconcamera="";bis_fnc_camera_vision=0;bis_fnc_camera_visiblehud=true;_voel=true call sfiv;_uejg=_voel select(count _voel - 1);for"_rhzq"from 0 to(_uejg - 1)do{bis_fnc_camera_keys set[_rhzq,false]};_vycr=_this select 0;bis_fnc_camera_display=_vycr;_vycr displayaddeventhandler["keydown","with (uinamespace) do {['KeyDown',_this] call qeyq;};"];_vycr displayaddeventhandler["keyup","with (uinamespace) do {['KeyUp',_this] call qeyq;};"];_vycr displayaddeventhandler["mousebuttondown","with (uinamespace) do {['MouseButtonDown',_this] call qeyq;};"];_vycr displayaddeventhandler["mousebuttonup","with (uinamespace) do {['MouseButtonUp',_this] call qeyq;};"];_vycr displayaddeventhandler["mousezchanged","with (uinamespace) do {['MouseZChanged',_this] call qeyq;};"];_otzq=_vycr displayctrl 3140;_otzq ctrladdeventhandler["mousemoving","with (uinamespace) do {['Mouse',_this] call qeyq;};"];_otzq ctrladdeventhandler["mouseholding","with (uinamespace) do {['Mouse',_this] call qeyq;};"];ctrlsetfocus _otzq;cuttext["","plain"];titletext["","plain"];clearradio;enableradio false};case"Mouse":{_vycr=ctrlparent(_this select 0);_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_jxxb=bis_fnc_camera_pitchbank;_rrdo=_jxxb select 0;_qbmo=_jxxb select 1;if(bis_fnc_camera_lmb||bis_fnc_camera_rmb)then{_vijl=_this select 1;_ibrl=_this select 2;if(bis_fnc_camera_lmb)then{_gdvl=bis_fnc_camera_lmbclick select 0;_gtap=bis_fnc_camera_lmbclick select 1;_tquw=(getposatl _okwq select 2)max 1 min 256;_bjxn=(_vijl - _gdvl)*_tquw/2;_pqmm=-(_ibrl - _gtap)*_tquw/2;_gkuw=getposasl _okwq;_gkuw=[_gkuw,_pqmm,direction _okwq]call bis_fnc_relpos;_gkuw=[_gkuw,_bjxn,direction _okwq+90]call bis_fnc_relpos;_okwq setposasl _gkuw}else{_gdvl=bis_fnc_camera_rmbclick select 0;_gtap=bis_fnc_camera_rmbclick select 1;_bjxn=(_vijl - _gdvl)*180;_pqmm=-(_ibrl - _gtap)*180;if(bis_fnc_camera_keys select DIK_LCONTROL)then{_qbmo=(_qbmo+_bjxn*0.1)max -180 min+180;bis_fnc_camera_pitchbank set[1,_qbmo]}else{_okwq setdir(direction _okwq+_bjxn);_rrdo=(_rrdo+_pqmm)max -90 min+90};[_okwq,_rrdo,_qbmo]call bis_fnc_setpitchbank;bis_fnc_camera_rmbclick=[_vijl,_gtap]}};_pztp=screentoworld[0.5,0.5];_ecpt=getposasl _okwq;_kaly=[_pztp select 0,_pztp select 1,getterrainheightasl _pztp];_ppol=lineIntersectswith[_ecpt,_kaly,objnull,objnull,true];_cxno=_vycr displayctrl 31421;_zyjd=objnull;if(count _ppol>0)then{_tmvj=_vycr displayctrl 3142;_zyjd=_ppol select(count _ppol - 1);missionnamespace setvariable['bis_fnc_camera_target',_zyjd];_fbkx=boundingbox _zyjd;_naie=(abs((_fbkx select 0)select 2)+abs((_fbkx select 1)select 2))/2;_seeb=worldtoscreen[position _zyjd select 0,position _zyjd select 1,(getposatl _zyjd select 2)+_naie/2];if(count _seeb>0)then{_chqr=abs((_fbkx select 0)select 0)+abs((_fbkx select 1)select 0)max abs((_fbkx select 0)select 1)+abs((_fbkx select 1)select 1)max abs((_fbkx select 0)select 2)+abs((_fbkx select 1)select 2);_qcfi=_okwq distance _zyjd;_upju=(_chqr/_qcfi/2)max 0.1;_cxno ctrlsetposition[(_seeb select 0)- safezoneX -((_upju/2)*3/4),(_seeb select 1)- safezoneY -(_upju/2),_upju*3/4,_upju]}else{missionnamespace setvariable['bis_fnc_camera_target',objnull];_cxno ctrlsetposition[-10,-10,0,0]}}else{missionnamespace setvariable['bis_fnc_camera_target',objnull];_cxno ctrlsetposition[-10,-10,0,0]};_cxno ctrlcommit 0;_fvto=direction _okwq;_knpm=round(_fvto/45);_mxge=["str_move_n","str_move_ne","str_move_e","str_move_se","str_move_s","str_move_sw","str_move_w","str_move_nw"]select _knpm;_mxge=localize _mxge;_jpbl=_vycr displayctrl 31420;_jpbl ctrlsettext("\n\n"+"X = "+str(position _okwq select 0)+"\n"+"Y = "+str(position _okwq select 1)+"\n"+"Z = "+str(position _okwq select 2)+"\n"+"FOV = "+str(bis_fnc_camera_fov)+"\n"+"Dir = "+str(round _fvto)+"° ("+_mxge+")\n"+"Pitch = "+str(round(_rrdo))+"°\n"+"Bank = "+str(round(_qbmo)%360)+"°\n"+"bis_fnc_camera_target = "+str(_zyjd)+"\n");_ewvz={_bjxn=_this select 0;_pqmm=_this select 1;_aexm=_this select 2;_pztp=getposasl _okwq;_vswa=(direction _okwq)+_bjxn*90;_gkuw=[(_pztp select 0)+((sin _vswa)*_drcg*_pqmm),(_pztp select 1)+((cos _vswa)*_drcg*_pqmm),(_pztp select 2)+_aexm*_drcg];_gkuw set[2,(_gkuw select 2)max(getterrainheightasl _gkuw)];_okwq setposasl _gkuw};_uskv={_bjxn=_this select 0;_pqmm=_this select 1;_jxxb=_okwq call bis_fnc_getpitchbank;_okwq setdir(direction _okwq+_bjxn);[_okwq,(_jxxb select 0)+_pqmm,0]call bis_fnc_setpitchbank};_drcg=0.1;if(bis_fnc_camera_keys select DIK_LMENU)then{_drcg=_drcg*100};if(bis_fnc_camera_keys select DIK_LSHIFT)then{_drcg=_drcg*10};if(bis_fnc_camera_keys select DIK_RSHIFT)then{_drcg=_drcg/10};if(bis_fnc_camera_keys select DIK_W)then{[0,1,0]call _ewvz};if(bis_fnc_camera_keys select DIK_S)then{[0,-1,0]call _ewvz};if(bis_fnc_camera_keys select DIK_A)then{[-1,1,0]call _ewvz};if(bis_fnc_camera_keys select DIK_D)then{[1,1,0]call _ewvz};if(bis_fnc_camera_keys select DIK_Q)then{[0,0,1]call _ewvz};if(bis_fnc_camera_keys select DIK_Z)then{[0,0,-1]call _ewvz};if(bis_fnc_camera_keys select DIK_NUMPAD1)then{[-1,-1]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD1)then{[-1,-1]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD2)then{[+0,-1]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD3)then{[+1,-1]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD4)then{[-1,+0]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD6)then{[+1,+0]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD7)then{[-1,+1]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD8)then{[+0,+1]call _uskv};if(bis_fnc_camera_keys select DIK_NUMPAD9)then{[+1,+1]call _uskv};if(bis_fnc_camera_keys select DIK_ADD)then{bis_fnc_camera_fov=(bis_fnc_camera_fov - 0.01)max 0.01;_okwq campreparefov bis_fnc_camera_fov;_okwq camcommitprepared 0};if(bis_fnc_camera_keys select DIK_SUBTRACT)then{bis_fnc_camera_fov=(bis_fnc_camera_fov+0.01)min 1;_okwq campreparefov bis_fnc_camera_fov;_okwq camcommitprepared 0}};case"MouseButtonDown":{_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_yetn=_this select 1;_vijl=_this select 2;_ibrl=_this select 3;_thdr=_this select 4;_eavo=_this select 5;_nniz=_this select 6;if(_yetn>0)then{bis_fnc_camera_rmb=true;bis_fnc_camera_rmbclick=[_vijl,_ibrl]}else{bis_fnc_camera_lmb=true;bis_fnc_camera_lmbclick=[_vijl,_ibrl]};bis_fnc_camera_pitchbank=_okwq call bis_fnc_getpitchbank};case"MouseButtonUp":{_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_yetn=_this select 1;if(_yetn>0)then{bis_fnc_camera_rmb=false;bis_fnc_camera_rmbclick=[0,0]}else{bis_fnc_camera_lmb=false;bis_fnc_camera_lmbclick=[0,0]};bis_fnc_camera_pitchbank=_okwq call bis_fnc_getpitchbank};case"MouseZChanged":{_vycr=_this select 0;_hodk=_vycr displayctrl 3141;if!(ctrlenabled _hodk)then{_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_exsl=vectordir _okwq;_aexm=(_this select 1)*10;_nwra=(_exsl select 0)*_aexm;_ligf=(_exsl select 1)*_aexm;_oueh=(_exsl select 2)*_aexm;_gkuw=getposasl _okwq;_gkuw=[(_gkuw select 0)+_nwra,(_gkuw select 1)+_ligf,(_gkuw select 2)+_oueh];_gkuw set[2,(_gkuw select 2)max(getterrainheightasl _gkuw)];_okwq setposasl _gkuw}};case"KeyDown":{_vycr=_this select 0;_key=_this select 1;_thdr=_this select 2;_eavo=_this select 3;_nniz=_this select 4;_fyhr=false;bis_fnc_camera_keys set[_key,true];_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_ugte={_oerg=profilenamespace getvariable["BIS_fnc_camera_positions",[]];if(_eavo)then{_oerg set[_this,_pdoz];profilenamespace setvariable["BIS_fnc_camera_positions",_oerg];saveprofilenamespace;_vycr call zkwm}else{_kftl=_oerg select _this;if!(isnil"_kftl")then{["Paste",_kftl]call qeyq}};_fyhr=true};_pdoz=[worldname,position _okwq,direction _okwq,bis_fnc_camera_fov,bis_fnc_camera_pitchbank,sliderposition(_vycr displayctrl 31430),sliderposition(_vycr displayctrl 31432),sliderposition(_vycr displayctrl 31434),sliderposition(_vycr displayctrl 31436),sliderposition(_vycr displayctrl 31438)];switch(_key)do{case(DIK_1):{1 call _ugte};case(DIK_2):{2 call _ugte};case(DIK_3):{3 call _ugte};case(DIK_4):{4 call _ugte};case(DIK_5):{5 call _ugte};case(DIK_6):{6 call _ugte};case(DIK_7):{7 call _ugte};case(DIK_8):{8 call _ugte};case(DIK_9):{9 call _ugte};case(DIK_0):{0 call _ugte};case(DIK_F1):{_vycr createdisplay"RscDisplayDebugPublic";_nkfw=true};case(DIK_NUMPAD5):{bis_fnc_camera_pitchbank=[0,0];[0,0]call _uskv;bis_fnc_camera_fov=0.7;_gkuw=position _okwq;_fvto=direction _okwq;_okwq cameraeffect["terminate","back"];camdestroy _okwq;_okwq="camera"camcreate _gkuw;_okwq cameraeffect["internal","back"];_okwq setdir _fvto;missionnamespace setvariable['bis_fnc_camera_cam',_okwq]};case(DIK_M):{_otzq=_vycr displayctrl 3140;_hodk=_vycr displayctrl 3141;if(ctrlenabled _hodk)then{_otzq ctrlenable true;_hodk ctrlenable false;ctrlsetfocus _hodk;_hodk ctrlsetposition[-10,-10,0.8*safezoneW,0.8*safezoneH];_hodk ctrlcommit 0}else{_otzq ctrlenable false;_hodk ctrlenable true;ctrlsetfocus _hodk;_bavq=[safezoneX+0.1*safezoneW,safezoneY+0.1*safezoneH,0.8*safezoneW,0.8*safezoneH];_hodk ctrlsetposition _bavq;_hodk ctrlcommit 0;_hodk ctrlmapanimadd[0,0.1,position _okwq];ctrlmapanimcommit _hodk;{player reveal[_x,4]}foreach allunits}};case(DIK_H);case(DIK_L):{_assv=[_vycr displayctrl 3142,_vycr displayctrl 3143];if(bis_fnc_camera_visiblehud)then{{_x ctrlsetfade 1}foreach _assv;(_vycr displayctrl 3142)ctrlenable false;cameraEffectEnableHUD false}else{{_x ctrlsetfade 0}foreach _assv;(_vycr displayctrl 3142)ctrlenable true;cameraEffectEnableHUD true};bis_fnc_camera_visiblehud=!bis_fnc_camera_visiblehud;{_x ctrlcommit 0.1}foreach _assv};case(DIK_X):{if(_eavo)then{["Paste",_pdoz]spawn{copytoclipboard format["%1 call qeyq;",_this]}}};case(DIK_C):{if(_eavo)then{_pdoz spawn{copytoclipboard format["%1",_this]}}};case(DIK_V):{if(_eavo)then{_bbqo=call compile copyfromclipboard;if(typename _bbqo==typename[])then{_bbqo=[[_bbqo],0,[],[[]],[10]]call glgv;if(count _bbqo==10)then{["Paste",_bbqo]call qeyq}else{["Wrong format of camera params (""%1"")",copyfromclipboard]call bis_fnc_error}}}};case(DIK_N):{bis_fnc_camera_vision=bis_fnc_camera_vision+1;_qwgf=bis_fnc_camera_vision%4;switch(_qwgf)do{case 0:{camusenvg false;false SetCamUseTi 0};case 1:{camusenvg true;false SetCamUseTi 0};case 2:{camusenvg false;true SetCamUseTi 0};case 3:{camusenvg false;true SetCamUseTi 1}}};case(DIK_P):{if(_eavo)then{if(cheatsenabled)then{_unbx=format(["SplendidCamera\%1_['%2',%3,%4,%5,%6,%7,%8,%9,%10,%11].png",profilename]+_pdoz);_unbx call compile"diag_screenshot _this;"}}};case(DIK_ESCAPE):{["Exit",[]]call qeyq};default{}};_fyhr};case"KeyUp":{bis_fnc_camera_keys set[_this select 1,false]};case"MapDraw":{_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_hodk=_this select 0;_hodk drawIcon[bis_fnc_camera_iconcamera,[0,1,1,1],position _okwq,32,32,direction _okwq,"",1]};case"MapClick":{_hodk=_this select 0;_yetn=_this select 1;_wqyn=_this select 2;_hyzu=_this select 3;if(_yetn==0)then{_mvsh=_hodk ctrlmapscreentoworld[_wqyn,_hyzu];_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_okwq setpos[_mvsh select 0,_mvsh select 1,getposatl _okwq select 2]}};case"Paste":{_this spawn{disableserialization;[]call qeyq;waituntil{!isnil{uinamespace getvariable'bis_fnc_camera_display'}};with uinamespace do{_uxds=[_this,0,"",[""]]call glgv;if(_uxds!=worldname)exitwith{["Camera params are for world ""%1"", you're currently on ""%2""",_uxds,worldname]call bis_fnc_error};_pztp=[_this,1,position player,[[]],[3]]call glgv;_vswa=[_this,2,direction player,[0]]call glgv;_rnel=[_this,3,bis_fnc_camera_fov,[0]]call glgv;_jxxb=[_this,4,[0,0],[[]],[2]]call glgv;_rrdo=[_jxxb,0,0,[0]]call glgv;_qbmo=[_jxxb,1,0,[0]]call glgv;_vycr=uinamespace getvariable['bis_fnc_camera_display',displaynull];_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_okwq setpos _pztp;_okwq setdir _vswa;bis_fnc_camera_fov=_rnel;[_okwq,_rrdo,_qbmo]call bis_fnc_setpitchbank;_okwq campreparefov bis_fnc_camera_fov;_okwq camcommitprepared 0;bis_fnc_camera_pitchbank=_jxxb}}};case"Exit":{with missionnamespace do{_okwq=missionnamespace getvariable['bis_fnc_camera_cam',objnull];_okwq cameraeffect["terminate","back"];camdestroy _okwq;bis_fnc_camera_cam=nil;bis_fnc_camera_target=nil};bis_fnc_camera_display=nil;bis_fnc_camera_lmb=nil;bis_fnc_camera_rmb=nil;bis_fnc_camera_keys=nil;bis_fnc_camera_lmbclick=nil;bis_fnc_camera_rmbclick=nil;bis_fnc_camera_pitchbank=nil;bis_fnc_camera_fov=nil;bis_fnc_camera_iconcamera=nil;bis_fnc_camera_vision=nil;bis_fnc_camera_visiblehud=nil;camusenvg false;false SetCamUseTi 0;setacctime 1;setaperture -1;enableradio true;if((productVersion select 4)=="Development")then{_inzs=[]call(uinamespace getvariable"bis_fnc_displayMission");_bqyt=_inzs displayctrl 11400;_bqyt ctrlsetfade 0;_bqyt ctrlcommit 0}}};