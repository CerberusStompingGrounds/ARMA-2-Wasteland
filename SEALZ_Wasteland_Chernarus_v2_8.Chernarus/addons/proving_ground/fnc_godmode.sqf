// anti hack scripts cannot disable your user input
// this is irrelivant now as the code is deprected by the main hack.
// Dependant on version may be removed without notice.





if (isNil "igodokxtt") then {igodokxtt = 0;};
if (igodokxtt==0) then
{
player addeventhandler ["hit",{player setdammage 0}];
player addeventhandler ["dammaged",{player setdammage 0}];
(vehicle player) addeventhandler ["hit",	{vehicle player setdammage 0}];
(vehicle player) addeventhandler ["dammaged",{vehicle player setdammage 0}];
(vehicle player) removeAllEventHandlers "handleDamage";
(vehicle player) addEventHandler ["handleDamage", { false }];	
(vehicle player) allowDamage false;
igodokxtt=1;
hint "GOD mode ON";
sleep 0.001;
}
else
{

player removeAllEventHandlers "hit";
player removeAllEventHandlers "dammaged";
(vehicle player) removeAllEventHandlers "hit";
(vehicle player) removeAllEventHandlers "dammaged";
(vehicle player) addEventHandler ["handleDamage", { true }];	
(vehicle player) removeAllEventHandlers "handleDamage";
(vehicle player) allowDamage true;
igodokxtt=0;
hint "YOU ARE NO LONGER GOD";
sleep 0.001;
};




