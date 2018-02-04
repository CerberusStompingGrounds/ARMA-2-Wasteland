/*
 ASR AI settings
 this file must be found in <game folder>\userconfig\asr_ai\
 for most settings, 0 = disabled, 1 = enabled

 All config entries are turned into global variables following a standard naming scheme. For example:
 asr_ai_sys_airearming_feature = getNumber (configFile >> "asr_ai" >> "sys_airearming" >> "feature")
 Mission makers can control these features by setting these global variables in init.sqf or by setting
 a similar class in description.ext
*/

class asr_ai {
	version = 6; // will increment this when structure changes

	class sys_airearming {
		feature = 1;        // All the other settings of this class matter only if we have 1 here
		run = 1;            // Enable rearming at mission start
		radius = 50;        // Rearming search radius - how far will AI go to grab stuff
		civ = 0;            // Civilians will try to arm themselves
		sidearm = 1;        // Units will take handguns
		binocs = 1;         // Units will take binoculars

		// List of secondary weapons that any unit may take. Other launchers not in this list will only be picked by specialists
		launchers[] = {
			"RPG7V"
		};
		// List of frag grenades that units will look for
		grenades[] = {
			"HandGrenade"
		};
		// List of smoke grenades that units will look for
		smokes[] = {
			"SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange"
		};
	};

	class sys_aiskill {
		feature = 1;                   // All the other settings of this class matter only if we have 1 here
		civ = 0;                       // Enable advanced skills for civilians
		radionet = 1;                  // AI groups share known enemy locations over radio
		radiorange = 500;              // Maximum range for radios
		nightspotting = 0.3;           // Spotting range night reduction coefficient
		gunshothearing = 1;            // Gunshot hearing range coefficient (applied to shooter's weapon sound range; 0 will disable the feature)
		buildingSearching = 0.7;       // Chance the AI group will search nearby buildings when in combat mode (0 to 1 values, 0 will disable the feature)
		buildingSearchingAlwaysUp = 1; // Prefer UP stance (value: 1) when doing the house search or let AI choose automatically (value: 0)
		throwsmoke = 0.7;              // AI throws smoke when hit (set 0 to disable or a number up to 1 to enable, higher number means better chance to do it)
		join_loners = 1;               // Groups left with only one unit merge with nearest group of the same side or faction (1-enabled, 0-disabled)
		join_loners_sameFaction = 0;   // Single units will only join groups of the same faction, if join_loners = 1 above (1-faction, 0-side)
		serverdvd = 1;                 // Dynamic dedicated server viewdistance adjustment
		setskills = 1;                 // Configure AI skills based on their unit type (faction, training etc.)
		recoilMod = 1;                 // Lower recoil when using MGs; also increased recoil for wounded AI (1-enabled, 0-disabled)
		stayLow = 1;                   // Units using MG, AR or sniper should fight from prone position and the others crouch more (1-enabled, 0-disabled)
		split_legged = 300;            // Units unable to walk for this time will separate from their group to prevent slowing it down (time in seconds, set 0 to disable)
		reactions[] = {1,1,1};         // Infantry groups will randomly react with basic, scripted, random actions, to detecting the enemy or being shot at; format: {enableAttack,enableDefend,enableSupport}
		auto_srrs = 1;                 // Auto-enable BIS Surrendering module (1-enabled, 0-disabled)

		radionet_debug = 0;            // Log info sharing to RPT (1-enabled, 0-disabled)
		setskills_debug = 0;           // Log skill assignments to RPT (1-enabled, 0-disabled)
		gunshothearing_debug = 0;      // Gunshot hearing debug: shows a hint with max range the AI will detect the shots fired by player (1-enabled, 0-disabled)

		/*
		Units are classified into skill sets between 1 and 10
		By default, a lower level number means a better skilled unit
		Levels 8-10 are special:
		 - 8-9 are for pilots, very good by default, but some of their skills are now automatically reduced when they leave the aircraft (accuracy, courage)
		 - 10 is for trained snipers
		*/
		class sets {
			// only classes of arrays under this
			class level_0 { // perfect (only used for testing)
				aimingAccuracy[] = {1.00, 0.00};
				aimingShake[]    = {1.00, 0.00};
				aimingSpeed[]    = {1.00, 0.00};
				spotDistance[]   = {1.00, 0.00};
				spotTime[]       = {1.00, 0.00};
				endurance[]      = {1.00, 0.00};
				courage[]        = {1.00, 0.00};
				reloadSpeed[]    = {1.00, 0.00};
				commanding[]     = {1.00, 0.00};
				general[]        = {1.00, 0.00};

