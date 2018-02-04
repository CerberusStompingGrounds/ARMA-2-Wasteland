private ['_config'];
_config = [] call BL_fnc_hashCreate;
[_config, 'pistolsspawn', [
	// Pistols [Max Price with Ammo: ]
	["CfgWeapons", "UZI_EP1",100],								// Ammo: clips $30 ea - Total: $220
    ["CfgWeapons", "UZI_SD_EP1",100],					// Ammo: clips $30 ea - Total: $220
	["CfgWeapons", "Sa61_EP1",100],					// Ammo: clips $25 ea - Total: $190
	["CfgWeapons", "glock17_EP1",0],						// Ammo: clips $15 ea - Total: $110
    ["CfgWeapons", "Makarov",50],							// Ammo: clips $10 ea - Total: $80
	["CfgWeapons", "MakarovSD",50],						// Ammo: clips $10 ea - Total: $80
	["CfgWeapons", "M9SD",50],							// Ammo: clips $15 ea - Total: $110
	["CfgWeapons", "M9",50],								// Ammo: clips $15 ea - Total: $110
	["CfgWeapons", "revolver_EP1",0],						// Ammo: clips $15 ea - Total: $135
    ["CfgWeapons", "revolver_gold_EP1",75],			// Ammo: clips $15 ea - Total: $135
	["CfgWeapons", "Colt1911",50]								// Ammo: clips $15 ea - Total: $110
]] call BL_fnc_hashSet;

