// Hydro Thunder
// #ID = 322
// RA Hash: 5acf6e8c2d4856de470737a3cb920c03 [USA (Rev 1)]
//          de7338a8ba87c81f155a661897e61654 [EUR]

// Code Notes

// This game uses pointers for much of its memory. Many of these pointers are used in place of static memory,
// and can be used as such. These memory addresses will be thus noted as the 24-bit pointer values they are (8cxxxxxx),
// while still behaving the same as a static value. An exception is made for track data. Starting roughly from 0xd10500
// and ending roughly around 0xD77610 there is a heap where most track data is dynamically allocated. One exception is
// Hydro Speedway, as that specific track moves the heap up by roughly 10,000. Track data varies in the heap, but is always 
// consistent with each playthrough of said track (eg. Thunder Park has specific allocations, Lost Island has others).

// Selection Details
// 0x2942DC: [24-bit] Track Selection

//           Easy:
//           0x2943D0: Thunder Park
//           0x294420: Lost Island
//           0x294470: Arctic Circle

//           Medium:
//           0x294380: Greek Isles
//           0x294330: Lake Powell
//           0x2942E0: The Far East

//           Hard:
//           0x2944C0: Ship Graveyard
//           0x294510: Venice Canals
//           0x294560: N.Y. Disaster

//           Bonus:
//           0x2946A0: Castle Von Dandy
//           0x294650: Catacomb
//           0x294600: Hydro Speedway
//           0x2945B0: Nile Adventure
Track = tbyte(0x2942DC)

ThunderPark = 0x2943D0
LostIsland = 0x294420
ArcticCircle = 0x294470
GreekIsles = 0x294380
LakePowell = 0x294330
TheFarEast = 0x2942E0
ShipGraveyard = 0x2944C0
VeniceCanals = 0x294510
NYDisaster = 0x294560
CastleVonDandy = 0x2946A0
Catacomb = 0x294650
HydroSpeedway = 0x294600
NileAdventure = 0x2945B0

// 0x2946F0: [24-bit] Boat Selection
//           Easy:
//           0x2947F0: Damn the Torpedoes
//           0x294844: Midway
//           0x294898: Miss Behave

//           Medium:
//           0x29479C: Banshee
//           0x294748: Tidal Blade
//           0x2946f4: Thresher

//           Hard:
//           0x2948EC: Cutthroat
//           0x294940: Rad Hazard
//           0x294994: Razorback

//           Bonus:
//           0x294AE4: Tinytanic
//           0x294A90: Armed Response
//           0x294A3C: Blowfish
//           0x2949E8: Chumdinger
Boat = tbyte(0x2946F0)

Tinytanic = 0x294AE4
ArmedResponse = 0x294A90
Blowfish = 0x294A3C
Chumdinger = 0x2949E8

// 0x294BE0: [8-bit] Game Mode Select
//           0x00: 1 Player
//           0x01: 2 Player
Players = byte(0x294BE0)
function ModeCheck() => Players == 0

// Race Details

// 0x1E0C9C: [Bitflag] [Boolean] In-Race Indicator
//           Turns false at exact frame of results screen
InRace = bit0(0x1E0C9C)

True = 0x01
function RaceEnd() => prev(bit0(0x1E0C9C)) == 1 && bit0(0x1E0C9C) == 0

// 0x1FC98C: [8-bit] Camera Mode
//           0x00: First Person
//           0x01: Default
//           0x02: Wide View
Camera = 0x1FC98C

FirstPerson = 0x00
function ViewCheck() => unless(repeated(x, once(Camera != FirstPerson))) // Add frame count until countdown ends as buffer to switch modes

// 0x200AE0: [Bitflag] [Boolean] Race Finished Indicator
//           Becomes true once player has successfully finished a race
function Finish() => prev(bit0(0x200AE0)) == 0 && bit0(0x200AE0) == 1

// 0x256434: [Float] Speedometer
//           Float value is always +65 more than what is reported on GUI

