//  @file Version: 1.0
//  @file Name: briefing.sqf
//  @file Author: TheDA, Nash
//  @file Created: 18th Aug 15


// Put new entries above old entries as order is determined from the bottom up
// use <br/> tags to separate lines  
// To add new items
//
//
// player createDiaryRecord["Subjecthere",
// [
// "Name of entry",
// "
// player createDiarySubject ["OP4 Squad", "Information"];
// Subject is the first entry in this and only used internallyAFAIK


player createDiarySubject ["OP4 Squad", "Information"];
player createDiarySubject ["Changelog", "Changelog"];
player createDiarySubject ["Beacons", "Beacons"];
player createDiarySubject ["Stores", "Stores"];
player createDiarySubject ["Wasteland", "What is Wasteland?"];

player createDiaryRecord["Changelog",
[
"23 Aug 15",
"
<br/>
         General:<br/>
            -Introduced Information text to map screen see top left<br/>
         Additions:<br/>
            -Added further parts to build store.<br/><br/>

07 july 16<br/><br/>
        General:<br/>
			- Removed Death tax on Trial basis.<br/>
            - Added Static Base at Klen (Castle).<br/>
            - Added Static Base at Altar (Dam).<br/>
            - Added Static Base NW of Rogovo (Random).<br/>
            - Adjusted various base part prices.<br/>
            - Added additional parts to building store.<br/>
            - Adjusted Vehicle spawn types (town only).<br/><br/>

         Missions:<br/>
            - Added MI24P into mission cycle on a trial basis (Removed FABs and missles).<br/>
            - Added MH6J (Passenger mounts on side) to personal spawn loadout.<br/><br/>

         Bug Fixes:<br/>
            - Fixed Mission Load Error popup.<br/>
"
]
];
player createDiaryRecord["OP4 Squad",
[
"Staff",
"
<br/>
    OP4 Squad Staff:<br/><br/>
        Bubba - Senior Admin<br/>
        Zombie - Senior Admin<br/>
        xXHalfSliceXx - Junior Admin<br/>
        UncleBuck - Moderator<br/>
        RubADubNub - Moderator<br/>
        Replicant - Moderator<br/>
"
]
];

player createDiaryRecord["OP4 Squad",
[
"Teamspeak",
"
<br/>
There is a public teamspeak server available for players of this server.<br/><br/>
For teamspeak3 join ts9.gamersvoip.net:10035<br/><br/>
Insufficient security level can be improved in the identity menu(CTRL+I) in TS3.<br/><br/>
Please join and say hello! (Please speak English)
"
]
];


player createDiaryRecord["OP4 Squad",
[
"Reporting Issues",
"
<br/>
-No “Hackusations”: If you suspect a hacker, do not accuse them over side chat.<br/>
Do your best to take screen shots or video evidence, then contact a staff member on our support chat, or ask for one in the server.<br/>
If you contact us on chat, we’ll be able to monitor the player and take action easier and faster. When you provide proof, we can go through it and issue retrospective punishment.<br/><br/>
-Suspect a player, Please report it at: www.op4squad.com and click support forum or on our teamspeak server.<br/><br/>
"
]
];