				units[] = { // add class names to this to override their default (or inherited) skill set
					
				};
			};
			class level_1 { // sf 1
				aimingAccuracy[] = {0.35, 0.10}; // skilltype = {<min value>, <random value added to min>};
				aimingShake[]    = {0.35, 0.10};
				aimingSpeed[]    = {0.80, 0.20};
				spotDistance[]   = {0.65, 0.30};
				spotTime[]       = {0.40, 0.20};
				endurance[]      = {0.80, 0.20};
				courage[]        = {0.80, 0.20};
				reloadSpeed[]    = {0.80, 0.20};
				commanding[]     = {0.80, 0.20};
				general[]        = {0.80, 0.20};

				units[] = {
					"sf_18d","sf_18c","sf_18z","sf_18b","sf_18e","sf_18a"
				};
			};
			class level_2 { // sf 2
				aimingAccuracy[] = {0.30, 0.10};
				aimingShake[]    = {0.30, 0.10};
				aimingSpeed[]    = {0.75, 0.20};
				spotDistance[]   = {0.60, 0.30};
				spotTime[]       = {0.35, 0.20};
				endurance[]      = {0.70, 0.20};
				courage[]        = {0.70, 0.20};
				reloadSpeed[]    = {0.70, 0.20};
				commanding[]     = {0.70, 0.20};
				general[]        = {0.70, 0.20};

				units[] = {
					"ibr_mutant","ibr_venator_assaulter","ibr_venator_assaulter2","ibr_venator_assaulter3"
				};
			};
			class level_3 { // regular 1
				aimingAccuracy[] = {0.25, 0.10};
				aimingShake[]    = {0.25, 0.10};
				aimingSpeed[]    = {0.70, 0.20};
				spotDistance[]   = {0.55, 0.30};
				spotTime[]       = {0.30, 0.20};
				endurance[]      = {0.60, 0.20};
				courage[]        = {0.60, 0.20};
				reloadSpeed[]    = {0.60, 0.20};
				commanding[]     = {0.60, 0.20};
				general[]        = {0.60, 0.20};

				units[] = {
					"bink_usmc_tl","bink_usmc_sl","bink_usmc_dmr","bink_usmc_scout","bink_usmc_scout_l","bink_usmc_tl_des","bink_usmc_sl_des","bink_usmc_dmr_des",
					"bink_usmc_scout_des","bink_usmc_scout_l_des","rb_teamleader","ibr_venator_leader"
				};
			};
			class level_4 { // regular 2
				aimingAccuracy[] = {0.20, 0.10};
				aimingShake[]    = {0.20, 0.10};
				aimingSpeed[]    = {0.65, 0.20};
				spotDistance[]   = {0.50, 0.30};
				spotTime[]       = {0.25, 0.20};
				endurance[]      = {0.50, 0.20};
				courage[]        = {0.50, 0.20};
				reloadSpeed[]    = {0.50, 0.20};
				commanding[]     = {0.50, 0.20};
				general[]        = {0.50, 0.20};

				units[] = {
					"ibr_bodyguard"
				};
			};
			class level_5 { // militia or trained insurgents, former regulars
				aimingAccuracy[] = {0.15, 0.10};
				aimingShake[]    = {0.15, 0.10};
				aimingSpeed[]    = {0.60, 0.20};
				spotDistance[]   = {0.45, 0.30};
				spotTime[]       = {0.20, 0.20};
				endurance[]      = {0.40, 0.20};
				courage[]        = {0.40, 0.20};
				reloadSpeed[]    = {0.40, 0.20};
				commanding[]     = {0.40, 0.20};
				general[]        = {0.40, 0.20};