// 0x25643C: [8-bit] Player Position
Position = byte(0x25643C)

// 0x25644C: [Float] In-Game LB Time Submission
//           Race time that is used during victory screens and in-game leaderboard recordings.
function FinalTime() => float(0x25644C) * 100

// 0x256340: [Bitflag] [Boolean] Boat Smashed
//           Turns true when bashing into rival boats, buoys, or passerby boats while boosting in any race
function SmashCount() => prev(bit0(0x256340)) == 0 && bit0(0x256340) == 1

// 0x25657C: [8bit] Boat Status
//           0x00: In Water
//           0x01: In Air
//           0x02: Flipping Out
Status = byte(0x25657C)

Flipping = 0x02

// 0x256630: [8-bit] Boost Speed
//           0x1E: Max Boost

// 0x25742C: [8-bit] Race Status(?)
//           Changes depending on position and status of race
//           0x01: Loading race
//           0x05: Race Countdown + Start
//           0x06: End of race

// 0x2597B8: [Float] Race Timer
Time = float(0x2597B8)

// Course-Specific Details
// 0xD1E344: [Bitflag] [Boolean] Thunder Park Bridge Boost
function ThunderBoostGet() => prev(bit0(0xD1E344)) == 0 && bit0(0xD1E344) == 1

// 0x1AE96C: [Bitflag] [Boolean] [Bitflag] [Boolean] Secret Passage Flag
//           Used in Lost Island, Lake Powell, Ship Graveyard, Venice Canals
function Secret() => prev(bit0(0x1AE96C)) == 0 && bit0(0x1AE96C) == 1

// 0xD27744: [Bitflag] [Boolean] Lost Island Hidden Volcano Boost
function LostIslandBoostGet() => prev(bit0(0xD27744)) == 0 && bit0(0xD27744) == 1

// 0x1AE98C: [Bitflag] [Boolean] Arctic Circle Secret Ice Tunnel

// 0xD201E4: [Bitflag] [Boolean] Arctic Circle Hidden Boost Behind Polar Bears

// 0xD25984: [Bitflag] [Boolean] Arctic Circle Hidden Boost in Oil Tanker
function ArcticCircleBoostGet() => measured(tally(2, once(Track == ArcticCircle && prev(bit0(0xD201E4)) == 0 && bit0(0xD201E4) == 1),
once(Track == ArcticCircle && prev(bit0(0xD25984)) == 0 && bit0(0xD25984) == 1)))

// 0x1FECC4: [Bitflag] [Boolean] Greek Isles First Waterfall Secret

// 0xD31BA4: [Bitflag] [Boolean] Greek Isles +9 Boost on Second Waterfall
function GreekIslesBoostGet() => measured(tally(2, once(Track == GreekIsles && prev(bit0(0x1FECC4)) == 0 && bit0(0x1FECC4) == 1),
once(Track == GreekIsles && prev(bit0(0xD31BA4)) == 0 && bit0(0xD31BA4) == 1)))

// 0xD0C464: [Bitflag] [Boolean] Lake Powell Starting Ramp Boost

// 0xD13104: [Bitflag] [Boolean] Lake Powell Cave Boost

// 0xD1D264: [Bitflag] [Boolean] Lake Powell Second Cave Hidden Boost

// 0xD0BC24: [Bitflag] [Boolean] Lake Powell Police Bridge Boost
function LakePowellBoostGet() => measured(tally(2, once(Track == LakePowell && prev(bit0(0xD1D264)) == 0 && bit0(0xD1D264) == 1),
once(Track == LakePowell && prev(bit0(0xD0BC24)) == 0 && bit0(0xD0BC24) == 1)))

// 0xD12804: [Bitflag] [Boolean] The Far East Secret Starter Area Boost
function FarEastSuperBoostGet() => prev(bit0(0xD12804)) == 0 && bit0(0xD12804) == 1

