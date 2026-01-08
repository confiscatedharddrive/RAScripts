// Hydro Thunder
// #ID = 322
// RA Hash: 5acf6e8c2d4856de470737a3cb920c03 [USA (Rev 1)]
//          de7338a8ba87c81f155a661897e61654 [EUR]

// Code Notes

// This game uses pointers for much of its memory. Many of these pointers are used in place of static memory,
// and can be used as such. These memory addresses will be thus noted as the 32-bit pointer values they are (8cxxxxxx),
// while still behaving the same as a static value. An exception is made for track data. Starting roughly from 0xd10500
// and ending roughly around 0xD77610 there is a heap where most track data is dynamically allocated. One exception is
// Hydro Speedway, as that specific track moves the heap up by roughly 10,000. Track data varies in the heap, but is always 
// consistent with each playthrough of said track (eg. Thunder Park has specific allocations, Lost Island has others).

// Selection Details
// 0x2942DC: [32-bit] Track Selection

//           Easy:
//           0x8C2943D0: Thunder Park
//           0x8C294420: Lost Island
//           0x8C294470: Arctic Circle

//           Medium:
//           0x8C294380: Greek Isles
//           0x8C294330: Lake Powell
//           0x8C2942E0: The Far East

//           Hard:
//           0x8C2944C0: Ship Graveyard
//           0x8C294510: Venice Canals
//           0x8C294560: N.Y. Disaster

//           Bonus:
//           0x8C2946A0: Castle Von Dandy
//           0x8C294650: Catacomb
//           0x8C294600: Hydro Speedway
//           0x8C2945B0: Nile Adventure

// 0x2946F0: [32-bit] Boat Selection
//           Easy:
//           0x8C2947F0: Damn the Torpedoes
//           0x8C294844: Midway
//           0x8C294898: Miss Behave

//           Medium:
//           0x8C29479C: Banshee
//           0x8C294748: Tidal Blade
//           0x8C2946f4: Thresher

//           Hard:
//           0x8C2948EC: Cutthroat
//           0x8C294940: Rad Hazard
//           0x8C294994: Razorback

//           Bonus:
//           0x8C294AE4: Tinytanic
//           0x8C294A90: Armed Response
//           0x8C294A3C: Blowfish
//           0x8C2949E8: Chumdinger

// 0x294BE0: [8-bit] Game Mode Select
//           0x00: 1 Player
//           0x01: 2 Player

// Race Details
// 0x200AE0: [Bitflag] [Boolean] Race Finished Indicator
//           Becomes true once player has successfully finished a race

// 0x256434: [Float] Speedometer
//           Float value is always +65 more than what is reported on GUI

// 0x25643C: [8-bit] Player Position

// 0x25657C: [8bit] Boat Status
//           0x00: In Water
//           0x01: In Air
//           0x02: Flipping Out

// 0x256630: [8-bit] Boost Speed
//           0x1E: Max Boost

// 0x25742C: [8-bit] Race Status(?)
//           Changes depending on position and status of race
//           0x01: Loading race
//           0x05: Race Countdown + Start
//           0x06: End of race

// 0x2597B8: [Float] Race Timer

// Course-Specific Details
// 0xD1E344: [Bitflag] [Boolean] Thunder Park Bridge Boost

// 0xD10670: [Bitflag] [Boolean] Collision with Tourist Boat in Lost Island

// 0x1AE96C: [Bitflag] [Boolean] [Bitflag] [Boolean] Secret Passage Flag
//           Used in Lost Island, Lake Powell, Ship Graveyard, Venice Canals

// 0xD27744: [Bitflag] [Boolean] Lost Island Hidden Volcano Boost

// 0x1AE98C: [Bitflag] [Boolean] Arctic Circle Secret Ice Tunnel

// 0xD201E4: [Bitflag] [Boolean] Arctic Circle Hidden Boost Behind Polar Bears

// 0xD25984: [Bitflag] [Boolean] Arctic Circle Hidden Boost in Oil Tanker

// 0x1FECC4: [Bitflag] [Boolean] Greek Isles First Waterfall Secret

// 0xD31BA4: [Bitflag] [Boolean] Greek Isles +9 Boost on Second Waterfall

