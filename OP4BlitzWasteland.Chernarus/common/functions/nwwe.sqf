#define FNC_DISABLEERRORS \
	private ["_disableErrors"]; \
	_disableErrors = false;
#define FNC_TEXTTYPES \
	private ["_textTypes"];\
	_textTypes = "";\
	{\
		_textTypes = _textTypes + typename _x;\
		if (_forEachIndex < count _types - 1) then {_textTypes = _textTypes + ", "};\
	} foreach _types;
private["_eeaw","_kvwn","_value","_thiscount"];_thiscount=count _this;_eeaw=if(_thiscount>0)then{_this select 0}else{[]};_kvwn=if(_thiscount>1)then{_this select 1}else{0};if(typename _eeaw!=typename[])then{_eeaw=[_eeaw]};_value=if(count _eeaw>_kvwn)then{_eeaw select _kvwn}else{nil};if(_thiscount>2)then{private["_staf","_dugu","_eexu","_ktih","_llxz"];_staf=_this select 2;
#ifndef DISABLE_REWRITE
if!(isnil"_fnc_scriptname")then{_dugu=missionnamespace getvariable(_fnc_scriptname+"_"+str _kvwn);if!(isnil"_dugu")then{_staf=_dugu}};
#endif
if(isnil"_value")then{_value=_staf};if(_thiscount>3)then{_eexu=_this select 3;_llxz=typename _value;_ktih=typename _staf;if!({_llxz==typename _x}count _eexu>0)then{if({_ktih==typename _x}count _eexu>0)then{_value=_staf}else{}}};if(_thiscount>4)then{if(typename _value==typename[])then{private["_liyk","_efmj"];_liyk=[_this,4,0,[0,[]]]call clht;if(typename _liyk!=typename[])then{_liyk=[_liyk]};_efmj=count _value;if!(_efmj in _liyk)then{_value=_staf}}};_value}else{if(isnil"_value")then{nil}else{_value}};