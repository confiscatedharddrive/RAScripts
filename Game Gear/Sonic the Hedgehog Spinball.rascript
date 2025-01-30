///Code cleanup TBD for clarity and ease of reading

// Sonic the Hedgehog Spinball
// #ID = 12650
// RA Hash: 8e3b44fda375ad9748b678e9c6b45502

// Code Notes (to be added)

// 0x0731: [BitCount] Player Input
//         Bit0: Up
//         Bit1: Down
//         Bit2: Left
//         Bit3: Right
//         Bit4: Button 1
//         Bit5: Button 2

// 0x0884: [8-bit] Level/Room Indicator
//         0x00: Toxic Pools
//         0x01: Toxic Pools Boss
//         0x02: Lava Powerhouse
//         0x03: Lava Powerhouse Boss
//         0x04: The Machine
//         0x05: The Machine Boss
//         0x06: Final Showdown
//         0x07: Final Showdown Boss
//         0x08: Cutscene focused on volcano (opening and ending)
//         0x09: Cutscene with Sonic and Tails
//         0x0a: Bonus Cage (same value used for all 3)
function table() => byte(0x000884)
function toxic_pools_boss() => byte(0x000884) == 1
function lava_powerhouse_boss() => byte(0x000884) == 3
function the_machine_boss() => byte(0x000884) == 5
function final_showdown_boss() => byte(0x000884) == 7
function cutscene() => byte(0x000884) == 8

// 0x0A26: [8-bit] Player Status
//         0xff: Control disabled/Level screen transition
//         0x00: Control enabled
//         0x01: Continue screen

// 0x1A51: [8-bit] Demo 1
//         0x00: Inactive
//         0x01: Active
// 0x1A54: [8-bit] Demo 2
//         0x00: Inactive
//         0x01: Active
function demo1_active() => byte(0x001A51) == 1
function demo2_active() => byte(0x001A54) == 1

// 0x1E97: [8-bit] Difficulty
//         0x00: Easy
//         0x01: Normal
function difficulty_check() => byte(0x001E97) == 1

// 0x1E96: [8-bit] Options Menu Continues
//         0x03: 3 continues
//         0x05: 5 continues (default)
//         0x07: 7 continues
function continues_check() => byte(0x001E96) == 5

// 0x1A43: [8-bit] Sound Test Codes
//         0x00: Inactive
//         0x01: Message Box
//         0x02: Birthday Message
//         0x06: Level Skip Active/Giant Sprites (shared value)
//         0x07: Fast BGM
//         0x08: Float Cheat                     
function levelskip_cheat_active() => byte(0x001A43)
function float_cheat_active() => byte(0x001A43)
function cheat_detection() =>
    unless(levelskip_cheat_active() == 1) ||
    unless(float_cheat_active() == 1)

// 0x0B27: [8-bit] Current Stage
//         0x00: Toxic Pools/Cutscene/Boss room
//         0x08: Bonus Cage 1
//         0x01: Lava Powerhouse
//         0x10: Bonus Cage 2
//         0x02: The Machine
//         0x20: Bonus Cage 3
//         0x04: Final Showdown/Level Splash Screen
function toxic_pools() => byte(0x000B27) == 0
function lava_powerhouse() => byte(0x000B27) == 1
function the_machine() => byte(0x000B27) == 2
function final_showdown() => byte(0x000B27) == 4
function bonus_cage_1() => byte(0x000B27) == 8
function bonus_cage_2() => byte(0x000B27) == 10
function bonus_cage_3() => byte(0x000B27) == 20

// 0x1E98: [8-bit] Chaos Emerald Acquired
//         [Toxic Pools & Lava Powerhouse]
//         0x01: First Emerald
//         0x02: Second Emerald
//         0x03: Third Emerald
//         [The Machine & Final Showdown]
//         0x04: First Emerald
//         0x05: Second Emerald
//         0x06: Third Emerald
//         0x07: Fourth Emerald
//         0x08: Fifth Emerald
function chaos_emerald() => byte(0x001E98)

// 0x1E19: [8-bit] Ticker
//         0x4f: Message Box Get
//         0xda: Pause Ticker
//         0x4c, 0x4d, 0x4e: Chaos Emerald Get
//         0x5c: Credits
function game_clear() => byte(0x001E19) == 92