[_config, 'riflesspawn', [
    // Shotguns & Rifles [Max Price with Ammo: 1500| 25% Sale Value]
	// TWS
	["CfgWeapons", "BAF_L85A2_RIS_CWS",1200],				// Ammo: clips $35 ea - Total: $1410
	["CfgWeapons", "m8_tws_sd",1200],						// Ammo: clips $35 ea - Total: $1410
	["CfgWeapons", "m8_tws",1100],							// Ammo: clips $50 ea - Total: $1310
	["CfgWeapons", "AKS_74_GOSHAWK",1000],			// Ammo: clips $50 ea - Total: $1240
	["CfgWeapons", "SCAR_L_STD_EGLM_TWS",1000],		// Ammo: clips $35 ea - Total: $1210	
	// M14 AIM	
    ["CfgWeapons", "M14_EP1",1000],							// Ammo: clips $50 ea - Total: $1300
	// MK17's	
    ["CfgWeapons", "SCAR_H_STD_EGLM_Spect",1100],		// Ammo: clips $50 ea - Total: $1400
	["CfgWeapons", "SCAR_H_CQC_CCO_SD",1050],	// Ammo: clips $50 ea - Total: $1350
	["CfgWeapons", "LeeEnfield",1000],
	["CfgWeapons", "SCAR_H_CQC_CCO",1000],					// Ammo: clips $50 ea - Total: $1300
	// MK16's
	["CfgWeapons", "SCAR_L_STD_EGLM_RCO",900],			// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "SCAR_L_CQC_EGLM_Holo",900],		// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "SCAR_L_STD_Mk4CQT",850],			// Ammo: clips $35 ea - Total: $1060
	["CfgWeapons", "SCAR_L_CQC",800],						// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "SCAR_L_STD_HOLO",800],					// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "SCAR_L_CQC_CCO_SD",800],				// Ammo: clips $35 ea - Total: $1010	
	["CfgWeapons", "SCAR_L_CQC_Holo",800],					// Ammo: clips $35 ea - Total: $1010
	// Sa-58's
	["CfgWeapons", "Sa58V_RCO_EP1",1000],				// Ammo: clips $45 ea - Total: $1270
	["CfgWeapons", "Sa58V_CCO_EP1",950],					// Ammo: clips $45 ea - Total: $1220
	["CfgWeapons", "Sa58P_EP1",900],							// Ammo: clips $45 ea - Total: $1170
	["CfgWeapons", "Sa58V_EP1",900],							// Ammo: clips $45 ea - Total: $1170
	// L85's	
	["CfgWeapons", "BAF_L85A2_RIS_ACOG",1000],			// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "BAF_L85A2_UGL_ACOG",1000],			// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "BAF_L86A2_ACOG",1000],					// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "BAF_L85A2_RIS_SUSAT",900],			// Ammo: clips $35 ea - Total: $1110	
	["CfgWeapons", "BAF_L85A2_UGL_SUSAT",900],		// Ammo: clips $35 ea - Total: $1110	
	["CfgWeapons", "BAF_L85A2_RIS_Holo",900],				// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "BAF_L85A2_UGL_Holo",900],			// Ammo: clips $35 ea - Total: $1110	
	// FN FAL
	["CfgWeapons", "FN_FAL_ANPVS4",1200],			// Ammo: clips $45 ea - Total: $1470
	["CfgWeapons", "FN_FAL",850],								// Ammo: clips $45 ea - Total: $1120
	// AK's		
	["CfgWeapons", "AK_107_GL_kobra",1000],				// Ammo: clips $40 ea - Total: $1240
	["CfgWeapons", "AK_107_GL_pso",1000],				// Ammo: clips $40 ea - Total: $1240
	["CfgWeapons", "AK_74_GL_kobra",950],
	["CfgWeapons", "AKS_74_NSPU",900],					// Ammo: clips $40 ea - Total: $250	
	["CfgWeapons", "AK_107_pso",900],						// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AK_107_kobra",900],					// Ammo: clips $40 ea - Total: $1140	
	["CfgWeapons", "AKS_74_kobra",900],					// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AKS_74_UN_kobra",900],				// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AKS_74_pso",900],						// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AK_47_M",850],								// Ammo: clips $45 ea - Total: $1120
	["CfgWeapons", "AK_47_S",850],								// Ammo: clips $45 ea - Total: $1120
	["CfgWeapons", "AKS_GOLD",850],								// Ammo: clips $45 ea - Total: $1120
	["CfgWeapons", "AK_74_GL",850],						// Ammo: clips $40 ea - Total: $1090
	["CfgWeapons", "AK_74",0],								// Ammo: clips $40 ea - Total: $250	
	["CfgWeapons", "AKS_74",800],								// Ammo: clips $40 ea - Total: $250	
	["CfgWeapons", "AKS_74_U",800],							// Ammo: clips $40 ea - Total: $250
	// M4A1's
	["CfgWeapons", "M4A1_HWS_GL_SD_Camo",1000],		// Ammo: clips $35 ea - Total: $1210	
	["CfgWeapons", "M4A1_HWS_GL",900],					// Ammo: clips $35 ea - Total: $1110	
	["CfgWeapons", "M4A1_HWS_GL_camo",900],		// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A3_RCO_GL_EP1",0],				// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A1_RCO_GL",900],					// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A1_AIM_SD_camo",900],				// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A1_Aim",800],							// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "M4A1_Aim_camo",800],				// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "M4A3_CCO_EP1",800],						// Ammo: clips $35 ea - Total: $1010	
    ["CfgWeapons", "M4A1",750],									// Ammo: clips $35 ea - Total: $300
	// M16's	
	["CfgWeapons", "M16A4_ACG_GL",950],				// Ammo: clips $35 ea - Total: $1160
	["CfgWeapons", "M16A4_GL",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "m16a4_acg",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M16A2GL",800],							// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "M16A2",750],									// Ammo: clips $35 ea - Total: $250		
	["CfgWeapons", "m16a4",750],								// Ammo: clips $35 ea - Total: $960
	// G36's	
	["CfgWeapons", "G36_C_SD_eotech",1000],					// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "G36_C_SD_camo",1000],				// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "G36K_camo",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "G36K",900],									// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "G36a",800],									// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "G36A_camo",800],						// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "G36C",800],									// Ammo: clips $35 ea - Total: $1010	
	["CfgWeapons", "G36C_camo",800],						// Ammo: clips $35 ea - Total: $1010
	// M8's
	["CfgWeapons", "m8_holo_sd",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "m8_carbineGL",850],					// Ammo: clips $35 ea - Total: $1050
	["CfgWeapons", "m8_carbine",800],							// Ammo: clips $35 ea - Total: $1000
	["CfgWeapons", "m8_carbine_pmc",800],						// Ammo: clips $35 ea - Total: $1000
	// Sub Machineguns
	["CfgWeapons", "bizon_silenced",750],				// Ammo: clips $45 ea - Total: $1020
	["CfgWeapons", "bizon",700],							// Ammo: clips $45 ea - Total: $970
	["CfgWeapons", "MP5SD",650],								// Ammo: clips $30 ea - Total: $830
	["CfgWeapons", "MP5A5",0],								// Ammo: clips $30 ea - Total: $780
	// Shotguns
	["CfgWeapons", "AA12_PMC",1000],							// Ammo: clips $50 ea - Total: $1300
	["CfgWeapons", "Saiga12K",700],						// Ammo: clips $40 ea - Total: $940
	["CfgWeapons", "M1014",700]								// Ammo: clips $40 ea - Total: $150
]] call BL_fnc_hashSet;

[_config, 'snipersspawn', [
    // Sniper rifles [Max Price with Ammo: $2300 | 50% Sale Value]
    //TWS
	["CfgWeapons", "BAF_AS50_TWS",2900],					// Ammo: clips $100 ea - Total: $3300
	["CfgWeapons", "m107_TWS_EP1",2650], 					// Ammo: clips $75 ea - Total: $3050
	["CfgWeapons", "M110_TWS_EP1",2400], 					// Ammo: clips $50 ea - Total: $2500
	["CfgWeapons", "SCAR_H_STD_TWS_SD",1400], 		// Ammo: clips $50 ea - Total: $1500
	["CfgWeapons", "M110_NVG_EP1",2100],						// Ammo: clips $50 ea - Total: $1400	
	["CfgWeapons", "SVD_NSPU_EP1",700],						// Ammo: clips $40 ea - Total: $940	
	//NON TWS
	["CfgWeapons", "BAF_AS50_scoped",1200], 					// Ammo: clips $100 ea - Total: $1800
	["CfgWeapons", "m107",1600],								// Ammo: clips $75 ea - Total: $1550
	["CfgWeapons", "KSVK",1500],								// Ammo: clips $70 ea - Total: $1520	
	["CfgWeapons", "BAF_LRR_scoped",1000],				// Ammo: clips $60 ea - Total: $1360
	["CfgWeapons", "BAF_LRR_scoped_W",1000],				// Ammo: clips $60 ea - Total: $1360
	["CfgWeapons", "SCAR_H_LNG_Sniper",1000],			// Ammo: clips $50 ea - Total: $1300
	["CfgWeapons", "SCAR_H_LNG_Sniper_SD",900],		// Ammo: clips $50 ea - Total: $1200
	["CfgWeapons", "DMR",1200],									// Ammo: clips $50 ea - Total: $1200
	["CfgWeapons", "SVD",1100],									// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "SVD_CAMO",1100],							// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "SVD_des_EP1",800], 					// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "M24",1000],									// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "M24_des_EP1",0],					// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "M40A3",700], 								// Ammo: clips $40 ea - Total: $940
	["CfgWeapons", "m8_sharpshooter",700],	// Ammo: clips $35 ea - Total: $910
	["CfgWeapons", "VSS_vintorez",650],					// Ammo: clips $40 ea - Total: $890
	["CfgWeapons", "huntingrifle",650], 						// Ammo: clips $40 ea - Total: $890
	["CfgWeapons", "M4SPR",600] 							// Ammo: clips $35 ea - Total: $810
]] call BL_fnc_hashSet;

[_config, 'machinegunsspawn', [
	// Machineguns [Max Price with Ammo: Based on 3 drums]
	["CfgWeapons", "Mk_48",1150],							// Ammo: clips $200 ea - Total: $1750
	["CfgWeapons", "Mk_48_DES_EP1",1150],				// Ammo: clips $200 ea - Total: $1750
	["CfgWeapons", "Pecheneg",1150],						// Ammo: clips $200 ea - Total: $1750
	["CfgWeapons", "M60A4_EP1",1150],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "PK",0],									// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "m240_scoped_EP1",1000],				// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "MG36",1000],								// Ammo: clips $100 ea - Total: $1300
	["CfgWeapons", "M249_EP1",1000],							// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "M249_EP1",1000],						// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "BAF_L110A1_Aim",1000],					// Ammo: clips $100 ea - Total: $1300
	["CfgWeapons", "M249_m145_EP1",1000],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "M249_TWS_EP1",1000],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "MG36_camo",1000],					// Ammo: clips $100 ea - Total: $1300
	["CfgWeapons", "BAF_L7A2_GPMG",900],					// Ammo: clips $100 ea - Total: $1200
	["CfgWeapons", "M240",900],									// Ammo: clips $100 ea - Total: $1200
	["CfgWeapons", "RPK_74",900],								// Ammo: clips $75  ea - Total: $1125
	["CfgWeapons", "m8_SAW",800]								// Ammo: clips $100 ea - Total: $1100
]] call BL_fnc_hashSet;

