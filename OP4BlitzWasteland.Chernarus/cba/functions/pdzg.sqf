#include "script_macros_common.hpp"PARAMS_2(_vmds,_kqhs);DEFAULT_PARAM(2,_mjkv,0);private["_gtpg","_vlsn","_sien","_ctdy","_scuv","_gttk"];if(typeName _vmds=="STRING")then{_vmds=toArray _vmds};if(typeName _kqhs=="STRING")then{_kqhs=toArray _kqhs};_gtpg=count _vmds;_vlsn=count _kqhs;_sien=-1;if((_gtpg - _mjkv)<_vlsn)exitWith{_sien};_ctdy=0;_scuv=false;for"_tbxq"from _mjkv to(_gtpg - 1)do{if(_vmds select _tbxq==_kqhs select _ctdy)then{if(_vlsn==1)exitWith{_sien=_tbxq;_scuv=true};if(_gtpg - _tbxq<_vlsn)exitWith{_scuv=true};INC(_ctdy);_gttk=false;for"_utpj"from(_tbxq+1)to(_tbxq+_vlsn - 1)do{if(_vmds select _utpj!=_kqhs select _ctdy)exitWith{_gttk=true};INC(_ctdy)};if(_gttk)then{_ctdy=0}else{_sien=_tbxq;_scuv=true}};if(_scuv)exitWith{}};_sien