// 0xD11CA4: [Bitflag] [Boolean] The Far East Hidden Boat Boost
function FarEastBoostGet() => prev(bit0(0xD11CA4)) == 0 && bit0(0xD11CA4) == 1

// 0xD22164: [Bitflag] [Boolean] Ship Graveyard Cabin Hidden Boost

// 0xD125C4: [Bitflag] [Boolean] Ship Graveyard Second Waterfall Boost Pickup #1

// 0xD122A4: [Bitflag] [Boolean] Ship Graveyard Second Waterfall Boost Pickup #2
function ShipGraveyardBoostGet() => measured(tally(3, once(Track == ShipGraveyard && prev(bit0(0xD22164)) == 0 && bit0(0xD22164) == 1),
once(Track == ShipGraveyard && prev(bit0(0xD125C4)) == 0 && bit0(0xD125C4) == 1), 
once(Track == ShipGraveyard && prev(bit0(0xD122A4)) == 0 && bit0(0xD122A4) == 1)))

// 0xD1FDC4: [Bitflag] [Boolean] Venice Canals Boost Under Yellow Turning Lights

// 0xD15324: [Bitflag] [Boolean] Venice Canals Boost Between Buildings

// 0xD1CDA4: [Bitflag] [Boolean] Venice Canals Hidden Boost Pickup
function VeniceCanalsBoostGet() => measured(tally(3, once(Track == VeniceCanals && prev(bit0(0xD1FDC4)) == 0 && bit0(0xD1FDC4) == 1),
once(Track == VeniceCanals && prev(bit0(0xD15324)) == 0 && bit0(0xD15324) == 1), 
once(Track == VeniceCanals && prev(bit0(0xD1CDA4)) == 0 && bit0(0xD1CDA4) == 1)))

// 0xD28824: [Bitflag] [Boolean] N.Y. Disaster Hidden Passage Boost

// 0xD21124: [Bitflag] [Boolean] N.Y. Disaster Subway +9 Boost
function NYDisasterBoostGet() => measured(tally(2, once(Track == NYDisaster && prev(bit0(0xD21124)) == 0 && bit0(0xD21124) == 1),
once(Track == NYDisaster && prev(bit0(0xD28824)) == 0 && bit0(0xD28824) == 1)))

// 0xD371A4: [Bitflag] [Boolean] Catacomb Hidden Boost

// 0xD33944: [Bitflag] [Boolean] Catacomb Alcove Hidden Boost

// 0xD32284: [Bitflag] [Boolean] Catacomb +9 Boost Near Pirate Ship
function CatacombBoostGet() => measured(tally(3, once(Track == Catacomb && prev(bit0(0xD371A4)) == 0 && bit0(0xD371A4) == 1),
once(Track == Catacomb && prev(bit0(0xD33944)) == 0 && bit0(0xD33944) == 1), 
once(Track == Catacomb && prev(bit0(0xD32284)) == 0 && bit0(0xD32284) == 1)))

// 0xCF4864: [Bitflag] [Boolean] Hydro Speedway Hidden Boost
function HydroSpeedwayBoostGet() => prev(bit0(0xCF4864)) == 0 && bit0(0xCF4864) == 1

// 0xD35C84: [Bitflag] [Boolean] Castle Von Dandy Bell Hidden Boost

// 0xD31DA4: [Bitflag] [Boolean] Castle Von Dandy Graveyard Hidden Boost

// 0xD33864: [Bitflag] [Boolean] Castle Von Dandy Window Hidden Boost
function CastleVonDandyBoostGet() => measured(tally(3, once(Track == CastleVonDandy && prev(bit0(0xD35C84)) == 0 && bit0(0xD35C84) == 1),
once(Track == CastleVonDandy && prev(bit0(0xD31DA4)) == 0 && bit0(0xD31DA4) == 1), 
once(Track == CastleVonDandy && prev(bit0(0xD33864)) == 0 && bit0(0xD33864) == 1)))