// 0x1A16: [8-bit] Lives Count
//         Integer value equal to current life count (ex. 0x05 = 5 lives, 0x04 = 4 lives, etc)
//         If game over bonus is reached, an extra life is granted (0x00 -> 0x01)
function lives() => byte(0x001A16)

// 0x14B2: [8-bit] Secret Monitor Status
//         0x80: Available in stage and unopen
//         0x40: Opened
function secret_1() => byte(0x0014B2)

// 0x14B3: [8-bit] Location Indicator/Monitor Broken(?)
//         Seems to update depending on where you are in the map and whether or not the 1up box has been opened.
//         0x80: In secret area or boss room/1up Monitor unopened
//         0x40: 1up box opened
function secret_2() => byte(0x0014B3)

// 0x14B4: [8-bit] Third Item Box
//         Value is used for 1up monitor in Lava Powerhouse. The continue box takes the place of the usual 1up value in 0x014B3
//         0x80: Not open
//         0x40: Open
function secret_3() => byte(0x0014B4)

// 0x1A18: [8-bit BCD] Cumulative Score (per 1 mil)
//         Increments every 1 million earned. Ex:
//         0x01: 1 million
//         0x04: 4 million
function score_millions() => byte(0x001A18)

// 0x1A19: [8-bit BCD] Cumulative Score (per 10k)
//         Increments per ten thousand. Ex:
//         0x03: 30000 points
//         0x11: 110000 points
function score_ten_thousands() => byte(0x001A19)

// 0x1A1A: [8-bit BCD] Cumulative Score (per 500)
//         Increments per 5 for every 500 points. Ex:
//         0x25: 2500 points
function score_five_hundreds() => byte(0x001A1A)

// 0x1A1B: [8-bit] Continues Count
//         Integer value equal to number of continues player has (ex. 0x02 = 2 continues)
function current_continues() => byte(0x001A1B)


/// Welcome to the hellscape that is boss health data. Here, any boss can be assigned any data. No pointers found, so RIP.

// 0x0BF3: [8-bit] Toxic Pools Boss Health Possibility 1/Lava Powerhouse Upper Head Health Possibility/Alt Robotnik Health Too
//         Address gets used in Toxic Pools if boss room enemy is killed first. Starts at 11HP when entered screen area of boss. 
//         Goes down with every hit. Game glitched(?) once during testing where value was used for Lava Powerhouse's Upper Head Boss. 
//         Also also used sometimes rarely as Robotnik's health.
//         0xFD, 0xF9, 0xF5: Toxic Pools Boss Cleared
//         0xFA: Lava Powerhouse Head Clear
//         0xFC: Robotnik Kill
function boss_hp_1() => byte(0x000BF3)

// 0x0C97: [8-bit] Toxic Pools Boss Health Possibility 2/Lava Powerhouse Boss Health Possibility
//         Used if player encounters boss without killing the boss room enemy. Starts at 11HP when entered screen area of boss. Goes down with every hit.
//         Sometimes used in Lava Powerhouse if exited and re-entered boss room.
//         0xf9, 0xfd, 0xf5: Boss Defeated Animation Start
function boss_hp_2() => byte(0x000C97)

// 0x0CE9: [8-bit] Lava Powerhouse Boss Health Possibility
//         Sometimes gets used for boss health of lower head. 
//         Seems to happen more frequently if left and re-entered the boss area or if hit both targets in boss arena before encountering the boss itself.
//         0xfe, 0xfd, 0xf9: Boss Kill Animation
function boss_hp_3() => byte(0x000CE9)

// 0x0C45: [8-bit] Robotnik Health
//         Usually used when a player exits and re-enters the boss area. 
//         Very rarely gets used in Toxic Pools. Rarely used in Lava Powerhouse if both targets and the lower head are hit before upper head is spawned.
//         [Toxic Pools]
//         0x11: Full Health
//         [Final Showdown]
//         0x20: Full Health
//         0xf8: Boss Kill Animation
//         0x7c: Boss Defeated
function boss_hp_4() => byte(0x000C45)

// 0x0D3B: [8-bit] Lava Powerhouse Boss Health 2
//         Not used consistently
//         0x0a: Full Health
//         0xfe: Boss Kill Animation
//         Robotnik HP only used in Genesis Plus GX if you don't engage him first
function boss_hp_5() => byte(0x000D3B)

