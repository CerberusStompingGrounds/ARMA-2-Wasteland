private["_cyer","_dmsi","_xziv","_ufuo","_vdmx","_tfco","_fkte","_jbas","_vmir","_ekrg","_folj","_tkhp"];_cyer=[_this,0,objNull,[objNull]]call jdly;_dmsi=[_this,1,objNull,[objNull]]call jdly;_xziv=getPosATL _cyer;_ufuo=getPosATL _dmsi;_vdmx=+_xziv;_vdmx set[2,0];_tfco=+_ufuo;_tfco set[2,0];_fkte=_vdmx distance _tfco;_jbas=_cyer call b_fnc_nx;_vmir=(_jbas select 0)max(_jbas select 1);_ekrg=_dmsi call b_fnc_nx;_folj=(_ekrg select 0)max(_ekrg select 1);_tkhp=abs((_xziv select 2)-(_ufuo select 2));(_fkte - _vmir/2 - _folj/2+_tkhp)