[_config, 'rpgsspawn', [
    // Anti-tank [Max Price with Ammo: ]
    // Anti Tank
	["CfgWeapons", "Javelin",2350],							// Ammo: clips $300 ea - Total: $2000
	["CfgWeapons", "MetisLauncher",2850],				// Ammo: clips $250 ea - Total: $1850
	["CfgWeapons", "Stinger",2800],							// Ammo: clips $250 ea - Total: $1800
	["CfgWeapons", "Igla",1600],							// Ammo: clips $250 ea - Total: $1800
	["CfgWeapons", "Strela",1600],						// Ammo: clips $250 ea - Total: $1800
	["CfgWeapons", "M47Launcher_EP1",2350],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "BAF_NLAW_Launcher",2000],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "MAAWS",1600],					    // Ammo: clips $175 ea - Total: $1350
    ["CfgWeapons", "M136",1200],									// Ammo: clips $150 ea - Total: $1200
	["CfgWeapons", "SMAW",1300],									// Ammo: clips $150 ea - Total: $1100
    ["CfgWeapons", "RPG18",900],								// Ammo: clips $150 ea - Total: $1100
	["CfgWeapons", "RPG7V",950],								// Ammo: clips $150 ea - Total: $1050

	// Grenade Launchers
	["CfgWeapons", "M32_EP1",600],								// Ammo: clips $150 ea - Total: $840
	["CfgWeapons", "M79_EP1",400],								// Ammo: clips $150 ea - Total: $550
	["CfgWeapons", "Mk13_EP1",400]								// Ammo: clips $150 ea - Total: $550
]] call BL_fnc_hashSet;

