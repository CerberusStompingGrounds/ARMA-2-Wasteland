private ['_config'];
_config = [] call CBA_fnc_hashCreate;

[_config, 'air', [25, [
	["UH1H_TK_GUE_EP1", 1],
    ["MV22", 1],
    ["CH_47F_EP1", 1],
    ["UH60M_MEV_EP1", 1],
    ["UH60M_EP1", 1],
    ["AH6J_EP1", 1],
	["BAF_Merlin_HC3_D", 1],
    ["Mi17_Civilian", 1],
    ["Ka60_PMC", 1]
]]] call BL_fnc_hashSet;

[_config, 'ground', [6, [
     
	 ["M1A2_US_TUSK_MG_EP1", 1],
	 ["T90", 1],
	 ["T72_CDF", 1],
     ["M2A3_EP1", 1],
	 ["BAF_FV510_W", 1],
     ["M6_EP1", 1]

]]] call CBA_fnc_hashSet;

_config