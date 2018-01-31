#define     MMT_DIK_ESC                 1
#define     MMT_DIK_ENTER               28
#define     MMT_DIK_KPENTER             156
#define     MMT_SEARCHTIME              2
#define     MMT_DISPLAY_MAP             12
#define     MMT_DISPLAY_MARKER          54
#define     MMT_CONTROL_MAP             51
#define     MMT_CONTROL_MARKER          101
zheg={private["_aemc","_eyli","_gvyi","_vrry","_mvhm"];_eyli=_this select 0;_gvyi=_this select 1;_aemc=false;if((_gvyi==MMT_DIK_ENTER)||(_gvyi==MMT_DIK_KPENTER))then{_vrry=_eyli displayCtrl MMT_CONTROL_MARKER;_mvhm=ctrlText _vrry;if(_mvhm=="")then{_mvhm=format["%1",name player]}else{_mvhm=format["%1: %2",name player,_mvhm]};_vrry ctrlSetText _mvhm;_eyli displayRemoveAllEventHandlers"keyUp";_eyli displayRemoveAllEventHandlers"keyDown"};_aemc};guuy={private["_aemc","_eyli","_gvyi"];_eyli=_this select 0;_gvyi=_this select 1;_aemc=false;if(_gvyi==MMT_DIK_ESC)then{_eyli displayRemoveAllEventHandlers"keyUp";_eyli displayRemoveAllEventHandlers"keyDown"};_aemc};nlaa={private["_eyli"];disableUserInput true;(time+MMT_SEARCHTIME)spawn{disableSerialization;while{time<_this}do{_eyli=findDisplay MMT_DISPLAY_MARKER;if!(isNull _eyli)exitWith{_eyli displayAddEventHandler["keyUp","_this call zheg"];_eyli displayAddEventHandler["keyDown","_this call guuy"]}};disableUserInput false};true};waitUntil{sleep 0.1;!isNull(findDisplay MMT_DISPLAY_MAP)};((findDisplay MMT_DISPLAY_MAP)displayCtrl MMT_CONTROL_MAP)ctrlAddEventHandler["mouseButtonDblClick","call nlaa"];