// 0x0BA1: [8-bit] Lava Powerhouse Boss Health 1/Robotnik Health (?)
//         Fairly consistently addressed to upper head in Lava Powerhouse boss if struck first regardless if exited the boss room. 
//         Sometimes used for Robotnik's health.
//         [Lava Powerhouse]
//         0x0a: Full Health
//         0xfe, 0xfa: Boss Kill Animation
//         [Final Showdown]
//         0x20: Full Health
//         0xf8: Boss Kill Animation
//         0x7c: Boss Defeated
function boss_hp_6() => byte(0x000BA1)

// 0x0DA2: [8-bit] The Machine Left Wall Destroyed
//         Indicated whether the left wall of The Machine boss has been destroyed. Sometimes value is not used...
//         0x00: Not Destroyed
//         0x01: Destroyed
function machine_hp_1() => byte(0x000DA2)

// 0x0D50: [8-bit] The Machine Boss Left Wall Destroyed Possibility
//         Sometimes used to indicate the left wall of The Machine boss is destroyed
//         0x00: Not Destroyed
//         0x01: Destroyed
function machine_hp_2() => byte(0x000D50)

// 0x0E46: [8-bit] The Machine Right Wall Destroyed
//         Indicated whether the right wall of The Machine boss has been destroyed. Sometimes value is not used or erroneously goes off...
//         0x00: Not Destroyed
//         0x01: Destroyed
function machine_hp_3() => byte(0x000E46)

// 0x0DF4: [8-bit] The Machine Wall Destroyed Possibility
//         0x00: Not Destroyed
//         0x01: Destroyed
function machine_hp_4() => byte(0x000DF4)

// 0x0EEA: [8-bit] The Machine Boss Wall Possibility
//         0x00: Not destroyed
//         0x01: Destroyed
function machine_hp_5() => byte(0x000EEA)


//Rich Presence 

StageLookup = {
    0: "Sonic is in Toxic Pools",
    1: "Sonic is fighting the Toxic Pools Boss",
    2: "Sonic is in Lava Powerhouse",
    3: "Sonic is fighting the Lava Powerhouse Boss",
    4: "Sonic is in The Machine",
    5: "Sonic is fighting The Machine Boss",
    6: "Sonic is in Final Showdown",
    7: "Sonic is fighting the Final Showdown Boss",
    8: "Cutscene Playing",
    9: "Cutscene Playing",
    10: "Sonic is in a Bonus Cage",
}

LivesLookup = {
    0: "0",
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9",
}

DifficultyLookup = {
    0: "Normal",
    1: "Easy",
}

achievement(
    title = "Is This Safe To Touch?",
    description = "Collect your first Emerald in Toxic Pools",
    id = 400629, 
    badge = "458985",
    points = 2,
    trigger = 
        !demo1_active() &&
        !demo2_active() &&
        cheat_detection() &&
        toxic_pools() &&
        chaos_emerald() == 1
)

achievement(
    title = "Pipe Cleaning",
    description = "Collect two Emeralds in Toxic Pools",
    id = 400630,
    badge = "484920",
    points = 2,
    trigger =
        !demo1_active() &&
        !demo2_active() &&
        cheat_detection() &&
        toxic_pools() &&
        chaos_emerald() == 2
)

achievement(
    title = "Crashing The Toxic Pool Party",
    description = "Collect all Emeralds in Toxic Pools and unlock the Boss room",
    id = 400631,
    badge = "484921",
    points = 2,
    trigger = 
        !demo1_active() &&
        !demo2_active() &&
        cheat_detection() &&
        toxic_pools() &&
        chaos_emerald() == 3
)

achievement(
    title = "Soak Ya Later, Egg Head!",
    description = "Clear Toxic Pools on Normal Difficulty with Default Continues",
    id = 400612,
    badge = "458986",
    points = 10,
    type="progression",
    trigger =
        !demo1_active() &&
        !demo2_active() &&
        difficulty_check() &&
        continues_check() &&
        cheat_detection() &&
        never(table() == 0) &&
        never(demo1_active()) && // a bit redundant in hindsight
        never(demo2_active()) &&
        (
            toxic_pools_boss() &&
            once(prev(boss_hp_1())) != 17 && boss_hp_1() == 17 && //check for boss spawn
            prev(boss_hp_1()) < 200 && boss_hp_1() >= 200 || //check for boss death
            toxic_pools_boss() &&
            once(prev(boss_hp_2())) != 17 && boss_hp_2() == 17 &&
            prev(boss_hp_2()) < 200 && boss_hp_2() >= 200 ||
            toxic_pools_boss() &&
            once(prev(boss_hp_3())) != 17 && boss_hp_3() == 17 &&
            prev(boss_hp_3()) < 200 && boss_hp_3() >= 200 ||
            toxic_pools_boss() &&
            once(prev(boss_hp_4())) != 17 && boss_hp_4() == 17 &&
            prev(boss_hp_4()) < 200 && boss_hp_4() >= 200 ||
            once(toxic_pools_boss()) && bonus_cage_1() //progression fallback
        )
)

