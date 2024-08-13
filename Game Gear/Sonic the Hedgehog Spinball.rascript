///Code cleanup TBD for clarity and ease of reading

// Sonic the Hedgehog Spinball
// #ID = 12650

////Code Notes (to be added)
//Demo
DEMO1 = byte(0x001A51)
DEMO2 = byte(0x001A54)

//Sound Test Codes
CODE = byte(0x001A43)
//1 = dev message
//6 = level skip
//8 = float

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
    title = "Is This Safe To Touch?", points = 2,
    description = "Collect your first Emerald in Toxic Pools",
    id = 400629, badge = "458985", published = "2/22/2024 5:08:53 AM", modified = "5/28/2024 7:37:05 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 0 && byte(0x001E98) == 1
)

achievement(
    title = "Pipe Cleaning", points = 2,
    description = "Collect two Emeralds in Toxic Pools",
    id = 400630, badge = "484920", published = "2/22/2024 5:08:53 AM", modified = "5/28/2024 7:37:06 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 0 && byte(0x001E98) == 2
)

achievement(
    title = "Crashing The Toxic Pool Party", points = 2,
    description = "Collect all Emeralds in Toxic Pools and unlock the Boss room",
    id = 400631, badge = "484921", published = "2/22/2024 5:08:54 AM", modified = "5/28/2024 7:37:06 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 0 && byte(0x001E98) == 3
)

achievement(
    title = "Soak Ya Later, Egg Head!", points = 10, type="progression",
    description = "Clear Toxic Pools on Normal Difficulty with Default Continues",
    id = 400612, badge = "458986", published = "2/22/2024 5:08:45 AM", modified = "5/29/2024 10:24:16 AM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && never(byte(0x000884) == 0) && never(byte(0x001A51) == 1) &&
              never(byte(0x001A54) == 1) &&
              ((byte(0x000884) == 1 && once(prev(byte(0x000BF3)) != 17 && byte(0x000BF3) == 17) &&
                prev(byte(0x000BF3)) < 200 && byte(0x000BF3) >= 200) ||
               (byte(0x000884) == 1 && once(prev(byte(0x000C97)) != 17 && byte(0x000C97) == 17) &&
                prev(byte(0x000C97)) < 200 && byte(0x000C97) >= 200) ||
               (byte(0x000884) == 1 && once(prev(byte(0x000CE9)) != 17 && byte(0x000CE9) == 17) &&
                prev(byte(0x000CE9)) < 200 && byte(0x000CE9) >= 200) ||
               (byte(0x000884) == 1 && once(prev(byte(0x000C45)) != 17 && byte(0x000C45) == 17) &&
                prev(byte(0x000C45)) < 200 && byte(0x000C45) >= 200) ||
               (once(byte(0x000884) == 1) && byte(0x000B27) == 8))
)

achievement(
    title = "Sizzling Quills", points = 2,
    description = "Collect your first Emerald in Lava Powerhouse",
    id = 400632, badge = "458987", published = "2/22/2024 5:08:54 AM", modified = "5/28/2024 7:37:13 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 1 && byte(0x001E98) == 1
)

achievement(
    title = "Steam Powered Stone", points = 2,
    description = "Collect two Emeralds in Lava Powerhouse",
    id = 400633, badge = "484922", published = "2/22/2024 5:08:54 AM", modified = "5/28/2024 7:37:14 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 1 && byte(0x001E98) == 2
)

achievement(
    title = "Throttling the Powerhouse", points = 2,
    description = "Collect all Emeralds in Lava Powerhouse and unlock the Boss room",
    id = 400634, badge = "484923", published = "2/22/2024 5:08:55 AM", modified = "5/28/2024 7:37:14 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 1 && byte(0x001E98) == 3
)

achievement(
    title = "Two Heads Are Weaker Than One", points = 10, type="progression",
    description = "Clear Lava Powerhouse on Normal Difficulty with Default Continues",
    id = 400613, badge = "458988", published = "2/22/2024 5:08:45 AM", modified = "5/29/2024 10:24:16 AM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && never(byte(0x000884) == 2) && never(byte(0x001A51) == 1) &&
              never(byte(0x001A54) == 1) &&
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
               (once(byte(0x000884) == 3) && byte(0x000B27) == 16))
)

achievement(
    title = "Flipper Focus", points = 2,
    description = "Collect your first Emerald in The Machine",
    id = 400635, badge = "458989", published = "2/22/2024 5:08:55 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 2 && byte(0x001E98) == 4
)

achievement(
    title = "Pardon My Slide!", points = 2,
    description = "Collect two Emeralds in The Machine",
    id = 400636, badge = "484924", published = "2/22/2024 5:08:56 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 2 && byte(0x001E98) == 5
)

achievement(
    title = "It's All Part of the Processor", points = 2,
    description = "Collect three Emeralds in The Machine",
    id = 400637, badge = "484925", published = "2/22/2024 5:08:56 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 2 && byte(0x001E98) == 6
)