[_config, 'pistols', [
	// Pistols [Max Price with Ammo: ]
	["CfgWeapons", "UZI_EP1",100],								// Ammo: clips $30 ea - Total: $220
    ["CfgWeapons", "UZI_SD_EP1",100],					// Ammo: clips $30 ea - Total: $220
	["CfgWeapons", "Sa61_EP1",100],					// Ammo: clips $25 ea - Total: $190
	["CfgWeapons", "glock17_EP1",0],						// Ammo: clips $15 ea - Total: $110
    ["CfgWeapons", "Makarov",50],							// Ammo: clips $10 ea - Total: $80
	["CfgWeapons", "MakarovSD",50],						// Ammo: clips $10 ea - Total: $80
	["CfgWeapons", "M9SD",50],							// Ammo: clips $15 ea - Total: $110
	["CfgWeapons", "M9",50],								// Ammo: clips $15 ea - Total: $110
	["CfgWeapons", "revolver_EP1",0],						// Ammo: clips $15 ea - Total: $135
    ["CfgWeapons", "revolver_gold_EP1",75],			// Ammo: clips $15 ea - Total: $135
	["CfgWeapons", "Colt1911",50]								// Ammo: clips $15 ea - Total: $110
]] call BL_fnc_hashSet;

[_config, 'rifles', [
    // Shotguns & Rifles [Max Price with Ammo: 1500| 25% Sale Value]
	// TWS
	["CfgWeapons", "BAF_L85A2_RIS_CWS",1200],				// Ammo: clips $35 ea - Total: $1410
	["CfgWeapons", "m8_tws_sd",1200],						// Ammo: clips $35 ea - Total: $1410
	["CfgWeapons", "m8_tws",1100],							// Ammo: clips $50 ea - Total: $1310
	["CfgWeapons", "AKS_74_GOSHAWK",1000],			// Ammo: clips $50 ea - Total: $1240
	["CfgWeapons", "SCAR_L_STD_EGLM_TWS",1000],		// Ammo: clips $35 ea - Total: $1210	
	// M14 AIM	
    ["CfgWeapons", "M14_EP1",1000],							// Ammo: clips $50 ea - Total: $1300
	// MK17's	
    ["CfgWeapons", "SCAR_H_STD_EGLM_Spect",1100],		// Ammo: clips $50 ea - Total: $1400
	["CfgWeapons", "SCAR_H_CQC_CCO_SD",1050],	// Ammo: clips $50 ea - Total: $1350
	["CfgWeapons", "LeeEnfield",1000],
	["CfgWeapons", "SCAR_H_CQC_CCO",1000],					// Ammo: clips $50 ea - Total: $1300
	// MK16's
	["CfgWeapons", "SCAR_L_STD_EGLM_RCO",900],			// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "SCAR_L_CQC_EGLM_Holo",900],		// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "SCAR_L_STD_Mk4CQT",850],			// Ammo: clips $35 ea - Total: $1060
	["CfgWeapons", "SCAR_L_CQC",800],						// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "SCAR_L_STD_HOLO",800],					// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "SCAR_L_CQC_CCO_SD",800],				// Ammo: clips $35 ea - Total: $1010	
	["CfgWeapons", "SCAR_L_CQC_Holo",800],					// Ammo: clips $35 ea - Total: $1010
	// Sa-58's
	["CfgWeapons", "Sa58V_RCO_EP1",1000],				// Ammo: clips $45 ea - Total: $1270
	["CfgWeapons", "Sa58V_CCO_EP1",950],					// Ammo: clips $45 ea - Total: $1220
	["CfgWeapons", "Sa58P_EP1",900],							// Ammo: clips $45 ea - Total: $1170
	["CfgWeapons", "Sa58V_EP1",900],							// Ammo: clips $45 ea - Total: $1170
	// L85's	
	["CfgWeapons", "BAF_L85A2_RIS_ACOG",1000],			// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "BAF_L85A2_UGL_ACOG",1000],			// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "BAF_L86A2_ACOG",1000],					// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "BAF_L85A2_RIS_SUSAT",900],			// Ammo: clips $35 ea - Total: $1110	
	["CfgWeapons", "BAF_L85A2_UGL_SUSAT",900],		// Ammo: clips $35 ea - Total: $1110	
	["CfgWeapons", "BAF_L85A2_RIS_Holo",900],				// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "BAF_L85A2_UGL_Holo",900],			// Ammo: clips $35 ea - Total: $1110	
	// FN FAL
	["CfgWeapons", "FN_FAL_ANPVS4",1200],			// Ammo: clips $45 ea - Total: $1470
	["CfgWeapons", "FN_FAL",850],								// Ammo: clips $45 ea - Total: $1120
	// AK's		
	["CfgWeapons", "AK_107_GL_kobra",1000],				// Ammo: clips $40 ea - Total: $1240
	["CfgWeapons", "AK_107_GL_pso",1000],				// Ammo: clips $40 ea - Total: $1240
	["CfgWeapons", "AK_74_GL_kobra",950],
	["CfgWeapons", "AKS_74_NSPU",900],					// Ammo: clips $40 ea - Total: $250	
	["CfgWeapons", "AK_107_pso",900],						// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AK_107_kobra",900],					// Ammo: clips $40 ea - Total: $1140	
	["CfgWeapons", "AKS_74_kobra",900],					// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AKS_74_UN_kobra",900],				// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AKS_74_pso",900],						// Ammo: clips $40 ea - Total: $1140
	["CfgWeapons", "AK_47_M",850],								// Ammo: clips $45 ea - Total: $1120
	["CfgWeapons", "AK_47_S",850],								// Ammo: clips $45 ea - Total: $1120
	["CfgWeapons", "AKS_GOLD",850],								// Ammo: clips $45 ea - Total: $1120
	["CfgWeapons", "AK_74_GL",850],						// Ammo: clips $40 ea - Total: $1090
	["CfgWeapons", "AK_74",0],								// Ammo: clips $40 ea - Total: $250	
	["CfgWeapons", "AKS_74",800],								// Ammo: clips $40 ea - Total: $250	
	["CfgWeapons", "AKS_74_U",800],							// Ammo: clips $40 ea - Total: $250
	// M4A1's
	["CfgWeapons", "M4A1_HWS_GL_SD_Camo",1000],		// Ammo: clips $35 ea - Total: $1210	
	["CfgWeapons", "M4A1_HWS_GL",900],					// Ammo: clips $35 ea - Total: $1110	
	["CfgWeapons", "M4A1_HWS_GL_camo",900],		// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A3_RCO_GL_EP1",0],				// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A1_RCO_GL",900],					// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A1_AIM_SD_camo",900],				// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M4A1_Aim",800],							// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "M4A1_Aim_camo",800],				// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "M4A3_CCO_EP1",800],						// Ammo: clips $35 ea - Total: $1010	
    ["CfgWeapons", "M4A1",750],									// Ammo: clips $35 ea - Total: $300
	// M16's	
	["CfgWeapons", "M16A4_ACG_GL",950],				// Ammo: clips $35 ea - Total: $1160
	["CfgWeapons", "M16A4_GL",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "m16a4_acg",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "M16A2GL",800],							// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "M16A2",750],									// Ammo: clips $35 ea - Total: $250		
	["CfgWeapons", "m16a4",750],								// Ammo: clips $35 ea - Total: $960
	// G36's	
	["CfgWeapons", "G36_C_SD_eotech",1000],					// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "G36_C_SD_camo",1000],				// Ammo: clips $35 ea - Total: $1210
	["CfgWeapons", "G36K_camo",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "G36K",900],									// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "G36a",800],									// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "G36A_camo",800],						// Ammo: clips $35 ea - Total: $1010
	["CfgWeapons", "G36C",800],									// Ammo: clips $35 ea - Total: $1010	
	["CfgWeapons", "G36C_camo",800],						// Ammo: clips $35 ea - Total: $1010
	// M8's
	["CfgWeapons", "m8_holo_sd",900],						// Ammo: clips $35 ea - Total: $1110
	["CfgWeapons", "m8_carbineGL",850],					// Ammo: clips $35 ea - Total: $1050
	["CfgWeapons", "m8_carbine",800],							// Ammo: clips $35 ea - Total: $1000
	["CfgWeapons", "m8_carbine_pmc",800],						// Ammo: clips $35 ea - Total: $1000
	// Sub Machineguns
	["CfgWeapons", "bizon_silenced",750],				// Ammo: clips $45 ea - Total: $1020
	["CfgWeapons", "bizon",700],							// Ammo: clips $45 ea - Total: $970
	["CfgWeapons", "MP5SD",650],								// Ammo: clips $30 ea - Total: $830
	["CfgWeapons", "MP5A5",0],								// Ammo: clips $30 ea - Total: $780
	// Shotguns
	["CfgWeapons", "AA12_PMC",1000],							// Ammo: clips $50 ea - Total: $1300
	["CfgWeapons", "Saiga12K",700],						// Ammo: clips $40 ea - Total: $940
	["CfgWeapons", "M1014",700]								// Ammo: clips $40 ea - Total: $150
]] call BL_fnc_hashSet;

