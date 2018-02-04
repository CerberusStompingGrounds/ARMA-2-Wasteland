disableserialization;
_display = (_this select 0) select 0;
_mode = _this select 1;

#define DEBUG_DISPLAY	(finddisplay 316000)

#define DEBUG_VAR1	(DEBUG_DISPLAY displayctrl 316011)
#define DEBUG_VAR2	(DEBUG_DISPLAY displayctrl 316021)
#define DEBUG_VAR3	(DEBUG_DISPLAY displayctrl 316031)
#define DEBUG_VAR4	(DEBUG_DISPLAY displayctrl 316041)

#define DEBUG_OUT1	(DEBUG_DISPLAY displayctrl 316012)
#define DEBUG_OUT2	(DEBUG_DISPLAY displayctrl 316022)
#define DEBUG_OUT3	(DEBUG_DISPLAY displayctrl 316032)
#define DEBUG_OUT4	(DEBUG_DISPLAY displayctrl 316042)

#define DEBUG_CMD1	(DEBUG_DISPLAY displayctrl 316101)
#define DEBUG_CMD2	(DEBUG_DISPLAY displayctrl 316102)
#define DEBUG_CMD3	(DEBUG_DISPLAY displayctrl 316103)
#define DEBUG_CMD4	(DEBUG_DISPLAY displayctrl 316104)
#define DEBUG_CMD5	(DEBUG_DISPLAY displayctrl 316105)
#define DEBUG_CMD6	(DEBUG_DISPLAY displayctrl 316106)

//--- Load
if (_mode == "load") then {
	_this spawn {

		waituntil {!isnull DEBUG_DISPLAY};

		//--- Load text fields
		with (uinamespace) do {
			if (isnil "stra_var1") then {stra_var1 = ""};
			if (isnil "stra_var2") then {stra_var2 = ""};
			if (isnil "stra_var3") then {stra_var3 = ""};
			if (isnil "stra_var4") then {stra_var4 = ""};

			DEBUG_VAR1 ctrlsettext stra_var1;
			DEBUG_VAR2 ctrlsettext stra_var2;
			DEBUG_VAR3 ctrlsettext stra_var3;
			DEBUG_VAR4 ctrlsettext stra_var4;

			if (isnil "stra_cmd1") then {stra_cmd1 = ""};
			if (isnil "stra_cmd2") then {stra_cmd2 = ""};
			if (isnil "stra_cmd3") then {stra_cmd3 = ""};
			if (isnil "stra_cmd4") then {stra_cmd4 = ""};
			if (isnil "stra_cmd5") then {stra_cmd5 = ""};
			if (isnil "stra_cmd5") then {stra_cmd6 = ""};
			DEBUG_CMD1 ctrlsettext stra_cmd1;
			DEBUG_CMD2 ctrlsettext stra_cmd2;
			DEBUG_CMD3 ctrlsettext stra_cmd3;
			DEBUG_CMD4 ctrlsettext stra_cmd4;
			DEBUG_CMD5 ctrlsettext stra_cmd5;
			DEBUG_CMD6 ctrlsettext stra_cmd6;
		};

		//--- Set event handlers
		DEBUG_DISPLAY displayaddeventhandler ["keydown","
			_key = _this select 1;
			_ctrl = _this select 2;
			switch (_key) do {
				case 2: {call compile (ctrlText 316101);};
				case 3: {call compile (ctrlText 316102);};
				case 4: {call compile (ctrlText 316103);};
				case 5: {call compile (ctrlText 316104);};
				case 6: {call compile (ctrlText 316105);};
				case 7: {call compile (ctrlText 316106);};
			};
			false
		"];


		//--- Variable checking loop
		while {stra_debug_run} do {
			if (ctrltext 316011 != "") then {DEBUG_OUT1 ctrlsettext format ["%1",call compile (ctrltext DEBUG_VAR1)];};
			if (ctrltext 316021 != "") then {DEBUG_OUT2 ctrlsettext format ["%1",call compile (ctrltext DEBUG_VAR2)];};
			if (ctrltext 316031 != "") then {DEBUG_OUT3 ctrlsettext format ["%1",call compile (ctrltext DEBUG_VAR3)];};
			if (ctrltext 316041 != "") then {DEBUG_OUT4 ctrlsettext format ["%1",call compile (ctrltext DEBUG_VAR4)];};
			uisleep 0.1;
		};
	};
};

//--- Unload
if (_mode == "unload") then {

	uinamespace setvariable ["stra_var1",(ctrlText DEBUG_VAR1)];
	uinamespace setvariable ["stra_var2",(ctrlText DEBUG_VAR2)];
	uinamespace setvariable ["stra_var3",(ctrlText DEBUG_VAR3)];
	uinamespace setvariable ["stra_var4",(ctrlText DEBUG_VAR4)];

	uinamespace setvariable ["stra_cmd1",(ctrlText DEBUG_CMD1)];
	uinamespace setvariable ["stra_cmd2",(ctrlText DEBUG_CMD2)];
	uinamespace setvariable ["stra_cmd3",(ctrlText DEBUG_CMD3)];
	uinamespace setvariable ["stra_cmd4",(ctrlText DEBUG_CMD4)];
	uinamespace setvariable ["stra_cmd5",(ctrlText DEBUG_CMD5)];
	uinamespace setvariable ["stra_cmd6",(ctrlText DEBUG_CMD6)];
};