player createDiaryRecord["OP4 Squad",
[
"Rules",
"
<br/>
Please See the Website or the loading page for a Rules list 
"
]
];
player createDiaryRecord["Wasteland",
[
"Hints & Tips",
"
<br/>
At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.<br/><br/>
When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, castles, etc.<br/><br/>
Remember players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.<br/><br/>
If you perform a ground insertion, you will be automatically placed near a vehicle. Be sure to look around for supplies before giving up.<br/><br/>
When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.<br/><br/>
There are AI characters that spawn with missions and will protect the mission objectives with deadly force, be aware of them.<br/><br/>
Vehicles deployed from your inventory will despawn if you move more than 100m away from them.<br/><br/>
Want more information? Check out the forums! www.op4squad.com<br/><br/>
"
]
];
player CreateDiaryRecord["Beacons",
[
"Beacon Information",
"
<br/>
There are three types of beacons; Air, Ground, and Base.<br/>
Block radius is the minimum distance an enemy has to be to block player spawning.<br/>
Air beacons are the most common as they come with the two highest donation tiers. But are purchasable in general stores at a cost of $4000<br/>
Air beacons have a block radius of 400m and an audible beep of around 200m.<br/>
When spawning on an Air beacon, the beacon will spawn you approximately 500m in the air and allow you to guide yourself toward whatever direction you deem appropriate.<br/>
Make sure to open your parachute somewhere between at least 120m in order to avoid falling to your death. Higher speeds while falling may require a higher parachute-opening distance.<br/>
Air beacons produce an audible beep that can be heard from around 100m away, so place them carefully!<br/><br/>
Ground beacons are the significantly safer cousins of the Air beacon, but are substantially rarer, as they are only purchasable in general stores at a cost of $2000 and do not come in any donator loadouts.<br/>
Ground beacons have a block radius of 100m and make an audible beep from approximately the same distance.<br/>
Spawning on a ground beacon will spawn you at ground level with no need for parachute timing.<br/><br/>

Base beacons are a powerful tool vastly underused by players.<br/>
Base beacons are purchasable in general stores at a cost of $8000.<br/>
Base beacons have a radar not unlike a town and alert you to any enemies within a 125m radius of the beacon.<br/>
Spawning on a Base Beacon will spawn you at ground level with no need for parachute timing.<br/>
Base beacons will not allow spawning if an enemy is within a 75m radius.<br/>
WARNING!<br/>
The base beacon will create a white and black marker on the map advertising your position to the rest of the server.<br/>
With great power comes great responsibility, so only use these beacons when you're ready to be attacked!<br/>
The base beacon will allow you, for $100, to redeploy to any location on the map that you can spawn at.<br/>
This is particularly powerful when using two base beacons in conjunction with one another, as it allows you to quickly travel between the two, without the need to repurchase weapons and gear.<br/>
Players have reported that it is possible to carry objects such as ammunition crates and base parts while redeploying, so long as a ground type spawn is chosen.<br/>
Spawning on towns, ground beacons, or base beacons is recommended.<br/>
Spawning on an air beacon, random HALO, or in an air vehicle is not recommended.<br/>
Players report that airborne spawning causes the loss of the carried item.<br/>
"
]
];
player CreateDiaryRecord["Stores",
[
"General Stores Information",
"
<br/>
General stores are available on the map and the follwing items may be purchased<br/>
-Base Beacon (see beacon info)<br/>
-Ground Beacon (see beacon info)<br/>
-Medkits (one time usage restores heath back to full)<br/>
-Repair Kits (one time usage restores vehicle to perfect condition does NOT refuel it)<br/>
-You CANNOT SELL any items in the General stores<br/><br/>

Gun Stores Information<br/>

Gun stores are available on the map and the follwing items may be purchased<br/>
-Weapons(all wepaons are available also on the loadout screen pre spawn)<br/>
-Ammo(all ammo is available also on the loadout screen pre spawn)<br/>
-You CANNOT SELL any items in the gunstores<br/><br/>

Building Stores Information

<br/>
Building stores are available on the map and the follwing items may be purchased<br/>
-Base Parts<br/>
-Static weapons<br/>
-You CANNOT SELL any items in the Building stores<br/><br/>
"
]
];
player CreateDiaryRecord["Wasteland",
[
"WELCOME TO THE WASTELAND",
"
<br/>
Mission is fully based on Stalk and Strike Gaming coding and missions. Special Thanks to their staff.<br/>
We pride ourselves on providing a fun gameplay experience, with an Admin team that cares.<br/>
Our Administration team works diligently to keep our servers well administered.<br/>
Trouble makers are quickly dealt with as the situation calls for.<br/>
This server is supported by donations, enabling us to keep bringing an awesome server to the community.<br/><br/>

FAQ<br/>
Q. Can enemies hear me on side VON?<br/>
A. Yes, even if you're talking in side VON or even vehicle VON if a player is close enough to you they can still hear you talking.<br/>
<br/><br/>
Q. Where can I get a gun?<br/>
A. The best place to buy weapons is from the loadout screen before you spawn, but weapons are also found in multiple places including ammo caches that randomly spawn around the map inside of towns, in the gear section of the vehicles, which also randomly spawn around the map in towns. 
   The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/><br/>
Q. What are the circles on the map?<br/>
A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/><br/>
Q. I saw someone breaking a rule, what do I do?<br/>
A. Join the support chat or Discord Voice Server is the fastest way. http://op4gaming.boards.net/ and click support forum.
<br/><br/>
Q. What's that white castle on the map?
A. That's a base flag and shows the location of a player controlled base, be careful as Base flags get a radar circle like towns notifying them of your presence.
"
]
];