// 0xD0A0A4: [Bitflag] [Boolean] Nile Adventure Hidden Boost

// 0xD10382: [Bitflag] [Boolean] Nile Adventure Mummy Shortcut Hidden Boost
function NileAdventureBoostGet() => measured(tally(2, once(Track == NileAdventure && prev(bit0(0xD0A0A4)) == 0 && bit0(0xD0A0A4) == 1),
once(Track == NileAdventure && prev(bit0(0xD10382)) == 0 && bit0(0xD10382) == 1)))

// 0xD78E2C: [24-bit] Game Screen
//           0x076806: Title Screen
//           0x076C88: Main Menu
//           0x08EC8E: Track Selection Screen
//           0x08EE86: Boat Selection Screen
//           0x03F7BA: Pause Screen/Leaderboard
//           0x000000: In Race
Screen = tbyte(0xD78E2C)

Title = 0x076806
MainMenu = 0x076C88
TrackSelect = 0x08EC8E
BoatSelect = 0x08EE86
Pause = 0x03F7BA

// 0x1FE66C: [ASCII | 1121 Bytes] Leaderboard
//           Leaderboard info for all tracks in the game. Updates in real time from file load.
//           +0x321: Thunder Park #1 Spot
//           +0x51: Lost Island #1 Spot
//           +0x141: Arctic Circle #1 Spot
//           +0x231: Greek Isles #1 Spot
//           +0xF1: Lake Powell #1 Spot
//           +0x281: The Far East #1 Spot
//           +0x1: Ship Graveyard #1 Spot
//           +0xA1: Venice Canals #1 Spot
//           +0x1E1: N.Y. Disaster #1 Spot
//           +0x3C1: Castle Von Dandy #1 Spot
//           +0x411: Catacomb #1 Spot
//           +0x371: Hydro Speedway #1 Spot
//           +0x191: Nile Adventure #1 Spot

// 0x1FEE04: [Float] Final Race Time
//           Temp storage of final race time. Accurate to the timer in the top-left corner during gameplay

// Achievements

achievement(
    title = "Thunder Park: Qualified",
    description = "Finish the Thunder Park race in 3rd place or above", 
    points = 2, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == ThunderPark &&
        Position <= 3 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Thunder Park Champion",
    description = "Finish the Thunder Park race in 1st", 
    points = 3, 
    trigger = 
        ModeCheck() &&
        Track == ThunderPark &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Lost Island: Qualified",
    description = "Finish the Lost Island race in 3rd place or above", 
    points = 3, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == LostIsland &&
        Position <= 3 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Lost Island Champion",
    description = "Finish the Lost Island race in 1st place", 
    points = 5, 
    trigger = 
        ModeCheck() &&
        Track == LostIsland &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Arctic Circle: Qualified",
    description = "Finish the Arctic Circle race in 3rd place or above", 
    points = 3, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == ArcticCircle &&
        Position <= 3 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Arctic Circle Champion",
    description = "Finish the Arctic Circle race in 1st place", 
    points = 5, 
    trigger = 
        ModeCheck() &&
        Track == ArcticCircle &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Greek Isles: Qualified",
    description = "Finish the Greek Isles race in 2nd place or above", 
    points = 5, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == GreekIsles &&
        Position <= 2 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Greek Isles Champion",
    description = "Finish the Greek Isles race in 1st place", 
    points = 10, 
    trigger = 
        ModeCheck() &&
        Track == GreekIsles &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Lake Powell: Qualified",
    description = "Finish the Lake Powell race in 2nd place or above", 
    points = 5, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == LakePowell &&
        Position <= 2 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Lake Powell Champion",
    description = "Finish the Lake Powell race in 1st place", 
    points = 10, 
    trigger = 
        ModeCheck() &&
        Track == LakePowell &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "The Far East: Qualified",
    description = "Finish the Far East race in 2nd place or above", 
    points = 5, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == TheFarEast &&
        Position <= 2 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "The Far East Champion",
    description = "Finish the Far East race in 1st place", 
    points = 10, 
    trigger = 
        ModeCheck() &&
        Track == TheFarEast &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Ship Graveyard Champion",
    description = "Finish the Ship Graveyard race in 1st place", 
    points = 10, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == ShipGraveyard &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Venice Canals Champion",
    description = "Finish the Venice Canals race in 1st place", 
    points = 10, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == VeniceCanals &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "N.Y. Disaster Champion",
    description = "Finish the N.Y. Disaster race in 1st place", 
    points = 10, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == NYDisaster &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Castle Von Dandy Champion",
    description = "Finish the Castle Von Dandy race in 1st place", 
    points = 10, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == CastleVonDandy &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Catacomb Champion",
    description = "Finish the Catacomb race in 1st place", 
    points = 10, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == Catacomb &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Hydro Speedway Champion",
    description = "Finish the Hydro Speedway race in 1st place", 
    points = 10, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == HydroSpeedway &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Nile Adventure Champion",
    description = "Finish the Nile Adventure race in 1st place", 
    points = 25, 
    type="progression",
    trigger = 
        ModeCheck() &&
        Track == NileAdventure &&
        Position == 1 &&
        RaceEnd() &&
        Finish()
)

