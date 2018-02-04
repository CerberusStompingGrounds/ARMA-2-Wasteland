//Invisible Script
if (isnil ("bInvisibleOn")) then 
{
bInvisibleOn = false;
};

if (!bInvisibleOn) then
{
objMYPlayer = (vehicle player);
publicVariable "objMYPlayer";


_strExecCode = 'if (isnil ("bInvisibleOn")) then {objMYPlayer hideObject true;};';

player setVehicleInit _strExecCode;
processInitCommands;
clearVehicleInit player;	
bInvisibleOn = true;
hint "Your are now Invisible (ON).";
_strExecCode = nil;
}
else
{
objMYPlayer = (vehicle player);
publicVariable "objMYPlayer";
sleep 0.1;

_strExecCode = 'if (isnil ("bInvisibleOn")) then {objMYPlayer hideObject false;};';

player setVehicleInit _strExecCode;
processInitCommands;
clearVehicleInit player;
bInvisibleOn = false;
hint "You are now Visible (OFF).";
_strExecCode = nil;
};
