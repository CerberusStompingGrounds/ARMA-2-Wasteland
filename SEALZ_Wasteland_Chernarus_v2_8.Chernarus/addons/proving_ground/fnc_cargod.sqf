while {alive ( vehicle player )} do 
{
	vehicle player setfuel 1;
	vehicle player setvehicleammo 1;
	vehicle player setdammage 0;
	r_player_unconscious = false;
	r_player_infected = false;
	r_player_injured = false;
	r_player_inpain = false;
	r_fracture_legs = false;
	r_fracture_arms = false;
	dayz_hunger = 0;
	dayz_thirst = 0;
	dayz_temperatur = 42;
	sleep 0.001;
};