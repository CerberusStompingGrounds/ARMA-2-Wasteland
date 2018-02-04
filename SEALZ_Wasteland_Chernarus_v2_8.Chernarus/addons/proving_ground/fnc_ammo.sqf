if (infammook==0) then
{
	hint "Infinite Ammo ON!";
	iloopok=1;
	infammook=1;
}
else
{
	iloopok=0;
};

while {iloopok==1} do
{;
	(vehicle player) setVehicleAmmo 0.9;
	sleep 0.1;
};
hint "Infinite Ammo OFF!";
infammook=0;