achievement(
    title = "Sizzling Quills",
    description = "Collect your first Emerald in Lava Powerhouse",
    id = 400632,
    badge = "458987",
    points = 2,
    trigger =
        !demo1_active() &&
        !demo2_active() &&
        cheat_detection() &&
        lava_powerhouse() &&
        chaos_emerald() == 1
)

achievement(
    title = "Steam Powered Stone",
    description = "Collect two Emeralds in Lava Powerhouse",
    id = 400633,
    badge = "484922",
    points = 2,
    trigger =
        !demo1_active() &&
        !demo2_active() &&
        cheat_detection() &&
        lava_powerhouse() &&
        chaos_emerald() == 2
)

achievement(
    title = "Throttling the Powerhouse",
    description = "Collect all Emeralds in Lava Powerhouse and unlock the Boss room",
    id = 400634,
    badge = "484923",
    points = 2,
    trigger =
        !demo1_active() &&
        !demo2_active() &&
        cheat_detection() &&
        lava_powerhouse() &&
        chaos_emerald() == 3
)

// God please forgive me for this shitass code omg
achievement(
    title = "Two Heads Are Weaker Than One", points = 10, type="progression",
    description = "Clear Lava Powerhouse on Normal Difficulty with Default Continues",
    id = 400613, badge = "458988", published = "2/22/2024 5:08:45 AM", modified = "5/29/2024 10:24:16 AM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && never(byte(0x000884) == 2) && never(DEMO1 == 1) &&
              never(DEMO2 == 1) &&
              ((byte(0x000884) == 3 && once(prev(byte(0x000BA1)) != 10 && byte(0x000BA1) == 10) &&
                once(prev(byte(0x000D3B)) != 10 && byte(0x000D3B) == 10) &&
                once(prev(byte(0x000BA1)) < 11 && byte(0x000BA1) >= 11) &&
                once(prev(byte(0x000D3B)) < 11 && byte(0x000D3B) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000BA1)) != 10 && byte(0x000BA1) == 10) &&
                once(prev(byte(0x000C97)) != 10 && byte(0x000C97) == 10) &&
                once(prev(byte(0x000BA1)) < 11 && byte(0x000BA1) >= 11) &&
                once(prev(byte(0x000C97)) < 11 && byte(0x000C97) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000D3B)) != 10 && byte(0x000D3B) == 10) &&
                once(prev(byte(0x000C97)) != 10 && byte(0x000C97) == 10) &&
                once(prev(byte(0x000D3B)) < 11 && byte(0x000D3B) >= 11) &&
                once(prev(byte(0x000C97)) < 11 && byte(0x000C97) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000BA1)) != 10 && byte(0x000BA1) == 10) &&
                once(prev(byte(0x000CE9)) != 10 && byte(0x000CE9) == 10) &&
                once(prev(byte(0x000BA1)) < 11 && byte(0x000BA1) >= 11) &&
                once(prev(byte(0x000CE9)) < 11 && byte(0x000CE9) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000D3B)) != 10 && byte(0x000D3B) == 10) &&
                once(prev(byte(0x000CE9)) != 10 && byte(0x000CE9) == 10) &&
                once(prev(byte(0x000D3B)) < 11 && byte(0x000D3B) >= 11) &&
                once(prev(byte(0x000CE9)) < 11 && byte(0x000CE9) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C97)) != 10 && byte(0x000C97) == 10) &&
                once(prev(byte(0x000CE9)) != 10 && byte(0x000CE9) == 10) &&
                once(prev(byte(0x000C97)) < 11 && byte(0x000C97) >= 11) &&
                once(prev(byte(0x000CE9)) < 11 && byte(0x000CE9) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000D3B)) != 10 && byte(0x000D3B) == 10) &&
                once(prev(byte(0x000BF3)) != 10 && byte(0x000BF3) == 10) &&
                once(prev(byte(0x000D3B)) < 11 && byte(0x000D3B) >= 11) &&
                once(prev(byte(0x000BF3)) < 11 && byte(0x000BF3) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C97)) != 10 && byte(0x000C97) == 10) &&
                once(prev(byte(0x000BF3)) != 10 && byte(0x000BF3) == 10) &&
                once(prev(byte(0x000C97)) < 11 && byte(0x000C97) >= 11) &&
                once(prev(byte(0x000BF3)) < 11 && byte(0x000BF3) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000BA1)) != 10 && byte(0x000BA1) == 10) &&
                once(prev(byte(0x000BF3)) != 10 && byte(0x000BF3) == 10) &&
                once(prev(byte(0x000BA1)) < 11 && byte(0x000BA1) >= 11) &&
                once(prev(byte(0x000BF3)) < 11 && byte(0x000BF3) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000CE9)) != 10 && byte(0x000CE9) == 10) &&
                once(prev(byte(0x000BF3)) != 10 && byte(0x000BF3) == 10) &&
                once(prev(byte(0x000CE9)) < 11 && byte(0x000CE9) >= 11) &&
                once(prev(byte(0x000BF3)) < 11 && byte(0x000BF3) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C45)) != 10 && byte(0x000C45) == 10) &&
                once(prev(byte(0x000BF3)) != 10 && byte(0x000BF3) == 10) &&
                once(prev(byte(0x000C45)) < 11 && byte(0x000C45) >= 11) &&
                once(prev(byte(0x000BF3)) < 11 && byte(0x000BF3) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C45)) != 10 && byte(0x000C45) == 10) &&
                once(prev(byte(0x000BA1)) != 10 && byte(0x000BA1) == 10) &&
                once(prev(byte(0x000C45)) < 11 && byte(0x000C45) >= 11) &&
                once(prev(byte(0x000BA1)) < 11 && byte(0x000BA1) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C45)) != 10 && byte(0x000C45) == 10) &&
                once(prev(byte(0x000C97)) != 10 && byte(0x000C97) == 10) &&
                once(prev(byte(0x000C45)) < 11 && byte(0x000C45) >= 11) &&
                once(prev(byte(0x000C97)) < 11 && byte(0x000C97) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C45)) != 10 && byte(0x000C45) == 10) &&
                once(prev(byte(0x000CE9)) != 10 && byte(0x000CE9) == 10) &&
                once(prev(byte(0x000C45)) < 11 && byte(0x000C45) >= 11) &&
                once(prev(byte(0x000CE9)) < 11 && byte(0x000CE9) >= 11)) ||
               (byte(0x000884) == 3 && once(prev(byte(0x000C45)) != 10 && byte(0x000C45) == 10) &&
                once(prev(byte(0x000D3B)) != 10 && byte(0x000D3B) == 10) &&
                once(prev(byte(0x000C45)) < 11 && byte(0x000C45) >= 11) &&
                once(prev(byte(0x000D3B)) < 11 && byte(0x000D3B) >= 11)) ||
               (once(byte(0x000884) == 3) && LEVEL == 16))
)

