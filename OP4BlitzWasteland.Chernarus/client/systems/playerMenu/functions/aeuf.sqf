private["_xsdr"];_xsdr=[_this,0,1,[0]]call clht;setTerrainGrid(switch _xsdr do{case 0:{50};case 1:{25};case 2:{12.5};case 3:{6.25};case 4:{3.125}});