// 0xD0C464: [Bitflag] [Boolean] Lake Powell Starting Ramp Boost

// 0xD13104: [Bitflag] [Boolean] Lake Powell Cave Boost

// 0xD1D264: [Bitflag] [Boolean] Lake Powell Second Cave Hidden Boost

// 0xD0BC24: [Bitflag] [Boolean] Lake Powell Police Bridge Boost

// 0xD12804: [Bitflag] [Boolean] The Far East Secret Starter Area Boost

// 0xD11CA4: [Bitflag] [Boolean] The Far East Hidden Boat Boost

// 0xD22164: [Bitflag] [Boolean] Ship Graveyard Cabin Hidden Boost

// 0xD125C4: [Bitflag] [Boolean] Ship Graveyard Second Waterfall Boost Pickup #1

// 0xD122A4: [Bitflag] [Boolean] Ship Graveyard Second Waterfall Boost Pickup #2

// 0xD1FDC4: [Bitflag] [Boolean] Venice Canals Boost Under Yellow Turning Lights

// 0xD15324: [Bitflag] [Boolean] Venice Canals Boost Between Buildings

// 0xD1CDA4: [Bitflag] [Boolean] Venice Canals Hidden Boost Pickup

// 0xD28824: [Bitflag] [Boolean] N.Y. Disaster Hidden Passage Boost

// 0xD21124: [Bitflag] [Boolean] N.Y. Disaster Subway +9 Boost

// 0xD371A4: [Bitflag] [Boolean] Catacomb Hidden Boost

// 0xD33944: [Bitflag] [Boolean] Catacomb Alcove Hidden Boost

// 0xD32284: [Bitflag] [Boolean] Catacomb +9 Boost Near Pirate Ship

// 0xCF4864: [Bitflag] [Boolean] Hydro Speedway Hidden Boost

// 0xD35C84: [Bitflag] [Boolean] Castle Von Dandy Bell Hidden Boost

// 0xD31DA4: [Bitflag] [Boolean] Castle Von Dandy Graveyard Hidden Boost

// 0xD33864: [Bitflag] [Boolean] Castle Von Dandy Window Hidden Boost

// 0xD0A0A4: [Bitflag] [Boolean] Nile Adventure Hidden Boost

// 0xD10382: [Bitflag] [Boolean] Nile Adventure Mummy Shortcut Hidden Boost


// 0xD78E2C: [32-bit] Game Screen
//           0x8C076806: Title Screen
//           0x8C076C88: Main Menu
//           0x8C08EC8E: Track Selection Screen
//           0x8C08EE86: Boat Selection Screen
//           0x8C03F7BA: Pause Screen

// 0x1EB00D, 0x1FE6BD, 0x25C82D, 0x293ECD: SOMETHING to do with in-game leaderboards

// Achievements

achievement(
    title = "Thunder Park: Qualified",
    description = "Finish the Thunder Park race in 3rd place or above", 
    points = 3, 
    type="progression",
    trigger = 
)

achievement(
    title = "Thunder Park Champion",
    description = "Finish the Thunder Park race in 1st", 
    points = , 
    trigger = 
)

achievement(
    title = "Lost Island: Qualified",
    description = "Finish the Lost Island race in 3rd place or above", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Lost Island Champion",
    description = "Finish the Lost Island race in 1st place", 
    points = , 
    trigger = 
)

achievement(
    title = "Arctic Circle: Qualified",
    description = "Finish the Arctic Circle race in 3rd place or above", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Arctic Circle Champion",
    description = "Finish the Arctic Circle race in 1st place", 
    points = , 
    trigger = 
)

achievement(
    title = "Greek Isles: Qualified",
    description = "Finish the Greek Isles race in 2nd place or above", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Greek Isles Champion",
    description = "Finish the Greek Isles race in 1st place", 
    points = , 
    trigger = 
)

achievement(
    title = "Lake Powell: Qualified",
    description = "Finish the Lake Powell race in 2nd place or above", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Lake Powell Champion",
    description = "Finish the Lake Powell race in 1st place", 
    points = , 
    trigger = 
)


