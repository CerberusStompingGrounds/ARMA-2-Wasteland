#define     MMT_DIK_ESC                 1
#define     MMT_DIK_ENTER               28
#define     MMT_DIK_KPENTER             156
#define     MMT_SEARCHTIME              2
#define     MMT_DISPLAY_MAP             12
#define     MMT_DISPLAY_MARKER          54
#define     MMT_CONTROL_MAP             51
#define     MMT_CONTROL_MARKER          101
fcyi={private["_yrgq","_oymz","_axuh","_ofty","_jaij"];_oymz=_this select 0;_axuh=_this select 1;_yrgq=false;if((_axuh==MMT_DIK_ENTER)||(_axuh==MMT_DIK_KPENTER))then{_ofty=_oymz displayCtrl MMT_CONTROL_MARKER;_jaij=ctrlText _ofty;if(_jaij=="")then{_jaij=format["%1",name player]}else{_jaij=format["%1: %2",name player,_jaij]};_ofty ctrlSetText _jaij;_oymz displayRemoveAllEventHandlers"keyUp";_oymz displayRemoveAllEventHandlers"keyDown"};_yrgq};hmdz={private["_yrgq","_oymz","_axuh"];_oymz=_this select 0;_axuh=_this select 1;_yrgq=false;if(_axuh==MMT_DIK_ESC)then{_oymz displayRemoveAllEventHandlers"keyUp";_oymz displayRemoveAllEventHandlers"keyDown"};_yrgq};ywsw={private["_oymz"];disableUserInput true;(time+MMT_SEARCHTIME)spawn{disableSerialization;while{time<_this}do{_oymz=findDisplay MMT_DISPLAY_MARKER;if!(isNull _oymz)exitWith{_oymz displayAddEventHandler["keyUp","_this call fcyi"];_oymz displayAddEventHandler["keyDown","_this call hmdz"]}};disableUserInput false};true};waitUntil{sleep 0.1;!isNull(findDisplay MMT_DISPLAY_MAP)};((findDisplay MMT_DISPLAY_MAP)displayCtrl MMT_CONTROL_MAP)ctrlAddEventHandler["mouseButtonDblClick","call ywsw"];