				units[] = {
					"ibr_arl_officer","ibr_arl_sniper","ibr_arl_sab","ibr_arl_roberto","ibr_arl_marksman"
				};
			};
			class level_6 { // civilians with some military training
				aimingAccuracy[] = {0.10, 0.10};
				aimingShake[]    = {0.10, 0.10};
				aimingSpeed[]    = {0.55, 0.20};
				spotDistance[]   = {0.40, 0.30};
				spotTime[]       = {0.15, 0.20};
				endurance[]      = {0.30, 0.20};
				courage[]        = {0.30, 0.20};
				reloadSpeed[]    = {0.30, 0.20};
				commanding[]     = {0.30, 0.20};
				general[]        = {0.30, 0.20};

				units[] = {
					"ibr_rebel11","ibr_rebel22","ibr_rebel33","ibr_rebel44","ibr_rebel55","ibr_rebel66","ibr_rebel77","ibr_rebel83","ibr_rebel95","ibr_rebel102",
					"ibr_rebel111","ibr_rebel125","ibr_rebel132","ibr_rebel145","ibr_rebel151","ibr_rebel162","ibr_rebel173","ibr_rebel184","ibr_rebel195",
					"ibr_rebel206","ibr_rebel217",
					"ibr_arl_rif","ibr_arl_rif2","ibr_arl_mg","ibr_arl_ar","ibr_arl_at","ibr_arl_aa","ibr_arl_crew","ibr_arl_medic",
					"ibr_drg_man1","ibr_drg_man2","ibr_drg_man3","ibr_drg_man4","ibr_drg_man5","ibr_drg_man6","ibr_drg_man7"
				};
			};
			class level_7 { // civilians without military training
				aimingAccuracy[] = {0.10, 0.10};
				aimingShake[]    = {0.10, 0.10};
				aimingSpeed[]    = {0.50, 0.20};
				spotDistance[]   = {0.35, 0.30};
				spotTime[]       = {0.10, 0.20};
				endurance[]      = {0.20, 0.20};
				courage[]        = {0.20, 0.20};
				reloadSpeed[]    = {0.20, 0.20};
				commanding[]     = {0.20, 0.20};
				general[]        = {0.20, 0.20};

				units[] = {
					"ibr_arl_stoner1","ibr_arl_stoner2","ibr_arl_stoner3","ibr_arl_stoner4","ibr_arl_stoner5","ibr_arl_stoner6","ibr_arl_stoner7"
				};
			};
			class level_8 { // pilot 1
				aimingAccuracy[] = {0.25, 0.10};
				aimingShake[]    = {0.25, 0.10};
				aimingSpeed[]    = {0.65, 0.20};
				spotDistance[]   = {0.65, 0.30};
				spotTime[]       = {0.40, 0.20};
				endurance[]      = {0.60, 0.20};
				courage[]        = {0.60, 0.20};
				reloadSpeed[]    = {0.60, 0.20};
				commanding[]     = {0.60, 0.20};
				general[]        = {0.60, 0.20};

				units[] = {
					"ibr_arl_eric"
				};
			};
			class level_9 { // pilot 2
				aimingAccuracy[] = {0.20, 0.10};
				aimingShake[]    = {0.20, 0.10};
				aimingSpeed[]    = {0.60, 0.20};
				spotDistance[]   = {0.60, 0.30};
				spotTime[]       = {0.35, 0.20};
				endurance[]      = {0.50, 0.20};
				courage[]        = {0.50, 0.20};
				reloadSpeed[]    = {0.50, 0.20};
				commanding[]     = {0.50, 0.20};
				general[]        = {0.50, 0.20};

				units[] = {
					"ibr_arl_pilot","ibr_drg_pilot"
				};
			};
			class level_10 { // sniper
				aimingAccuracy[] = {0.80, 0.10};
				aimingShake[]    = {0.90, 0.10};
				aimingSpeed[]    = {0.70, 0.20};
				spotDistance[]   = {0.70, 0.30};
				spotTime[]       = {0.75, 0.20};
				endurance[]      = {0.70, 0.20};
				courage[]        = {0.70, 0.20};
				reloadSpeed[]    = {0.70, 0.20};
				commanding[]     = {0.70, 0.20};
				general[]        = {0.70, 0.20};

				units[] = {
					
				};
			};
		};//sets
		
		// apply skill coefficient by faction to the skills the units would get based on their skill levels and settings above
		// if a faction is missing the coefficient is assumed to be 1
		class factions {