achievement(
    title = "The Far East: Qualified",
    description = "Finish the Far East race in 2nd place or above", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "The Far East Champion",
    description = "Finish the Far East race in 1st place", 
    points = , 
    trigger = 
)

achievement(
    title = "Ship Graveyard Champion",
    description = "Finish the Ship Graveyard race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Venice Canals Champion",
    description = "Finish the Venice Canals race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "N.Y. Disaster Champion",
    description = "Finish the N.Y. Disaster race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Castle Von Dandy Champion",
    description = "Finish the Castle Von Dandy race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Catacomb Champion",
    description = "Finish the Catacomb race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Hydro Speedway Champion",
    description = "Finish the Hydro Speedway race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Nile Adventure Champion",
    description = "Finish the Nile Adventure race in 1st place", 
    points = , 
    type="progression",
    trigger = 
)

achievement(
    title = "Learn 2 Hydro Jump",
    description = "Grab the boost on the bridge in Thunder Park", 
    points = 1, 
    trigger = 
)

achievement(
    title = "Scorched Skipper",
    description = "Grab the hidden boost in the volcano in Lost Island",
    points = ,
    trigger =
)

achievement(
    title = "Ice Cold Tour",
    description = "Grab the polar bear boost and hidden boost in the Oil Tanker in Arctic Circle",
    points = ,
    trigger =
)

achievement(
    title = "Always Look Behind Waterfalls",
    description = "Grab the hidden waterfall boost and the second waterfall boost in Greek Isles",
    points = ,
    trigger =
)

achievement(
    title = "Utah's Most Wanted",
    description = "Grab the hidden boost in the cave and the boost off the police bridge in Lake Powell",
    points = ,
    trigger =
)

achievement(
    title = "Learn 2 Super Boost Start",
    description = "Grab the hidden boost in the cave at the start of The Far East", 
    points = 10, 
    trigger = 
)

achievement(
    title = "Dragon Boat Dance",
    description = "Grab the hidden boost in the Dragon Boat whilst doing a flip in The Far East",
    points = ,
    trigger =
)

achievement(
    title = "Ship Graveyard Crash Tour",
    description = "Grab the hidden boost in the Cabin and both boosts in the second waterfall in Ship Graveyard",
    points = ,
    trigger =
)


achievement(
    title = "The (Speedy) Scenic Route",
    description = "Grab the +4 boost behind the yellow turning lights, the +9 boost between the buildings, the hidden chandelier boost,
                   and take the shortcut in the sewers in Venice Canals",
    points = ,
    trigger =
)

achievement(
    title = "New York Tricks",
    description = "Grab the +9 boost in the hidden passageway and the boost on the subway platform in N.Y. Disaster",
    points = ,
    trigger =
)

achievement(
    title = "Catacomb Explorer",
    description = "Grab both hidden boosts and the +9 boost near the pirate ship in Catacomb",
    points = ,
    trigger =
)

achievement(
    title = "Take the Bait",
    description = "Grab the hidden boost in Hydro Speedway",
    points = ,
    trigger =
)

achievement(
    title = "A Royal Pain",
    description = "Grab all 3 hidden boosts in Castle Von Dandy without flipping the boat",
    points = ,
    trigger =
)

achievement(
    title = "Tomb Racer",
    description = "Grab both +9 hidden boosts in Nile Adventure",
    points = ,
    trigger =
)

achievement(
    title = "Speedy Breezy",
    description = "Win 3rd place or higher on any Easy race in first person mode",
    points = ,
    trigger =
)

achievement(
    title = "Cruisin' On",
    description = "Win 3rd place or higher on any Medium race in first person mode",
    points = ,
    trigger =
)

achievement(
    title = "Rough Waves",
    description = "Win 3rd place or higher on any Hard race in first person mode",
    points = ,
    trigger =
)

achievement(
    title = "Sea Sickness",
    description = "Win 3rd place or higher on any Bonus race in first person mode",
    points = ,
    trigger =
)

achievement(
    title = "",
    description = "Set a 1st place record for x", // Repeat for each track
    points = ,
    trigger =
)

achievement(
    title = "Crazy Boat",
    description = "Smash into your rivals 5 times in a single race", // If dynamic hit detection can be figured out
    points = ,
    trigger =
)

