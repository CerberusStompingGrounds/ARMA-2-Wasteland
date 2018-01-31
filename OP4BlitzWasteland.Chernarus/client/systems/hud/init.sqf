if(!hasInterface)exitwith{};
#include "functions\vbvk.sqf"[]spawn{disableSerialization;waitUntil{!isNull player};waituntil{!(IsNull(findDisplay 46))};private["_iakd","_zjro","_rurw","_kmps","_slto",'_friendlyIcon'];_zjro=objNull;srld=false;(findDisplay 46)displayAddEventHandler["KeyDown","
		if ( (_this select 1) == 219 ) then {
			srld = true;
		};
	"];(findDisplay 46)displayAddEventHandler["KeyUp","
		if ( (_this select 1) == 219 ) then {
			srld = false;
		};
	"];(findDisplay 46)displayAddEventHandler["KeyDown","
		if ( (_this select 1) == 22 ) then {
			zfnp=player getVariable ['earplugs',0];
			if (zfnp==0) then {
				player setVariable['earplugs',1, true];
				1 fadeSound 0.2;
				hint 'Earplugs are inserted.';
			};
			if (zfnp==1) then {
				player setVariable['earplugs',0, true];
				1 fadeSound 1;
				hint 'Earplugs are removed.';
			};
		};
	"];ngfm=call{private"_ewno";_ewno=toArray str missionConfigFile;_ewno resize(count _ewno - 15);toString _ewno};qtsy=ngfm+"client\systems\hud\icons\friendly.paa";vydq=playerSide call aukq;oelj=format["<img image='%1' color='%2' size='1'/>",qtsy,vydq call nlxe];_iakd={11 cutRsc['HUDRsc','PLAIN'];_zjro=uiNamespace getVariable'HUD';_rurw=_zjro displayCtrl HUDplayerInfoIDC;_kmps=_zjro displayCtrl HUDserverInfoIDC;_slto=_zjro displayCtrl HUDvehicleInfoIDC;(_zjro displayCtrl HUDnotificationIDC)ctrlShow false;(_zjro displayCtrl HUDnotificationTextIDC)ctrlShow false;(_zjro displayCtrl HUDnotificationIconIDC)ctrlShow false;_kmps ctrlSetStructuredText parseText('HUDServerInfo'call trss)};private["_xbay","_qpne","_qhhx","_phwe","_vkkd","_naez"];_xbay=missionConfigFile>>"RscTitles">>"HUDRsc";_qpne=getNumber(_xbay>>"controlsBackground">>"vehicleInfo">>"sizeEx");_qhhx=getNumber(_xbay>>"controlsBackground">>"vehicleInfo">>"x");_phwe=getNumber(_xbay>>"controlsBackground">>"vehicleInfo">>"y");_vkkd=getNumber(_xbay>>"controlsBackground">>"vehicleInfo">>"w");_naez=getNumber(_xbay>>"controlsBackground">>"vehicleInfo">>"h");pwdw=objNull;(findDisplay 12 displayCtrl 51)ctrlAddEventHandler["MouseMoving","_this call hxyl"];(findDisplay 12 displayCtrl 51)ctrlAddEventHandler["Draw","_this call phnv"];[]spawn{disableSerialization;_xfma='banners'call trss;_xpos=(uiNamespace getVariable'HUD')displayCtrl HUDbannerIDC;_xpos ctrlSetFade 0;_xpos ctrlCommit 0;while{true}do{{_xpos=(uiNamespace getVariable'HUD')displayCtrl HUDbannerIDC;_xpos ctrlSetText(_x select 0);_xpos ctrlSetFade 0;_xpos ctrlCommit 3;sleep(_x select 1);_xpos ctrlSetFade 1;_xpos ctrlCommit 3;sleep(_x select 2);while{(vehicle player)!=player}do{sleep 5};nil}count _xfma}};[]spawn{waitUntil{[]call eznj;false}};[]spawn{disableSerialization;private["_nmkj","_kmps"];_nmkj=vehicle player;_kmps=missionConfigFile>>"RscTitles">>"HUDRsc">>"controlsBackground">>"serverInfo";_yimn=getNumber(_kmps>>"w");_fphz=getNumber(_kmps>>"h");_ievt=uiNamespace getVariable'HUD';while{true}do{waitUntil{_nmkj!=vehicle player||(uiNamespace getVariable'HUD')!=_ievt};_nmkj=vehicle player;_ievt=uiNamespace getVariable'HUD';_x=getNumber(_kmps>>"x");_gcjr=getNumber(_kmps>>"y");if!(_nmkj isKindOf"Man")then{if(getNumber(configFile>>"CfgVehicles">>(typeOf _nmkj)>>"radarType")>0)then{_x=safezoneX+0.078+(0.161*SafezoneH);_gcjr=safezoneY+0.035}else{_x=safezoneX+0.078}};((uiNamespace getVariable'HUD')displayCtrl HUDserverInfoIDC)ctrlSetPosition[_x,_gcjr,_yimn,_fphz];((uiNamespace getVariable'HUD')displayCtrl HUDserverInfoIDC)ctrlCommit 0}};private["_clzw","_oyzy","_fwdl","_damagePercent","_mkyu"];while{true}do{if(isNull _zjro&&isNull(uiNamespace getVariable['dqkm',displayNull])&&isNil"bis_fnc_camera_cam"&&!visibleMap)then{[]call _iakd}else{if!(isNull(uiNamespace getVariable['dqkm',displayNull])&&isNil"bis_fnc_camera_cam"&&!visibleMap)then{11 cutText["","PLAIN"]}};_rurw ctrlSetStructuredText parseText format['
		<img image="client\systems\hud\icons\health.paa" size="0.8" /> <t shadow="2">%2%1</t><br />
		<img image="client\systems\hud\icons\compass.paa" size="0.8" /> <t shadow="2">%3°</t>
		','%',round(100-(damage player)*100),round((eyeDirection player)call qyhk)];if(vehicle player!=player)then{_slto ctrlShow true;_cdrs="";{_clzw=(assignedVehicleRole _x);_oyzy="";if(count _clzw==0)then{_clzw=['Cargo']};_oyzy=(_clzw select 0)call{if(_this=="Cargo")exitwith{"\ca\ui\data\cmdbar_cargo_ca.paa"};if(_this=="Driver")exitwith{"\ca\ui\data\cmdbar_driver_ca.paa"};if(_this=="Turret")exitwith{"\ca\ui\data\cmdbar_gunner_ca.paa"};"\ca\ui\data\cmdbar_cargo_ca.paa"};_fwdl="";if(alive _x)then{_fwdl=[1,(1- damage _x),(1- damage _x),1]call nlxe}else{_fwdl="#000000"};_cdrs=_cdrs+format['
					<t shadow="2" color="%3">%1</t> <img image="%2" size="0.8" /><br />
					',name _x,_oyzy,_fwdl]}count(crew vehicle player);_slto ctrlSetStructuredText parseText format['<t align="right">%1</t>',_cdrs];_mkyu=_qpne*(count crew vehicle player);_slto ctrlSetPosition[_qhhx,_phwe+(_naez - _mkyu),_vkkd,_mkyu];_slto ctrlCommit 0}else{_slto ctrlShow false};sleep 0.05}};