			class USMC { // US Marine Corps
				coef = 1.0;
			};
			class CDF { // Chernarussian Defence Forces
				coef = 0.9;
			};
			class RU { // Russia
				coef = 1.0;
			};
			class INS { // Chedaki Insurgents
				coef = 1.0;
			};
			class GUE { // NAPA Guerilla
				coef = 1.0;
			};

			class BIS_TK { // Takistani Army
				coef = 0.9;
			};
			class BIS_TK_INS { // Takistani Insurgents
				coef = 1.0;
			};
			class BIS_US { // US Army
				coef = 1.0;
			};
			class BIS_CZ { // Czech
				coef = 1.0;
			};
			class BIS_GER { // Germany
				coef = 1.0;
			};
			class BIS_TK_GUE { // Takistani Guerilla
				coef = 1.0;
			};
			class BIS_UN { // UNO
				coef = 1.0;
			};
			class PMC_BAF { // Private military
				coef = 1.0;
			};
			class BIS_BAF { // UK
				coef = 1.0;
			};

			class ACE_USAF { // US Air Force
				coef = 1.0;
			};
			class ACE_USNAVY { // US Navy
				coef = 1.0;
			};
			class ACE_RUNAVY { // Russian Navy
				coef = 1.0;
			};
			class ACE_USMC_Desert {
				coef = 1.0;
			};
			class ACE_USARMY {
				coef = 1.0;
			};
			class ACE_USARMY_DESERT {
				coef = 1.0;
			};
			class ACE_160SOAR {
				coef = 1.0;
			};
			class ACE_VDV { // Russian Airborne Troops
				coef = 1.0;
			};
			class ACE_GRU { // Spetsnatz GRU
				coef = 1.0;
			};
			class ACE_MVD { // Vityaz MVD
				coef = 1.0;
			};
			class ACE_RU_Desert { // Russia (Desert)
				coef = 1.0;
			};

			class cwr2_us {
				coef = 1.0;
			};
			class cwr2_ru {
				coef = 1.0;
			};
			class cwr2_fia {
				coef = 1.0;
			};

			class LIN_army { // Lingor Army (GAL)
				coef = 0.9;
			};
			class ibr_arl_faction { // Lingor Rebels (ARL)
				coef = 1.0;
			};
			class ibr_drg_faction { // Druglord's Army
				coef = 1.0;
			};
			class ibr_police_unit { // Lingor Police
				coef = 1.0;
			};
			class ibr_unisol_faction { // UniSol Corp.
				coef = 1.2;
			};
			class ibr_venator_faction { // Venator PMCs
				coef = 1.0;
			};
			class AFR_army { // Afrenian Army
				coef = 0.9;
			};
			class MOL_army { // Molatian Army
				coef = 0.8;
			};
			class ibr_rebel_faction { // African Rebels
				coef = 1.0;
			};

			class I44_A_Army { // US Army
				coef = 1.0;
			};
			class I44_A_Army_Winter { // US Army (Winter)
				coef = 1.0;
			};
			class I44_A_USMC { // US Marine Corps
				coef = 1.0;
			};
			class I44_A_AAF { // US Army Air Force
				coef = 1.0;
			};
			class I44_A_Navy { // US Navy
				coef = 1.0;
			};
			class I44_B_Army { // British Army
				coef = 1.0;
			};
			class I44_B_Army_Winter { // British Army (Winter)
				coef = 1.0;
			};
			class I44_B_RAF { // British Royal Air Force
				coef = 1.0;
			};
			class I44_B_RN { // British Royal Navy
				coef = 1.0;
			};
			class I44_G_WH { // German Heer
				coef = 1.0;
			};
			class I44_G_WINTER { // German Heer (Winter)
				coef = 1.0;
			};
			class I44_G_SS { // // German Waffen-SS
				coef = 1.0;
			};
			class I44_G_SS_Winter { // German Waffen-SS (Winter)
				coef = 1.0;
			};
			class I44_G_WL { // German Luftwaffe
				coef = 1.0;
			};
			class I44_G_WM { // German Kriegsmarine
				coef = 1.0;
			};
			class I44_R_F { // French Resistance
				coef = 1.0;
			};

		};//factions

	};//sys_aiskill

};