[_config, 'snipers', [
    // Sniper rifles [Max Price with Ammo: $2300 | 50% Sale Value]
    //TWS
	["CfgWeapons", "BAF_AS50_TWS",2900],					// Ammo: clips $100 ea - Total: $3300
	["CfgWeapons", "m107_TWS_EP1",2650], 					// Ammo: clips $75 ea - Total: $3050
	["CfgWeapons", "M110_TWS_EP1",2400], 					// Ammo: clips $50 ea - Total: $2500
	["CfgWeapons", "SCAR_H_STD_TWS_SD",1400], 		// Ammo: clips $50 ea - Total: $1500
	["CfgWeapons", "M110_NVG_EP1",2100],						// Ammo: clips $50 ea - Total: $1400	
	["CfgWeapons", "SVD_NSPU_EP1",700],						// Ammo: clips $40 ea - Total: $940	
	//NON TWS
	["CfgWeapons", "BAF_AS50_scoped",1200], 					// Ammo: clips $100 ea - Total: $1800
	["CfgWeapons", "m107",1600],								// Ammo: clips $75 ea - Total: $1550
	["CfgWeapons", "KSVK",1500],								// Ammo: clips $70 ea - Total: $1520	
	["CfgWeapons", "BAF_LRR_scoped",1000],				// Ammo: clips $60 ea - Total: $1360
	["CfgWeapons", "BAF_LRR_scoped_W",1000],				// Ammo: clips $60 ea - Total: $1360
	["CfgWeapons", "SCAR_H_LNG_Sniper",1000],			// Ammo: clips $50 ea - Total: $1300
	["CfgWeapons", "SCAR_H_LNG_Sniper_SD",900],		// Ammo: clips $50 ea - Total: $1200
	["CfgWeapons", "DMR",1200],									// Ammo: clips $50 ea - Total: $1200
	["CfgWeapons", "SVD",1100],									// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "SVD_CAMO",1100],							// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "SVD_des_EP1",800], 					// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "M24",1000],									// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "M24_des_EP1",0],					// Ammo: clips $40 ea - Total: $1040
	["CfgWeapons", "M40A3",700], 								// Ammo: clips $40 ea - Total: $940
	["CfgWeapons", "m8_sharpshooter",700],	// Ammo: clips $35 ea - Total: $910
	["CfgWeapons", "VSS_vintorez",650],					// Ammo: clips $40 ea - Total: $890
	["CfgWeapons", "huntingrifle",650], 						// Ammo: clips $40 ea - Total: $890
	["CfgWeapons", "M4SPR",600] 							// Ammo: clips $35 ea - Total: $810
]] call BL_fnc_hashSet;