achievement(
    title = "Learn 2 Hydro Jump",
    description = "Grab the boost on the bridge in Thunder Park", 
    points = 1, 
    trigger = 
        ModeCheck() &&
        InRace == True &&
        Track == ThunderPark &&
        ThunderBoostGet()
)

achievement(
    title = "Scorched Skipper",
    description = "Grab the hidden boost in the volcano in Lost Island",
    points = 1,
    trigger =
        ModeCheck() &&
        InRace == True &&
        Track == LostIsland &&
        LostIslandBoostGet()
)

achievement(
    title = "Ice Cold Tour",
    description = "Grab the polar bear boost and hidden boost in the Oil Tanker in Arctic Circle",
    points = 2,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        ArcticCircleBoostGet()
)

achievement(
    title = "Always Look Behind Waterfalls",
    description = "Grab the hidden waterfall boost and the second waterfall boost in Greek Isles",
    points = 2,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        GreekIslesBoostGet()
)

achievement(
    title = "Utah's Most Wanted",
    description = "Grab the hidden boost in the cave and the boost off the police bridge in Lake Powell",
    points = 2,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        LakePowellBoostGet()
)

achievement(
    title = "Learn 2 Super Boost Start",
    description = "Grab the hidden boost in the cave at the start of The Far East", 
    points = 10, 
    trigger = 
        ModeCheck() &&
        InRace == True &&
        Track == TheFarEast &&
        FarEastSuperBoostGet()
)

achievement(
    title = "Dragon Boat Dance",
    description = "Grab the hidden boost in the Dragon Boat whilst doing a flip in The Far East",
    points = 3,
    trigger =
        ModeCheck() &&
        InRace == True &&
        Track == TheFarEast &&
        Status == Flipping &&
        FarEastBoostGet()
)

achievement(
    title = "Ship Graveyard Crash Tour",
    description = "Grab the hidden boost in the Cabin and both boosts in the second waterfall in Ship Graveyard",
    points = 2,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        ShipGraveyardBoostGet()
)

achievement(
    title = "The (Speedy) Scenic Route",
    description = "Grab the +4 boost behind the yellow turning lights, the +9 boost between the buildings, the hidden chandelier boost,
                   and take the shortcut in the sewers in Venice Canals",
    points = 4,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        VeniceCanalsBoostGet() &&
        Secret()
)

achievement(
    title = "New York Tricks",
    description = "Grab the +9 boost in the hidden passageway and the boost on the subway platform in N.Y. Disaster",
    points = 3,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        NYDisasterBoostGet()
)

