private["_xyrb","_ryoy","_yozk","_gqal","_tgay","_jqcd"];_xyrb=[_this,0,[0,0,0],[[]]]call jdly;_ryoy=[_this,1,"ICON",[""]]call jdly;_yozk=[_this,2,"DOT",[""]]call jdly;_gqal=[_this,3,"",[""]]call jdly;_tgay=[_this,4,"",[""]]call jdly;_jqcd=[_this,5,true,[true]]call jdly;_xnts=format['marker_%1',10 call qogc];if(hasInterface)then{_xnts=createMarker[_xnts,_xyrb];_xnts setMarkerShape _ryoy;_xnts setMarkerType _yozk;_xnts setMarkerColor _gqal;_xnts setMarkerText _tgay};if(_jqcd)then{opml=missionNamespace getVariable['opml',[]];opml set[count opml,[_xyrb,_ryoy,_yozk,_gqal,_tgay]];publicVariable"opml"};_xnts