[_config, 'machineguns', [
	// Machineguns [Max Price with Ammo: Based on 3 drums]
	["CfgWeapons", "Mk_48",1150],							// Ammo: clips $200 ea - Total: $1750
	["CfgWeapons", "Mk_48_DES_EP1",1150],				// Ammo: clips $200 ea - Total: $1750
	["CfgWeapons", "Pecheneg",1150],						// Ammo: clips $200 ea - Total: $1750
	["CfgWeapons", "M60A4_EP1",1150],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "PK",0],									// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "m240_scoped_EP1",1000],				// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "MG36",1000],								// Ammo: clips $100 ea - Total: $1300
	["CfgWeapons", "M249_EP1",1000],							// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "M249_EP1",1000],						// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "BAF_L110A1_Aim",1000],					// Ammo: clips $100 ea - Total: $1300
	["CfgWeapons", "M249_m145_EP1",1000],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "M249_TWS_EP1",1000],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "MG36_camo",1000],					// Ammo: clips $100 ea - Total: $1300
	["CfgWeapons", "BAF_L7A2_GPMG",900],					// Ammo: clips $100 ea - Total: $1200
	["CfgWeapons", "M240",900],									// Ammo: clips $100 ea - Total: $1200
	["CfgWeapons", "RPK_74",900],								// Ammo: clips $75  ea - Total: $1125
	["CfgWeapons", "m8_SAW",800]								// Ammo: clips $100 ea - Total: $1100
]] call BL_fnc_hashSet;