achievement(
    title = "Catacomb Explorer",
    description = "Grab both hidden boosts and the +9 boost near the pirate ship in Catacomb",
    points = 4,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        CatacombBoostGet()
)

achievement(
    title = "Take the Bait",
    description = "Grab the hidden boost in Hydro Speedway",
    points = 1,
    trigger =
        ModeCheck() &&
        InRace == True &&
        Track == HydroSpeedway &&
        HydroSpeedwayBoostGet()
)

achievement(
    title = "A Royal Pain",
    description = "Grab all 3 hidden boosts in Castle Von Dandy without flipping the boat",
    points = 5,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        never(Status == Flipping) &&
        CastleVonDandyBoostGet()
)

achievement(
    title = "Tomb Racer",
    description = "Grab both +9 hidden boosts in Nile Adventure",
    points = 10,
    trigger =
        ModeCheck() &&
        never(InRace != True) &&
        NileAdventureBoostGet()
)

achievement(
    title = "Speedy Breezy",
    description = "Win 3rd place or higher on any Easy race in first person mode",
    points = 3,
    trigger =
)

achievement(
    title = "Cruisin' On",
    description = "Win 3rd place or higher on any Medium race in first person mode",
    points = 4,
    trigger =
)

achievement(
    title = "Rough Waves",
    description = "Win 3rd place or higher on any Hard race in first person mode",
    points = 5,
    trigger =
)

achievement(
    title = "Sea Sickness",
    description = "Win 3rd place or higher on any Bonus race in first person mode",
    points = 10,
    trigger =
)

achievement(
    title = "Crazy Boat",
    description = "Smash your boat into rivals, buyoys, or passerby 15 times in a single race",
    points = 5,
    trigger = 
        ModeCheck() &&
        never(InRace != True) &&
        measured(repeated(15, SmashCount()))
)

achievement(
    title = "Inverse Relations",
    description = "Finish the Arctic Circle Race in 1st place using the Tinytanic boat",
    points = ,
    trigger =
)

achievement(
    title = "Survivorship Bias",
    description = "Finish the N.Y. Disaster Race in 1st place using the Blowfish boat",
    points = ,
    trigger =
)

achievement(
    title = "Dog Day Afternoon",
    description = "Finish the Nile Adventure Race in 1st place using the Chumdinger boat",
    points = ,
    trigger =
)

achievement(
    title = "Turncoat Boat",
    description = "Finish the Lake Powell Race in 1st place using the Armed Response boat",
    points = ,
    trigger =
)

// Leaderboards

leaderboard(
    title = "H.T.R.A. Ambassador - Thunder Park",
    description = "Finish Thunder Park as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == ThunderPark &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Lost Island",
    description = "Finish Lost Island as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == LostIsland &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Arctic Circle",
    description = "Finish Arctic Circle as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == ArcticCircle &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Greek Isles",
    description = "Finish Greek Isles as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == GreekIsles &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Lake Powell",
    description = "Finish Lake Powell as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == LakePowell &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - The Far East",
    description = "Finish The Far East as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == TheFarEast &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Ship Graveyard",
    description = "Finish Ship Graveyard as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == ShipGraveyard &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Venice Canals",
    description = "Finish Venice Canals as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == VeniceCanals &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - N.Y. Disaster",
    description = "Finish N.Y. Disaster as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == NYDisaster &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Catacomb",
    description = "Finish Catacomb as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == Catacomb &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Hydro Speedway",
    description = "Finish Hydro Speedway as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == HydroSpeedway &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Castle Von Dandy",
    description = "Finish Castle Von Dandy as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == CastleVonDandy &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)

leaderboard(
    title = "H.T.R.A. Ambassador - Nile Adventure",
    description = "Finish Nile Adventure as fast as possible!",
    start  = 
            ModeCheck() &&
            Track == NileAdventure &&
            RaceEnd() &&
            Finish(),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            measured(FinalTime()),
    format = "MILLISECS", lower_is_better = true
)