achievement(
    title = "Flipper Focus", points = 2,
    description = "Collect your first Emerald in The Machine",
    id = 400635, badge = "458989", published = "2/22/2024 5:08:55 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 2 && byte(0x001E98) == 4
)

achievement(
    title = "Pardon My Slide!", points = 2,
    description = "Collect two Emeralds in The Machine",
    id = 400636, badge = "484924", published = "2/22/2024 5:08:56 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 2 && byte(0x001E98) == 5
)

achievement(
    title = "It's All Part of the Processor", points = 2,
    description = "Collect three Emeralds in The Machine",
    id = 400637, badge = "484925", published = "2/22/2024 5:08:56 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 2 && byte(0x001E98) == 6
)

achievement(
    title = "Piston Perfect", points = 2,
    description = "Collect four Emeralds in The Machine",
    id = 400638, badge = "484926", published = "2/22/2024 5:08:57 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 2 && byte(0x001E98) == 7
)

achievement(
    title = "Spin Against The Machine", points = 2,
    description = "Collect all Emeralds in The Machine and unlock the Boss room",
    id = 400639, badge = "484927", published = "2/22/2024 5:08:57 AM", modified = "5/28/2024 7:37:31 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 2 && byte(0x001E98) == 8
)

achievement(
    title = "A Poorly Oiled Machine", points = 10, type="progression",
    description = "Clear The Machine on Normal Difficulty with Default Continues",
    id = 400645, badge = "458990", published = "2/22/2024 5:09:00 AM", modified = "5/29/2024 10:24:17 AM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && never(byte(0x000884) == 4) && never(DEMO1 == 1) &&
              never(DEMO2 == 1) &&
              ((byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000DA2)) == 0 && byte(0x000DA2) == 1), repeated(5,
                    prev(byte(0x000D50)) == 0 && byte(0x000D50) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000DA2)) == 0 && byte(0x000DA2) == 1), repeated(5,
                    prev(byte(0x000E46)) == 0 && byte(0x000E46) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000E46)) == 0 && byte(0x000E46) == 1), repeated(5,
                    prev(byte(0x000DF4)) == 0 && byte(0x000DF4) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000DF4)) == 0 && byte(0x000DF4) == 1), repeated(5,
                    prev(byte(0x000DA2)) == 0 && byte(0x000DA2) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000EEA)) == 0 && byte(0x000EEA) == 1), repeated(5,
                    prev(byte(0x000E98)) == 0 && byte(0x000E98) == 1) //why the fuck is the game using the chaos emerald value for the boss
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000CFE)) == 0 && byte(0x000CFE) == 1), repeated(5, //i think my soul gave up here uh.. other boss value ig
                    prev(byte(0x000D50)) == 0 && byte(0x000D50) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000DF4)) == 0 && byte(0x000DF4) == 1), repeated(5,
                    prev(byte(0x000D50)) == 0 && byte(0x000D50) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000D50)) == 0 && byte(0x000D50) == 1), repeated(5,
                    prev(byte(0x000E46)) == 0 && byte(0x000E46) == 1)
                )) ||
               (once(byte(0x000884) == 5) && LEVEL == 32))
)

