sleep 30;

_AddvertiseArray = [
	["#cc2a36", "Website and Forums!", "#FFFFFF", "www.op4squad.com"],
	["#cc2a36", "Auto Restarts", "#FFFFFF", "This server restarts every 6 hours"],
	["#cc2a36", "Can't Find A Mod Or Admin?", "#FFFFFF", "Head over to our Teamspeak at op4squad.teamspeakcp.com or Discord at discord.gg/hTdwwN7"],
	["#cc2a36", "Donations", "#FFFFFF", "Donations keep the server alive, however, there are no ingame perks"],
	["#cc2a36", "Auto Restarts", "#FFFFFF", "This server restarts every 6 hours"],
	["#cc2a36", "Can't Find A Mod Or Admin?", "#FFFFFF", "Head over to our Teamspeak at op4squad.teamspeakcp.com or Discord at discord.gg/hTdwwN7"],
	["#cc2a36", "Donations", "#FFFFFF", "Donations keep the server alive, however, there are no ingame perks"],
	["#cc2a36", "Auto Restarts", "#FFFFFF", "This server restarts every 6 hours"]
	];

while {true} do
{
	sleep 300;
	_message = _AddvertiseArray select (random (count _AddvertiseArray - 1));
	
	
	hint parseText format ["
	
		<t align='center' color='%1' shadow='1' shadowColor='#000000' size='1.50'>%2</t><br/>
		<t align='center' color='#FFFFFF' shadow='2' shadowColor='#000000' size='1.00'>____________________________</t><br/>
		<t align='center' color='%3' size='1.25'>%4</t><br/>
		
	", (_message select 0), (_message select 1), (_message select 2), (_message select 3)];
};