[_config, 'rpgs', [
    // Anti-tank [Max Price with Ammo: ]
    // Anti Tank
	["CfgWeapons", "Javelin",2350],							// Ammo: clips $300 ea - Total: $2000
	["CfgWeapons", "MetisLauncher",2850],				// Ammo: clips $250 ea - Total: $1850
	["CfgWeapons", "Stinger",2800],							// Ammo: clips $250 ea - Total: $1800
	["CfgWeapons", "Igla",1600],							// Ammo: clips $250 ea - Total: $1800
	["CfgWeapons", "Strela",1600],						// Ammo: clips $250 ea - Total: $1800
	["CfgWeapons", "M47Launcher_EP1",2350],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "BAF_NLAW_Launcher",2000],					// Ammo: clips $200 ea - Total: $1600
	["CfgWeapons", "MAAWS",1600],					    // Ammo: clips $175 ea - Total: $1350
    ["CfgWeapons", "M136",1200],									// Ammo: clips $150 ea - Total: $1200
	["CfgWeapons", "SMAW",1300],									// Ammo: clips $150 ea - Total: $1100
    ["CfgWeapons", "RPG18",900],								// Ammo: clips $150 ea - Total: $1100
	["CfgWeapons", "RPG7V",950],								// Ammo: clips $150 ea - Total: $1050

	// Grenade Launchers
	["CfgWeapons", "M32_EP1",600],								// Ammo: clips $150 ea - Total: $840
	["CfgWeapons", "M79_EP1",400],								// Ammo: clips $150 ea - Total: $550
	["CfgWeapons", "Mk13_EP1",400]								// Ammo: clips $150 ea - Total: $550
]] call BL_fnc_hashSet;