achievement(
    title = "Charbroiled Emerald", points = 2,
    description = "Collect your first Emerald in Final Showdown",
    id = 400640, badge = "458991", published = "2/22/2024 5:08:57 AM", modified = "5/28/2024 7:37:39 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 4 && byte(0x001E98) == 4
)

achievement(
    title = "Cracking Open a Hot One", points = 2,
    description = "Collect two Emeralds in Final Showdown",
    id = 400641, badge = "484928", published = "2/22/2024 5:08:58 AM", modified = "5/28/2024 7:37:39 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 4 && byte(0x001E98) == 5
)

achievement(
    title = "Hot Emerald Over Coals", points = 2,
    description = "Collect three Emeralds in Final Showdown",
    id = 400642, badge = "484929", published = "2/22/2024 5:08:58 AM", modified = "5/28/2024 7:37:40 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 4 && byte(0x001E98) == 6
)

achievement(
    title = "Gem of Great Magma-tude", points = 2,
    description = "Collect four Emeralds in Final Showdown",
    id = 400643, badge = "484930", published = "2/22/2024 5:08:59 AM", modified = "5/28/2024 7:37:40 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 4 && byte(0x001E98) == 7
)

achievement(
    title = "Ready for the Final Showdown", points = 2,
    description = "Collect all Emeralds in Final Showdown and unlock the Boss room",
    id = 400644, badge = "484931", published = "2/22/2024 5:08:59 AM", modified = "5/28/2024 7:37:40 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              LEVEL == 4 && byte(0x001E98) == 8
)

achievement(
    title = "All In a Day's Workout!", points = 25, type="win_condition",
    description = "Clear Final Showdown and deal the finishing blow on Dr. Robotnik on Normal Difficulty with Default Continues",
    id = 400625, badge = "458992", published = "2/22/2024 5:08:51 AM", modified = "5/29/2024 9:58:01 AM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && never(byte(0x000884) == 6) &&
              ((byte(0x000884) == 7 && once(prev(byte(0x000C45)) != 32 && byte(0x000C45) == 32) &&
                prev(byte(0x000C45)) < 124 && byte(0x000C45) >= 124) ||
               (byte(0x000884) == 7 && once(prev(byte(0x000BA1)) != 32 && byte(0x000BA1) == 32) &&
                prev(byte(0x000BA1)) < 124 && byte(0x000BA1) >= 124) ||
               (byte(0x000884) == 7 && once(prev(byte(0x000BF3)) == 32 && byte(0x000BF3) == 32) &&
                prev(byte(0x000BF3)) < 124 && byte(0x000BF3) >= 124) ||
               (byte(0x001E19) == 92))
)