achievement(
    title = "Piston Perfect", points = 2,
    description = "Collect four Emeralds in The Machine",
    id = 400638, badge = "484926", published = "2/22/2024 5:08:57 AM", modified = "5/28/2024 7:37:30 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 2 && byte(0x001E98) == 7
)

achievement(
    title = "Spin Against The Machine", points = 2,
    description = "Collect all Emeralds in The Machine and unlock the Boss room",
    id = 400639, badge = "484927", published = "2/22/2024 5:08:57 AM", modified = "5/28/2024 7:37:31 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 2 && byte(0x001E98) == 8
)

achievement(
    title = "A Poorly Oiled Machine", points = 10, type="progression",
    description = "Clear The Machine on Normal Difficulty with Default Continues",
    id = 400645, badge = "458990", published = "2/22/2024 5:09:00 AM", modified = "5/29/2024 10:24:17 AM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && never(byte(0x000884) == 4) && never(byte(0x001A51) == 1) &&
              never(byte(0x001A54) == 1) &&
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
                    prev(byte(0x000E98)) == 0 && byte(0x000E98) == 1)
                )) ||
               (byte(0x000884) == 5 &&
                tally(10, repeated(5, prev(byte(0x000CFE)) == 0 && byte(0x000CFE) == 1), repeated(5,
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
               (once(byte(0x000884) == 5) && byte(0x000B27) == 32))
)

achievement(
    title = "Charbroiled Emerald", points = 2,
    description = "Collect your first Emerald in Final Showdown",
    id = 400640, badge = "458991", published = "2/22/2024 5:08:57 AM", modified = "5/28/2024 7:37:39 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 4 && byte(0x001E98) == 4
)

achievement(
    title = "Cracking Open a Hot One", points = 2,
    description = "Collect two Emeralds in Final Showdown",
    id = 400641, badge = "484928", published = "2/22/2024 5:08:58 AM", modified = "5/28/2024 7:37:39 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 4 && byte(0x001E98) == 5
)

achievement(
    title = "Hot Emerald Over Coals", points = 2,
    description = "Collect three Emeralds in Final Showdown",
    id = 400642, badge = "484929", published = "2/22/2024 5:08:58 AM", modified = "5/28/2024 7:37:40 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 4 && byte(0x001E98) == 6
)

achievement(
    title = "Gem of Great Magma-tude", points = 2,
    description = "Collect four Emeralds in Final Showdown",
    id = 400643, badge = "484930", published = "2/22/2024 5:08:59 AM", modified = "5/28/2024 7:37:40 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 4 && byte(0x001E98) == 7
)

achievement(
    title = "Ready for the Final Showdown", points = 2,
    description = "Collect all Emeralds in Final Showdown and unlock the Boss room",
    id = 400644, badge = "484931", published = "2/22/2024 5:08:59 AM", modified = "5/28/2024 7:37:40 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000B27) == 4 && byte(0x001E98) == 8
)

achievement(
    title = "All In a Day's Workout!", points = 25, type="win_condition",
    description = "Clear Final Showdown and deal the finishing blow on Dr. Robotnik on Normal Difficulty with Default Continues",
    id = 400625, badge = "458992", published = "2/22/2024 5:08:51 AM", modified = "5/29/2024 9:58:01 AM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && never(byte(0x000884) == 6) &&
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
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && never(byte(0x000884) == 8) &&
              ((unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000C45) == 124))) ||
               (unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000BA1) == 124))) ||
               (unless(once(byte(0x001A1B) < prev(byte(0x001A1B)))) &&
                trigger_when((byte(0x001A1B) >= prev(byte(0x001A1B)) && byte(0x000884) == 7 && byte(0x000BF3) == 124))))
)

achievement(
    title = "Hedgehog Spin-surance", points = 2,
    description = "Earn a continue in a Stage or Bonus Cage",
    id = 400616, badge = "459251", published = "2/22/2024 5:08:46 AM", modified = "5/29/2024 4:59:40 AM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              (byte(0x000884) == 2 || byte(0x000884) == 10) && byte(0x001A1B) > prev(byte(0x001A1B))
)

achievement(
    title = "No Thanks! I Hate Getting Wet!", points = 5,
    description = "Find the secret area in Toxic Pools and break open all the monitors",
    id = 400614, badge = "458993", published = "2/22/2024 5:08:46 AM", modified = "5/28/2024 7:37:48 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000884) == 0 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64
)

achievement(
    title = "The Powerhouse's Secret", points = 5,
    description = "Find the secret area in Lava Powerhouse and break open all the monitors",
    id = 400615, badge = "458994", published = "2/22/2024 5:08:46 AM", modified = "5/28/2024 7:37:48 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000884) == 2 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64 && byte(0x0014B4) == 64
)

achievement(
    title = "Walls Are Just a Suggestion", points = 5,
    description = "Find the secret area in The Machine and break open all the monitors",
    id = 400617, badge = "458995", published = "2/22/2024 5:08:47 AM", modified = "5/28/2024 7:37:49 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000884) == 4 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64
)

