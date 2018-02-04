// @file Version: 1.0
// @file Name: briefing.sqf
// @file Author: TheDA, Nash
// @file Created: 18th Aug 15
// @file Updated: 2nd Feb 18, Danny Dorito

// use <br/> tags to separate lines  
// To add new items
//
// player createDiaryRecord["x",
// [
// "Name of entry",
// "
// player createDiarySubject ["OP4 Squad", "Information"];

player createDiarySubject ["OP4 Squad", "Information"];
player createDiarySubject ["Beacons", "Beacons"];
player createDiarySubject ["Stores", "Stores"];
player createDiarySubject ["Wasteland", "What is Wasteland?"];

player createDiaryRecord["OP4 Squad",
[
"Staff",
"
<br/>
- See our website for a updated staff list!<br/><br/>
"
]
];

player createDiaryRecord["OP4 Squad",
[
"Teamspeak",
"
<br/>
- op4squad.teamspeakcp.com<br/><br/>
- Insufficient security level can be improved in the identity menu (CTRL+I)<br/><br/>
- Please join and say hello! (Please speak English)<br/><br/>
"
]
];

player createDiaryRecord["OP4 Squad",
[
"Reporting Issues",
"
<br/>
- No 'Hackusations': If you suspect a hacker, do not accuse them over side.<br/>
- Take screenshots or video evidence, then contact a staff member.<br/>
- If you contact us on chat, we will be able to monitor the player. When you provide proof, we can go review it and issue punishment.<br/><br/>
- Please report it at: op4squad.com and click support forum, or on Teamspeak.<br/><br/>
"
]
];

player createDiaryRecord["Wasteland",
[
"Hints & Tips",
"
<br/>
- At the start of the game, spread out and find supplies because supplies are valuable<br/><br/>
- Players randomly spawn in and around towns and could even spawn inside your base, should you set it up in a town.<br/><br/>
- If you perform a ground insertion, you will be automatically placed near a vehicle.<br/><br/>
- When you set up a base, never leave your supplies unguarded!<br/><br/>
There are missions with hostile AI which will protect the mission, be aware of them<br/><br/>
Vehicles deployed from your inventory will despawn if you move more than 100m away from them<br/><br/>
"
]
];

player CreateDiaryRecord["Beacons",
[
"Beacon Information",
"
<br/>
- There are 3 types of beacons; Air, Ground, and Base.<br/>
- Block radius is the minimum distance an enemy has to be to block player spawning<br/>
- Air Beacons are purchased General Stores<br/>
- Air Beacons have a block radius of 400m and an audible beep of around 200m<br/>
- When spawning on an Air beacon, the beacon will spawn you approximately 500m in the air<br/>
- Make sure to open your parachute least 120m from the ground to avoid death death<br/>
- Higher speeds while falling may require a higher parachute-opening distance.<br/>
- Air Beacons make a noise that can be heard from around 100m away, so place them carefully!<br/>
- Ground beacons are purchased in General Stores<br/>
- Ground beacons have a block radius of 100m and make an audible beep from approximately the same distance<br/>

- Base beacons are purchased in General Stores.<br/>
- Base beacons have a radar and alert you to any enemies within a 125m radius.<br/>
- Spawning on a Base Beacon will spawn you at ground level with no need for parachute timing.<br/>
- Base beacons will not allow spawning if an enemy is within a 75m radius.<br/>
- The Base beacon will create a marker on the map showing your position to the rest of the server.<br/>
- For $100 you can redeploy to any spawnable location<br/>
"
]
];

player CreateDiaryRecord["Stores",
[
"General Store Information",
"
<br/>
General Stores are available on the map and the following items may be purchased<br/>
- Base Beacon<br/>
- Ground Beacon<br/>
- Medkits (one time use, reStores heath back to full)<br/>
- Repair Kits (one time use, reStores vehicle to full health)<br/>
- You cannot sell any items in the General Stores<br/><br/>
"
"General Store Information",
"
<br/>
Gun Stores are available on the map and the following items may be purchased<br/>
- Weapons<br/>
- Ammo(all ammo is available also on the loadout screen before spawning)<br/>
- All Weapons and Ammo is available on the pre spawn screen
- You cannot sell any items in the Gun Stores<br/><br/>
"
"Building Store Information",
"
<br/>
Building Stores are available on the map and the following items may be purchased<br/>
- Base Parts<br/>
- Static weapons<br/>
- You cannot sell any items in the Building Stores<br/><br/>
"
]
];

player CreateDiaryRecord["Wasteland",
[
"Welcome to Wasteland",
"
<br/>
- Mission is based on Stalk and Strike Gaming coding and missions. Special Thanks to their staff.<br/>
- Our Administration team works diligently to keep our servers well administered.<br/>
- Trouble makers are quickly dealt with as the situation calls for.<br/>
- This server is supported by donations, enabling us to keep bringing an awesome server to the community!<br/><br/>
"
]
];