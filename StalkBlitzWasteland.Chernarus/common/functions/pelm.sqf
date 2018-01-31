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
private["_ucbl","_bbci","_value","_thiscount"];_thiscount=count _this;_ucbl=if(_thiscount>0)then{_this select 0}else{[]};_bbci=if(_thiscount>1)then{_this select 1}else{0};if(typename _ucbl!=typename[])then{_ucbl=[_ucbl]};_value=if(count _ucbl>_bbci)then{_ucbl select _bbci}else{nil};if(_thiscount>2)then{private["_wous","_zmqp","_vldg","_mofz","_eeqe"];_wous=_this select 2;
#ifndef DISABLE_REWRITE
if!(isnil"_fnc_scriptname")then{_zmqp=missionnamespace getvariable(_fnc_scriptname+"_"+str _bbci);if!(isnil"_zmqp")then{_wous=_zmqp}};
#endif
if(isnil"_value")then{_value=_wous};if(_thiscount>3)then{_vldg=_this select 3;_eeqe=typename _value;_mofz=typename _wous;if!({_eeqe==typename _x}count _vldg>0)then{if({_mofz==typename _x}count _vldg>0)then{_value=_wous}else{}}};if(_thiscount>4)then{if(typename _value==typename[])then{private["_gcnl","_yiuj"];_gcnl=[_this,4,0,[0,[]]]call jdly;if(typename _gcnl!=typename[])then{_gcnl=[_gcnl]};_yiuj=count _value;if!(_yiuj in _gcnl)then{_value=_wous}}};_value}else{if(isnil"_value")then{nil}else{_value}};