achievement(
    title = "The Art of Spinball", points = 25,
    description = "Clear the game without using a continue on Normal Difficulty with Default Continues",
    id = 400624, badge = "459250", published = "2/22/2024 5:08:50 AM", modified = "5/28/2024 7:37:41 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && never(byte(0x000884) == 8) &&
              ((unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000C45) == 124))) ||
               (unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000BA1) == 124))) ||
               (unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000BF3) == 124))) ||
                (unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000C45) == 124))))
)

achievement(
    title = "Hedgehog Spin-surance", points = 2,
    description = "Earn a continue in a Stage or Bonus Cage",
    id = 400616, badge = "459251", published = "2/22/2024 5:08:46 AM", modified = "5/29/2024 4:59:40 AM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              (byte(0x000884) == 2 || byte(0x000884) == 10) && byte(0x001A1B) > prev(byte(0x001A1B))
)

achievement(
    title = "No Thanks! I Hate Getting Wet!", points = 5,
    description = "Find the secret area in Toxic Pools and break open all the monitors",
    id = 400614, badge = "458993", published = "2/22/2024 5:08:46 AM", modified = "5/28/2024 7:37:48 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              byte(0x000884) == 0 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64
)

achievement(
    title = "The Powerhouse's Secret", points = 5,
    description = "Find the secret area in Lava Powerhouse and break open all the monitors",
    id = 400615, badge = "458994", published = "2/22/2024 5:08:46 AM", modified = "5/28/2024 7:37:48 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              byte(0x000884) == 2 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64 && byte(0x0014B4) == 64
)

achievement(
    title = "Walls Are Just a Suggestion", points = 5,
    description = "Find the secret area in The Machine and break open all the monitors",
    id = 400617, badge = "458995", published = "2/22/2024 5:08:47 AM", modified = "5/28/2024 7:37:49 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              byte(0x000884) == 4 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64
)

achievement(
    title = "A Mad Scientist's Mad Stash", points = 5,
    description = "Find the secret area in Final Showdown and break open all the monitors",
    id = 400618, badge = "458996", published = "2/22/2024 5:08:47 AM", modified = "5/28/2024 7:37:49 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              byte(0x000884) == 6 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64
)

achievement(
    title = "Developer Secrets", points = 1,
    description = "Successfully enter the code from the secret message boxes",
    id = 400619, badge = "459252", published = "2/22/2024 5:08:48 AM", modified = "5/28/2024 7:38:00 PM",
    trigger = CODE == 1 && byte(0x001A45) == 32
)

achievement(
    title = "Hidden Codes", points = 5,
    description = "Break open the secret message box in any stage after activating the secret message code in Sound Test",
    id = 400620, badge = "459253", published = "2/22/2024 5:08:49 AM", modified = "5/28/2024 7:38:00 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              byte(0x001A45) == 32 &&
              (LEVEL == 0 || LEVEL == 1 || LEVEL == 2 || LEVEL == 4) &&
              byte(0x001E19) == 79
)

achievement(
    title = "Spinball Player", points = 5,
    description = "Earn over 5 million points on Normal Difficulty with Default Continues",
    id = 400621, badge = "459254", published = "2/22/2024 5:08:49 AM", modified = "5/28/2024 7:38:00 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && byte(0x001A18) >= 5
)

achievement(
    title = "Spinball Star", points = 10,
    description = "Earn over 15 million points on Normal Difficulty with Default Continues",
    id = 400622, badge = "459255", published = "2/22/2024 5:08:49 AM", modified = "5/28/2024 7:38:01 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && byte(0x001A18) >= 21
)

achievement(
    title = "Spinball Sweep", points = 10,
    description = "Earn over 25 million points on Normal Difficulty with Default Continues",
    id = 400623, badge = "459256", published = "2/22/2024 5:08:50 AM", modified = "5/28/2024 7:38:01 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              CODE != 6 && CODE != 8 && byte(0x001A18) >= 37
)