[_config, 'ammo', [
	["CfgMagazines", "1Rnd_HE_M203",20],
	["CfgMagazines", "1Rnd_Smoke_M203",20],
	["CfgMagazines", "1Rnd_HE_GP25",20],
	["CfgMagazines", "5Rnd_127x99_as50",100],
    ["CfgMagazines", "5Rnd_86x70_L115A1",60],
    ["CfgMagazines", "5Rnd_762x51_M24",40],
    ["CfgMagazines", "5Rnd_127x108_KSVK",70],
	["CfgMagazines", "5x_22_LR_17_HMR",40],
    ["CfgMagazines", "6Rnd_45ACP",0],
	["CfgMagazines", "SmokeShell",30],
	["CfgMagazines", "SmokeShellYellow",30],
	["CfgMagazines", "SmokeShellRed",30],
	["CfgMagazines", "SmokeShellGreen",30],
	["CfgMagazines", "SmokeShellWhite",30],
	["CfgMagazines", "SmokeShellBlue",30],
	["CfgMagazines", "SmokeShellPurple",30],
	["CfgMagazines", "SmokeShellOrange",30],
	["CfgMagazines", "6Rnd_HE_M203",120],
	["CfgMagazines", "FlareWhite_M203",20],
	["CfgMagazines", "6Rnd_Smoke_M203",120],
	["CfgMagazines", "6Rnd_SmokeRed_M203",120],
	["CfgMagazines", "6Rnd_SmokeGreen_M203",120],
    ["CfgMagazines", "7Rnd_45ACP_1911",15],
    ["CfgMagazines", "8Rnd_9x18_Makarov",10],
	["CfgMagazines", "8Rnd_9x18_MakarovSD",10],
	["CfgMagazines", "10x_303",15],
	["CfgMagazines", "8Rnd_B_Beneli_74Slug",40],
	["CfgMagazines", "8Rnd_B_Beneli_Pellets",40],
	["CfgMagazines", "8Rnd_B_Saiga12_74Slug",40],
    ["CfgMagazines", "8Rnd_B_Saiga12_Pellets",40],
    ["CfgMagazines", "10Rnd_762x54_SVD",40],
    ["CfgMagazines", "10Rnd_127x99_m107",75],
    ["CfgMagazines", "10Rnd_9x39_SP5_VSS",20],
    ["CfgMagazines", "15Rnd_9x19_M9SD",15],
    ["CfgMagazines", "15Rnd_9x19_M9",15],
	["CfgMagazines", "17Rnd_9x19_glock17",0],
	["CfgMagazines", "20Rnd_B_765x17_Ball",25],
    ["CfgMagazines", "20Rnd_B_AA12_74Slug",50],
    ["CfgMagazines", "20Rnd_B_AA12_Pellets",50],
    ["CfgMagazines", "20Rnd_9x39_SP5_VSS",40],
    ["CfgMagazines", "20Rnd_762x51_FNFAL",25],
    ["CfgMagazines", "20Rnd_762x51_DMR",50],
    ["CfgMagazines", "20Rnd_762x51_B_SCAR",50],
    ["CfgMagazines", "20Rnd_762x51_SB_SCAR",50],
    ["CfgMagazines", "30Rnd_9x19_UZI",30],
	["CfgMagazines", "30Rnd_9x19_UZI_SD",30],
	["CfgMagazines", "30Rnd_9x19_MP5",0],
	["CfgMagazines", "30Rnd_9x19_MP5SD",30],
	["CfgMagazines", "30Rnd_545x39_AK",15],
	["CfgMagazines", "30Rnd_545x39_AKSD",40],
	["CfgMagazines", "30Rnd_762x39_AK47",45],
	["CfgMagazines", "30Rnd_762x39_SA58",45],
	["CfgMagazines", "30Rnd_556x45_G36",35],
	["CfgMagazines", "30Rnd_556x45_G36SD",35],
	["CfgMagazines", "30Rnd_556x45_Stanag",15],
    ["CfgMagazines", "30Rnd_556x45_StanagSD",35],
    ["CfgMagazines", "64Rnd_9x19_Bizon",45],
	["CfgMagazines", "64Rnd_9x19_SD_Bizon",45],
    ["CfgMagazines", "75Rnd_545x39_RPK",75],
    ["CfgMagazines", "100Rnd_556x45_BetaCMag_airLock",100],
	["CfgMagazines", "100Rnd_762x51_M240",200],
	["CfgMagazines", "100Rnd_556x45_BetaCMag",100],
	["CfgMagazines", "100Rnd_762x51_M240",200],
	["CfgMagazines", "100Rnd_762x54_PK",200],
	["CfgMagazines", "200Rnd_556x45_M249",200],
	["CfgMagazines", "MAAWS_HEAT",175],  
    ["CfgMagazines", "MAAWS_HEDP",175],
	["CfgMagazines", "M136",150],
	["CfgMagazines", "RPG18",150],
	["CfgMagazines", "OG7",100],
    ["CfgMagazines", "PG7VR",150],
    ["CfgMagazines", "PG7V",125],  
    ["CfgMagazines", "PG7VL",125],
	["CfgMagazines", "SMAW_HEDP",125],
    ["CfgMagazines", "SMAW_HEAA",150],
    ["CfgMagazines", "NLAW",300],
	["CfgMagazines", "Dragon_EP1",300],
	["CfgMagazines", "AT13",250],
	["CfgMagazines", "Stinger",250],
    ["CfgMagazines", "Strela",250],
	["CfgMagazines", "Igla",250],
	["CfgMagazines", "Javelin",300],
	["CfgMagazines", "Laserbatteries",200]
]] call BL_fnc_hashSet;

//Gun Store Equipment List
//Text name, classname, buy cost
[_config, 'equipment', [
    ["CfgMagazines", "BAF_L109A1_HE",50],
	["CfgMagazines", "HandGrenade",50],
    ["CfgMagazines", "SmokeShell",30],
	["CfgMagazines", "SmokeShellYellow",30],
	["CfgMagazines", "SmokeShellRed",30],
	["CfgMagazines", "SmokeShellGreen",30],
	["CfgMagazines", "SmokeShellBlue",30],
	["CfgMagazines", "SmokeShellPurple",30],
	["CfgMagazines", "SmokeShellOrange",30],
    ["CfgMagazines", "Mine",200],
	["CfgMagazines", "MineE",200],
	["CfgMagazines", "PipeBomb",600],
	["CfgWeapons", "ItemGPS",175],
	["CfgWeapons", "NVGoggles",250],
	["CfgWeapons", "Laserdesignator",350],
	["CfgWeapons", "Binocular_Vector",350]
]] call BL_fnc_hashSet;

[_config, 'vehicles', [
	["CfgVehicles", "MMT_USMC", 10],
	["CfgVehicles", "ATV_US_EP1", 20],
	["CfgVehicles", "M1030", 300],
	["CfgVehicles", "UralCivil", 500],
	["CfgVehicles", "SUV_PMC", 1000],
	["CfgVehicles", "KA137_PMC", 3000],
	["CfgVehicles", "MH6J_EP1", 4000],
	["CfgVehicles", "AH6X_EP1", 3000]
]] call BL_fnc_hashSet;

_config