achievement(
    title = "A Mad Scientist's Mad Stash", points = 5,
    description = "Find the secret area in Final Showdown and break open all the monitors",
    id = 400618, badge = "458996", published = "2/22/2024 5:08:47 AM", modified = "5/28/2024 7:37:49 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x000884) == 6 && byte(0x0014B2) == 64 && byte(0x0014B3) == 64
)

achievement(
    title = "Developer Secrets", points = 1,
    description = "Successfully enter the code from the secret message boxes",
    id = 400619, badge = "459252", published = "2/22/2024 5:08:48 AM", modified = "5/28/2024 7:38:00 PM",
    trigger = byte(0x001A43) == 1 && byte(0x001A45) == 32
)

achievement(
    title = "Hidden Codes", points = 5,
    description = "Break open the secret message box in any stage after activating the secret message code in Sound Test",
    id = 400620, badge = "459253", published = "2/22/2024 5:08:49 AM", modified = "5/28/2024 7:38:00 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              byte(0x001A45) == 32 &&
              (byte(0x000B27) == 0 || byte(0x000B27) == 1 || byte(0x000B27) == 2 || byte(0x000B27) == 4) &&
              byte(0x001E19) == 79
)

achievement(
    title = "Spinball Player", points = 5,
    description = "Earn over 5 million points on Normal Difficulty with Default Continues",
    id = 400621, badge = "459254", published = "2/22/2024 5:08:49 AM", modified = "5/28/2024 7:38:00 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && byte(0x001A18) >= 5
)

achievement(
    title = "Spinball Star", points = 10,
    description = "Earn over 15 million points on Normal Difficulty with Default Continues",
    id = 400622, badge = "459255", published = "2/22/2024 5:08:49 AM", modified = "5/28/2024 7:38:01 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && byte(0x001A18) >= 21
)

achievement(
    title = "Spinball Sweep", points = 10,
    description = "Earn over 25 million points on Normal Difficulty with Default Continues",
    id = 400623, badge = "459256", published = "2/22/2024 5:08:50 AM", modified = "5/28/2024 7:38:01 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001E97) == 0 && byte(0x001E96) == 5 &&
              byte(0x001A43) != 6 && byte(0x001A43) != 8 && byte(0x001A18) >= 37
)

achievement(
    title = "Bonus Cage Master I", points = 10,
    description = "Successfully clear Bonus Cage 1 with at least 100 rings. Level skip code is allowed",
    id = 400626, badge = "458997", published = "2/22/2024 5:08:51 AM", modified = "5/28/2024 7:38:06 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 8 && byte(0x000B27) == 8 &&
              byte(0x001C30) >= 1
)

achievement(
    title = "Bonus Cage Master II", points = 10,
    description = "Successfully clear Bonus Cage 2 with at least 100 rings. Level skip code is allowed",
    id = 400627, badge = "458998", published = "2/22/2024 5:08:52 AM", modified = "5/28/2024 7:38:06 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 8 && byte(0x000B27) == 16 &&
              byte(0x001C30) >= 1
)

achievement(
    title = "Bonus Cage Master III", points = 10,
    description = "Successfully clear Bonus Cage 3 with at least 100 rings. Level skip code is allowed",
    id = 400628, badge = "458999", published = "2/22/2024 5:08:52 AM", modified = "5/28/2024 7:38:07 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 8 && byte(0x000B27) == 32 &&
              byte(0x001C30) >= 1
)

achievement(
    title = "Don't Stop, Keep Spinning!", points = 5,
    description = "Earn an extra life from the score match after losing all your lives",
    id = 400646, badge = "459257", published = "2/22/2024 5:09:00 AM", modified = "5/28/2024 11:59:27 PM",
    trigger = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
              prev(byte(0x001A16)) == 0 && byte(0x001A16) == 1
)

leaderboard(
    id = 102669, title = "High Score - Normal",
    description = "Get the highest score on Normal difficulty!",
    start  = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
             byte(0x001E97) == 0 &&
             ((byte(0x001E19) == 92) ||
              (byte(0x000A26) == 1) ||
              (byte(0x000A26) == 255 && byte(0x001A1B) == 0 && byte(0x001A16) == 0)),
    cancel = ((byte(0x001E97) == 1) ||
              (byte(0x001A1A) == 0 && byte(0x001A19) == 0 && byte(0x001A18) == 0)),
    submit = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
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
    start  = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
             byte(0x001E97) == 1 &&
             ((byte(0x001E19) == 92) ||
              (byte(0x000A26) == 1) ||
              (byte(0x000A26) == 255 && byte(0x001A1B) == 0 && byte(0x001A16) == 0)),
    cancel = ((byte(0x001E97) == 0) ||
              (byte(0x001A1A) == 0 && byte(0x001A19) == 0 && byte(0x001A18) == 0)),
    submit = byte(0x001A51) != 1 && byte(0x001A54) != 1 && byte(0x001A43) != 6 && byte(0x001A43) != 8 &&
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