achievement(
    title = "Bonus Cage Master I", points = 10,
    description = "Successfully clear Bonus Cage 1 with at least 100 rings. Level skip code is allowed",
    id = 400626, badge = "458997", published = "2/22/2024 5:08:51 AM", modified = "5/28/2024 7:38:06 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 8 && LEVEL == 8 &&
              byte(0x001C30) >= 1
)

achievement(
    title = "Bonus Cage Master II", points = 10,
    description = "Successfully clear Bonus Cage 2 with at least 100 rings. Level skip code is allowed",
    id = 400627, badge = "458998", published = "2/22/2024 5:08:52 AM", modified = "5/28/2024 7:38:06 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 8 && LEVEL == 16 &&
              byte(0x001C30) >= 1
)

achievement(
    title = "Bonus Cage Master III", points = 10,
    description = "Successfully clear Bonus Cage 3 with at least 100 rings. Level skip code is allowed",
    id = 400628, badge = "458999", published = "2/22/2024 5:08:52 AM", modified = "5/28/2024 7:38:07 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 8 && LEVEL == 32 &&
              byte(0x001C30) >= 1
)

achievement(
    title = "Don't Stop, Keep Spinning!", points = 5,
    description = "Earn an extra life from the score match after losing all your lives",
    id = 400646, badge = "459257", published = "2/22/2024 5:09:00 AM", modified = "5/28/2024 11:59:27 PM",
    trigger = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
              prev(byte(0x001A16)) == 0 && byte(0x001A16) == 1
)

leaderboard(
    id = 102669, title = "High Score - Normal",
    description = "Get the highest score on Normal difficulty!",
    start  = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
             byte(0x001E97) == 0 &&
             ((byte(0x001E19) == 92) ||
              (byte(0x000A26) == 1) ||
              (byte(0x000A26) == 255 && byte(0x001A1B) == 0 && byte(0x001A16) == 0)),
    cancel = ((byte(0x001E97) == 1) ||
              (byte(0x001A1A) == 0 && byte(0x001A19) == 0 && byte(0x001A18) == 0)),
    submit = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
             byte(0x001E97) == 0 &&
             ((byte(0x001E19) == 92) ||
              (byte(0x000A26) == 1) ||
              (byte(0x000A26) == 255 && byte(0x001A1B) == 0 && byte(0x001A16) == 0)),
    value  = measured((bcd(byte(0x001A1A)) * 100 + bcd(byte(0x001A19)) * 10000 + bcd(byte(0x001A18)) * 1000000)),
    format = "VALUE"
)

leaderboard(
    id = 102670, title = "High Score - Easy",
    description = "Get the highest score on Easy difficulty!",
    start  = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
             byte(0x001E97) == 1 &&
             ((byte(0x001E19) == 92) ||
              (byte(0x000A26) == 1) ||
              (byte(0x000A26) == 255 && byte(0x001A1B) == 0 && byte(0x001A16) == 0)),
    cancel = ((byte(0x001E97) == 0) ||
              (byte(0x001A1A) == 0 && byte(0x001A19) == 0 && byte(0x001A18) == 0)),
    submit = DEMO1 != 1 && DEMO2 != 1 && CODE != 6 && CODE != 8 &&
             byte(0x001E97) == 1 &&
             ((byte(0x001E19) == 92) ||
              (byte(0x000A26) == 1) ||
              (byte(0x000A26) == 255 && byte(0x001A1B) == 0 && byte(0x001A16) == 0)),
    value  = measured((bcd(byte(0x001A1A)) * 100 + bcd(byte(0x001A19)) * 10000 + bcd(byte(0x001A18)) * 1000000)),
    format = "VALUE"
)

rich_presence_conditional_display(word(0x001A51) == 1, "Demo Playing")

rich_presence_display("[{0}] {1} | 🔵: {2} | 💯: {3}",
    rich_presence_lookup("Difficulty", word(0x001E97), DifficultyLookup),
    rich_presence_lookup("Stage", word(0x000884), StageLookup),
    rich_presence_lookup("Lives", word(0x001A16), LivesLookup),
    rich_presence_value("Score", bcd(byte(0x001A18)) * 1000000 + bcd(byte(0x001A19)) * 10000 + bcd(byte(0x001A1A)) * 100)
)
