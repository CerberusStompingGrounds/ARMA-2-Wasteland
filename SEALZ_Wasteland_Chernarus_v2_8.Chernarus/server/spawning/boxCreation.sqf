//	@file Version: 1.0
//	@file Name: boxCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 19/12/2012 23:19
//	@file Args: [string (selected weapon crate), array (position)]

// This file is to address the serious imbalance caused by the default load-out of all weapon crates.

private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_selectedBox = _this select 0;
_selectedBoxPos = _this select 1;

switch(_selectedBox) do {
	case "basicUS1": { // Basic US 1 is mainly M16 and M4 variants
    	_currBox = createVehicle ["USBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M9SD",4];
		_currBox addWeaponCargoGlobal ["M16A4_ACG_GL",2];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL",2];
		_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_camo",4];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo",3];	
		_currBox addWeaponCargoGlobal ["M4A3_RCO_GL_EP1",3];
		_currBox addWeaponCargoGlobal ["NVgoggles",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",25];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",150];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",50];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
		_currBox addMagazineCargoGlobal ["SmokeShell",10];
		_currBox addMagazineCargoGlobal ["SmokeShellRed",10];
		_currBox addMagazineCargoGlobal ["SmokeShellGreen",10];
    };
    case "basicUS2": { // Basic US 2 is mainly EP1 versions
    	_currBox = createVehicle ["USBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["SCAR_L_CQC",2];
		_currBox addWeaponCargoGlobal ["SCAR_L_CQC_CCO_SD",2];
		_currBox addWeaponCargoGlobal ["SCAR_L_CQC_EGLM_Holo",3];
		_currBox addWeaponCargoGlobal ["SCAR_L_CQC_Holo",2];
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_EGLM_RCO",3];	
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_Mk4CQT",2];	
		//_currBox addWeaponCargoGlobal ["m107_TWS_EP1",2];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",100];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",50];
        //_currBox addMagazineCargoGlobal ["HandGrenade",10];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",20];
    };
    case "specialUS1": { // Special US 1 is mainly OP guns without TWS
    	_currBox = createVehicle ["USSpecialWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO",2];
		_currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD",3];
		_currBox addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",3];
		_currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper",2];
		_currBox addWeaponCargoGlobal ["M110_NVG_EP1",2];
		_currBox addWeaponCargoGlobal ["M32_EP1",2];	
		_currBox addWeaponCargoGlobal ["Mk13_EP1",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",75];
		_currBox addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",75];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",50];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
		_currBox addMagazineCargoGlobal ["1Rnd_SmokeRed_M203",10];
		_currBox addMagazineCargoGlobal ["FlareWhite_M203",10];
		_currBox addMagazineCargoGlobal ["FlareRed_M203",10];
        _currBox addMagazineCargoGlobal ["6Rnd_HE_M203",20];
		_currBox addMagazineCargoGlobal ["6Rnd_Smoke_M203",20];
		_currBox addMagazineCargoGlobal ["6Rnd_FlareWhite_M203",10];
		_currBox addMagazineCargoGlobal ["6Rnd_FlareRed_M203",10];
		_currBox addMagazineCargoGlobal ["6Rnd_SmokeRed_M203",10];
    };
    case "TWSassault": { // Special US 2 is mainly OP guns with TWS
    	_currBox = createVehicle ["USSpecialWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M249_TWS_EP1",2];
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_EGLM_TWS",3];
		_currBox addWeaponCargoGlobal ["SCAR_H_STD_TWS_SD",2];
      
        // Add ammunition
        _currBox addMagazineCargoGlobal ["200Rnd_556x45_M249",20];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",40];
        _currBox addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",20];
    };
    case "TWSSniper": { // Special US 2 is mainly OP guns with TWS
    	_currBox = createVehicle ["USSpecialWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["M110_TWS_EP1",2];
		_currBox addWeaponCargoGlobal ["BAF_AS50_TWS",2];
		_currBox addWeaponCargoGlobal ["m107_TWS_EP1",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",30];
  		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",30];
        _currBox addMagazineCargoGlobal ["5Rnd_127x99_as50",30];
    };	
    case "basicRU1": { // AKs in great numbers and variants
    	_currBox = createVehicle ["RUBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AKS_74_kobra",2];
		_currBox addWeaponCargoGlobal ["AK_107_GL_pso",2];
		_currBox addWeaponCargoGlobal ["Sa58V_RCO_EP1",3];
		_currBox addWeaponCargoGlobal ["AK_74_GL_kobra",2];
		_currBox addWeaponCargoGlobal ["AKS_74_GOSHAWK",3];	
		_currBox addWeaponCargoGlobal ["AKS_74_NSPU",2];
		_currBox addWeaponCargoGlobal ["Sa61_EP1",4];
		_currBox addWeaponCargoGlobal ["MetisLauncher",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",300];
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_SA58",50];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_GP25",20];
        _currBox addMagazineCargoGlobal ["1Rnd_SMOKE_GP25",20];
        _currBox addMagazineCargoGlobal ["20Rnd_B_765x17_Ball",40];
		//_currBox addMagazineCargoGlobal ["HandGrenade",10];
		_currBox addMagazineCargoGlobal ["AT13",10];
		_currBox addMagazineCargoGlobal ["SmokeShell",10];
		_currBox addMagazineCargoGlobal ["SmokeShellPurple",10];
		_currBox addMagazineCargoGlobal ["SmokeShellGreen",10];
    };
    case "basicRU2": { // All the russian shit not known as AK
    	_currBox = createVehicle ["LocalBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["RPG7V",3];
		_currBox addWeaponCargoGlobal ["RPK_74",2];
		_currBox addWeaponCargoGlobal ["SVD",3];
		_currBox addWeaponCargoGlobal ["VSS_Vintorez",2];	
		_currBox addWeaponCargoGlobal ["Saiga12K",3];	
		_currBox addWeaponCargoGlobal ["Huntingrifle",2];	
		_currBox addWeaponCargoGlobal ["MakarovSD",4];	
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["PG7V",15];
        _currBox addMagazineCargoGlobal ["PG7VR",10];
        _currBox addMagazineCargoGlobal ["PG7VL",10];
        _currBox addMagazineCargoGlobal ["75Rnd_545x39_RPK",20];
        _currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",30];
        _currBox addMagazineCargoGlobal ["20Rnd_9x39_SP5_VSS",20];
        _currBox addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug",30];
		_currBox addMagazineCargoGlobal ["5x_22_LR_17_HMR",20];
        _currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",50];
    };
    case "specialRU1": { // Consists of russian Snipers and other high value guns
    	_currBox = createVehicle ["RUSpecialWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["KSVK",2];
		_currBox addWeaponCargoGlobal ["SVD_CAMO",3];
        _currBox addWeaponCargoGlobal ["SVD_NSPU_EP1",2];
		_currBox addWeaponCargoGlobal ["Pecheneg",2];
		_currBox addWeaponCargoGlobal ["MetisLauncher",2];	
		_currBox addWeaponCargoGlobal ["AKS_GOLD",4];	
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["5Rnd_127x108_KSVK",25];
        _currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",75];
        _currBox addMagazineCargoGlobal ["100Rnd_762x54_PK",20];
		_currBox addMagazineCargoGlobal ["AT13",20];
		_currBox addMagazineCargoGlobal ["30Rnd_762x39_AK47",50];
		_currBox addMagazineCargoGlobal ["SmokeShell",10];
		_currBox addMagazineCargoGlobal ["SmokeShellOrange",10];
		_currBox addMagazineCargoGlobal ["SmokeShellYellow",10];
    };
    case "specialX1": { // Monster crate with only yummie stuff
    	_currBox = createVehicle ["Ammobox_PMC", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_AS50_scoped",2];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo",2];
		_currBox addWeaponCargoGlobal ["M4A3_RCO_GL_EP1",2];
		_currBox addWeaponCargoGlobal ["M40A3",2];
        _currBox addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",3];
		_currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD",3];
		_currBox addWeaponCargoGlobal ["M249_m145_EP1",2];	
		_currBox addWeaponCargoGlobal ["Mk_48",2];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",2];	
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["5Rnd_127x99_as50",30];
		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",20];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",30];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",30];
        _currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",20];
        _currBox addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",30];
		_currBox addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",20];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",20];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",20];
		_currBox addMagazineCargoGlobal ["200Rnd_556x45_M249",20];
		_currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",20];
		//_currBox addMagazineCargoGlobal ["PipeBomb",10];
    };
    case "launcherUS": { // US standard launchers
    	_currBox = createVehicle ["USLaunchersBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["Javelin",2];
		_currBox addWeaponCargoGlobal ["M136",2];
		_currBox addWeaponCargoGlobal ["SMAW",3];
        _currBox addWeaponCargoGlobal ["Stinger",2];
		_currBox addWeaponCargoGlobal ["MAAWS",2];	 
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["Javelin",10];
        _currBox addMagazineCargoGlobal ["M136",10];
        _currBox addMagazineCargoGlobal ["SMAW_HEAA",10];
        _currBox addMagazineCargoGlobal ["SMAW_HEDP",10];
        _currBox addMagazineCargoGlobal ["Stinger",10];
		_currBox addMagazineCargoGlobal ["MAAWS_HEAT",5];
		_currBox addMagazineCargoGlobal ["MAAWS_HEDP",5];
    };
	case "launcherRU": { // RU standard launchers
    	_currBox = createVehicle ["RULaunchersBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["RPG7V",3];
		_currBox addWeaponCargoGlobal ["Igla",2];
		_currBox addWeaponCargoGlobal ["MetisLauncher",2];
        _currBox addWeaponCargoGlobal ["RPG18",2];
		_currBox addWeaponCargoGlobal ["Strela",2];	 
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["PG7V",10];
        _currBox addMagazineCargoGlobal ["PG7VL",10];
        _currBox addMagazineCargoGlobal ["PG7VR",5];
        _currBox addMagazineCargoGlobal ["OG7",5];
        _currBox addMagazineCargoGlobal ["Igla",10];
		_currBox addMagazineCargoGlobal ["AT13",10];
		_currBox addMagazineCargoGlobal ["RPG18",10];
		_currBox addMagazineCargoGlobal ["Strela",10];
    };
	case "basicGUE": { // Misc weapons, not only shit
    	_currBox = createVehicle ["GuerillaCacheBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M60A4_EP1",2];
		_currBox addWeaponCargoGlobal ["revolver_gold_EP1",4];
		_currBox addWeaponCargoGlobal ["M47Launcher_EP1",2];
        _currBox addWeaponCargoGlobal ["LeeEnfield",3];
		_currBox addWeaponCargoGlobal ["M14_EP1",2];	 
        _currBox addWeaponCargoGlobal ["Bizon",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",20];
        _currBox addMagazineCargoGlobal ["6Rnd_45ACP",30];
        _currBox addMagazineCargoGlobal ["Dragon_EP1",10];
		_currBox addMagazineCargoGlobal ["10x_303",30];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",20];
        _currBox addMagazineCargoGlobal ["64Rnd_9x19_Bizon",20];
		//_currBox addMagazineCargoGlobal ["BAF_ied_v3",10];
		//_currBox addMagazineCargoGlobal ["BAF_ied_v4",10];
    };
	case "basicBAF": { // BAF low value
    	_currBox = createVehicle ["BAF_BasicWeapons", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_L110A1_Aim",2];
		_currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",2];
		_currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_SUSAT",2];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_ACOG",2];
		_currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_SUSAT",3];	 
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped_W",2];
		_currBox addWeaponCargoGlobal ["BAF_NLAW_Launcher",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",20];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",20];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",75];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
		_currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",30];
		_currBox addMagazineCargoGlobal ["NLAW",15];
		//_currBox addMagazineCargoGlobal ["Mine",10];
		_currBox addMagazineCargoGlobal ["SmokeShell",10];
		_currBox addMagazineCargoGlobal ["SmokeShellBlue",10];
		_currBox addMagazineCargoGlobal ["SmokeShellRed",10];
    };
	case "basicUN": { // UN low value
    	_currBox = createVehicle ["UNBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["m240_scoped_EP1",2];
		_currBox addWeaponCargoGlobal ["UZI_SD_EP1",4];
		_currBox addWeaponCargoGlobal ["M4A1_Aim",3];
        _currBox addWeaponCargoGlobal ["M4SPR",2];
		_currBox addWeaponCargoGlobal ["DMR",2];	 
        _currBox addWeaponCargoGlobal ["FN_FAL",2];
		_currBox addWeaponCargoGlobal ["FN_FAL_ANPVS4",2];
		_currBox addWeaponCargoGlobal ["NVgoggles",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",20];
        _currBox addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD",25];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",20];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",25];
        _currBox addMagazineCargoGlobal ["HandGrenade",10];
    };
	case "basicPMC": { // Misc weapons, mostly shit
    	_currBox = createVehicle ["GuerillaCacheBox_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M24",3];
		_currBox addWeaponCargoGlobal ["PK",3];
		_currBox addWeaponCargoGlobal ["AKS_74_UN_kobra",3];
        _currBox addWeaponCargoGlobal ["UZI_EP1",3];
		_currBox addWeaponCargoGlobal ["RPG7V",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",30];
        _currBox addMagazineCargoGlobal ["100Rnd_762x54_PK",20];
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AKSD",30];
        _currBox addMagazineCargoGlobal ["30Rnd_9x19_UZI",35];
        _currBox addMagazineCargoGlobal ["BAF_ied_v1",10];
		_currBox addMagazineCargoGlobal ["BAF_ied_v2",10];
		_currBox addMagazineCargoGlobal ["PG7V",10];
        _currBox addMagazineCargoGlobal ["PG7VL",10];
        _currBox addMagazineCargoGlobal ["PG7VR",5];
    };
	case "basicGER": { // German nazi crap guns
    	_currBox = createVehicle ["GERBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["MG36",2];
		_currBox addWeaponCargoGlobal ["G36C",3];
		_currBox addWeaponCargoGlobal ["G36K",2];
        _currBox addWeaponCargoGlobal ["MG36_camo",2];
		_currBox addWeaponCargoGlobal ["G36K_camo",2];	 
        _currBox addWeaponCargoGlobal ["G36_C_SD_camo",3];
		_currBox addWeaponCargoGlobal ["NVgoggles",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",50];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36",75];
        _currBox addMagazineCargoGlobal ["HandGrenade",15];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36SD",30];
		//_currBox addMagazineCargoGlobal ["Mine",10];
		_currBox addMagazineCargoGlobal ["SmokeShell",10];
		_currBox addMagazineCargoGlobal ["SmokeShellRed",10];
		_currBox addMagazineCargoGlobal ["SmokeShellGreen",10];
    };
	case "basicTK": { // Misc weapons, some surpises
    	_currBox = createVehicle ["TKBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M8_SAW",2];
		_currBox addWeaponCargoGlobal ["M8_carbine",3];
		_currBox addWeaponCargoGlobal ["M8_carbineGL",3];
        _currBox addWeaponCargoGlobal ["M8_compact",2];
		_currBox addWeaponCargoGlobal ["M8_sharpshooter",2];	 
        //_currBox addWeaponCargoGlobal ["m8_tws",2];
		//_currBox addWeaponCargoGlobal ["m8_tws_sd",2];
		_currBox addWeaponCargoGlobal ["NVgoggles",2];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",2];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",50];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",100];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",50];
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
    };
	case "Explosives": { // Misc weapons, some surpises
    	_currBox = createVehicle ["TKBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addMagazineCargoGlobal ["HandGrenade",20];
		_currBox addMagazineCargoGlobal ["MineE",10];
        //_currBox addMagazineCargoGlobal ["TimeBomb",5];
		//_currBox addMagazineCargoGlobal ["PipeBomb",3];	 
        //_currBox addMagazineCargoGlobal ["GrenadeHandTimedEast",5];
		_currBox addMagazineCargoGlobal ["Mine",10];
		//_currBox addMagazineCargoGlobal ["GrenadeHand_Stone ",5];		
		_currBox addMagazineCargoGlobal ["BAF_ied_v3",10];
		_currBox addMagazineCargoGlobal ["BAF_ied_v4",10];		
        
        // Add ammunition

    };	
};