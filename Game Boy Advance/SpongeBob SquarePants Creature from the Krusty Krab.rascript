// SpongeBob SquarePants: Creature from the Krusty Krab
// #ID = 7698

StageLookup = {
    0: "Catching Some Z's",
    48: "SpongeBob is in Diesel Dreaming",
    49: "SpongeBob is in Diesel Dreaming",
    50: "SpongeBob is in Diesel Dreaming",
    51: "SpongeBob is in Diesel Dreaming",
    52: "Patrick is in Starfish-Man to the Rescue",
    53: "Patrick is in Starfish-Man to the Rescue",
    54: "Patrick is in Starfish-Man to the Rescue",
    55: "Patrick is in Starfish-Man to the Rescue",
    56: "Plankton is in Super-Sized Patty",
    57: "Plankton is in Super-Sized Patty",
    58: "Plankton is in Super-Sized Patty",
    59: "Plankton is in Super-Sized Patty",
    60: "SpongeBob is in Alaskan Belly Trouble",
    61: "SpongeBob is in Alaskan Belly Trouble",
    62: "SpongeBob is in Alaskan Belly Trouble",
    63: "SpongeBob is in Alaskan Belly Trouble",
    64: "Patrick is in Rocket Rodeo",
    65: "Patrick is in Rocket Rodeo",
    66: "Patrick is in Rocket Rodeo",
    67: "Patrick is in Rocket Rodeo",
    68: "Plankton is in Revenge of the Giant Plankton Monster",
    69: "Plankton is in Revenge of the Giant Plankton Monster",
    70: "Plankton is in Revenge of the Giant Plankton Monster",
    71: "Plankton is in Revenge of the Giant Plankton Monster",
    72: "SpongeBob is in It Came From Bikini Bottom",
    73: "SpongeBob is in It Came From Bikini Bottom",
    74: "SpongeBob is in It Came From Bikini Bottom",
    75: "SpongeBob is in It Came From Bikini Bottom",
    76: "Patrick is in Rooftop Rumble",
    77: "Patrick is in Rooftop Rumble",
    78: "Patrick is in Rooftop Rumble",
    79: "Hypnotic Highway",
}

MinigameLookup = {
    80: "Plate Spinning",
    81: "Worm",
    82: "Trampoline",
    83: "Jellyfishing",
    84: "Spatula Toss",
    85: "Pit",
    86: "Float",
    87: "Hurdle",
}

achievement(
    title = "And the Winner Is... SpringBoob SquirePin!", points = 3, type="progression",
    description = "Clear Diesel Dreaming",
    id = 445557, badge = "515577", published = "7/5/2024 4:06:51 AM", modified = "1/5/2025 10:40:15 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 83 && byte(0x0022F0) == 124) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 83 && byte(0x002300) == 124))
)

achievement(
    title = "Fear Not, Starfish-Man Is Here", points = 3, type="progression",
    description = "Clear Starfish-Man to the Rescue",
    id = 445558, badge = "515578", published = "7/5/2024 4:06:51 AM", modified = "1/5/2025 10:40:16 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 89 && byte(0x0022F0) == 125) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 89 && byte(0x002300) == 125))
)

achievement(
    title = "I Can Deny It No Longer! I Am Small...", points = 3, type="progression",
    description = "Clear Super-Sized Patty",
    id = 445559, badge = "515579", published = "7/5/2024 4:06:52 AM", modified = "1/5/2025 10:40:17 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 94 && byte(0x0022F0) == 126) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 94 && byte(0x002300) == 126))
)

achievement(
    title = "It's Big, Scary, and Pink!", points = 5, type="progression",
    description = "Clear Alaskan Belly Trouble",
    id = 445560, badge = "515580", published = "7/5/2024 4:06:52 AM", modified = "1/5/2025 10:40:17 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 98 && byte(0x0022F0) == 127) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 98 && byte(0x002300) == 127))
)

achievement(
    title = "Hey, Who Turned the Heavy Back On?", points = 5, type="progression",
    description = "Clear Rocket Rodeo",
    id = 445561, badge = "515581", published = "7/5/2024 4:06:53 AM", modified = "1/5/2025 10:40:18 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 101 && byte(0x0022F0) == 128) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 101 && byte(0x002300) == 128))
)

achievement(
    title = "I Will Destroy All of You!", points = 5, type="progression",
    description = "Clear Revenge of the Giant Plankton Monster",
    id = 445562, badge = "515582", published = "7/5/2024 4:06:53 AM", modified = "1/5/2025 10:40:19 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 108 && byte(0x0022F0) == 129) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 108 && byte(0x002300) == 129))
)

achievement(
    title = "The SquarePants Flyer Mark III", points = 5, type="progression",
    description = "Clear It Came From Bikini Bottom",
    id = 445563, badge = "515583", published = "7/5/2024 4:06:54 AM", modified = "1/5/2025 10:40:20 PM",
    trigger = ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 111 && byte(0x0022F0) == 130) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 111 && byte(0x002300) == 130))
)

achievement(
    title = "I Am Starfish-Man: Defender of Bikini Bottom!", points = 10, type="progression",
    description = "Clear Rooftop Rumble",
    id = 445564, badge = "515584", published = "7/5/2024 4:06:54 AM", modified = "1/5/2025 10:40:20 PM",
    trigger = byte(0x000158) == 78 &&
              ((byte(0x0001F5) == 0 && prev(byte(0x005E10)) != 1 && byte(0x005E10) == 1) ||
               (byte(0x0001F5) == 8 && prev(byte(0x005E20)) != 1 && byte(0x005E20) == 1))
)

achievement(
    title = "Jelly Patty", points = 10, type="win_condition",
    description = "Clear Hypnotic Highway with SpongeBob",
    id = 445565, badge = "515585", published = "7/5/2024 4:06:55 AM", modified = "1/10/2025 10:34:54 PM",
    trigger = byte(0x00050E) == 1 && byte(0x000158) == 79 &&
              ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 38 && byte(0x0022F0) == 120) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 38 && byte(0x002300) == 120))
)

achievement(
    title = "Krabby Double Deluxe", points = 10, type="win_condition",
    description = "Clear Hypnotic Highway as Patrick",
    id = 445566, badge = "515586", published = "7/5/2024 4:06:55 AM", modified = "1/10/2025 10:34:54 PM",
    trigger = byte(0x00050E) == 2 && byte(0x000158) == 79 &&
              ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 37 && byte(0x0022F0) == 118) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 37 && byte(0x002300) == 118))
)

achievement(
    title = "Chum Patty", points = 10, type="win_condition",
    description = "Clear Hypnotic Highway as Plankton",
    id = 445567, badge = "515587", published = "7/5/2024 4:06:56 AM", modified = "1/10/2025 10:34:55 PM",
    trigger = byte(0x00050E) == 3 && byte(0x000158) == 79 &&
              ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 39 && byte(0x0022F0) == 119) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 39 && byte(0x002300) == 119))
)

achievement(
    title = "\"M\" For Mini", points = 1,
    description = "Collect an extra life for the first time",
    id = 445588, badge = "521853", published = "7/5/2024 4:07:06 AM", modified = "1/10/2025 10:41:10 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 &&
                (bit0(0x00706C) > prev(bit0(0x000001)) || bit1(0x00706C) > prev(bit1(0x000001)) ||
                    bit2(0x00706C) > prev(bit2(0x000001))
                )) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 &&
                (bit0(0x00707C) > prev(bit0(0x000001)) || bit1(0x00707C) > prev(bit1(0x000001)) ||
                    bit2(0x00707C) > prev(bit2(0x000001))
                )))
)

achievement(
    title = "Thank You, Sir Cecil", points = 1,
    description = "Collect a Snooze Wink for the first time",
    id = 445595, badge = "521854", published = "7/5/2024 4:07:09 AM", modified = "1/10/2025 10:41:10 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit4(0x00706C) > prev(bit4(0x000001))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit4(0x00707C) > prev(bit4(0x000001))))
)

achievement(
    title = "I Feel All Tingly Inside", points = 1,
    description = "Collect an Electric Cloud for the first time",
    id = 445589, badge = "522532", published = "7/5/2024 4:07:06 AM", modified = "1/10/2025 10:41:11 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit5(0x00706C) > prev(bit5(0x000001))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit5(0x00707C) == 1))
)

achievement(
    title = "Where Did Everybody Go?!", points = 1,
    description = "Collect a Moon Shower for the first time",
    id = 445590, badge = "521855", published = "7/5/2024 4:07:07 AM", modified = "1/10/2025 10:41:11 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit3(0x00706C) > prev(bit3(0x000001))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit3(0x00707C) > prev(bit3(0x000001))))
)

achievement(
    title = "Maximum Overdrive", points = 1,
    description = "Collect a Speed Star for the first time",
    id = 445591, badge = "521856", published = "7/5/2024 4:07:07 AM", modified = "1/10/2025 10:41:12 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit7(0x00706C) > prev(bit7(0x000001))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit7(0x00707C) > prev(bit7(0x000001))))
)

achievement(
    title = "Are You Ready To Be a Winner?", points = 3,
    description = "Unlock all mini-games by finding each hidden arcade cabinet",
    id = 445573, badge = "521857", published = "7/5/2024 4:06:59 AM", modified = "1/5/2025 10:40:21 PM",
    trigger = ((byte(0x0001F5) == 0 && measured(bitcount(0x006FE4) == 8) && prev(byte(0x000C0A)) == 1 &&
                (prev(byte(0x000158)) == 48 || prev(byte(0x000158)) == 52 || prev(byte(0x000158)) == 56 ||
                    prev(byte(0x000158)) == 60 || prev(byte(0x000158)) == 66 || prev(byte(0x000158)) == 71 ||
                    prev(byte(0x000158)) == 72 || prev(byte(0x000158)) == 76
                )) ||
               (byte(0x0001F5) == 8 && measured(bitcount(0x006FF4) == 8) && prev(byte(0x000C1A)) == 1 &&
                (prev(byte(0x000158)) == 48 || prev(byte(0x000158)) == 52 || prev(byte(0x000158)) == 56 ||
                    prev(byte(0x000158)) == 60 || prev(byte(0x000158)) == 66 || prev(byte(0x000158)) == 71 ||
                    prev(byte(0x000158)) == 72 || prev(byte(0x000158)) == 76
                )))
)

achievement(
    title = "I'd Say... I'm Already Halfway There!", points = 5,
    description = "Pick up 8 Speed Stars in part 1 of Diesel Dreaming without respawning",
    id = 445571, badge = "523992", published = "7/5/2024 4:06:58 AM", modified = "1/8/2025 3:43:42 AM",
    trigger = byte(0x000158) == 48 && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 4)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 4)) &&
              ((byte(0x000C0A) == 1 && byte(0x0022F0) == 4 &&
                measured(tally(8, repeated(8, byte(0x0001F5) == 0 && prev(bit7(0x00706C)) == 0 && bit7(0x00706C) == 1))) &&
                never((byte(0x007010) == 1 && byte(0x006FE0) < prev(byte(0x006FE0)))) &&
                never((byte(0x007010) == 2 && byte(0x006FE8) < prev(byte(0x006FE8)))) &&
                never((byte(0x007010) == 3 && byte(0x006FF0) < prev(byte(0x006FF0))))) ||
               (byte(0x000C1A) == 1 && byte(0x002300) == 4 &&
                measured(tally(8, repeated(8, byte(0x0001F5) == 8 && prev(bit7(0x00707C)) == 0 && bit7(0x00707C) == 1))) &&
                never((byte(0x0001F5) == 1 && byte(0x006FF0) < prev(byte(0x006FF0)))) &&
                never((byte(0x0001F5) == 2 && byte(0x006FF8) < prev(byte(0x006FF8)))) &&
                never((byte(0x0001F5) == 3 && byte(0x007000) < prev(byte(0x007000))))))
)

achievement(
    title = "SpongeBob GreasePants", points = 10,
    description = "Repair the car in part 3 of Diesel Dreaming without getting damaged and before letting the car reach critical condition",
    id = 445568, badge = "523993", published = "7/5/2024 4:06:56 AM", modified = "1/8/2025 3:43:42 AM",
    trigger = byte(0x000158) == 50 && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x00300A) >= 7)) &&
              never((byte(0x0001F5) == 8 && byte(0x00301A) >= 7)) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 6)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 6)) &&
              ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x0022F0) == 6 &&
                unless(once(byte(0x002C22) < prev(byte(0x002C22)))) && prev(byte(0x002C35)) != 5 &&
                trigger_when(byte(0x002C35) == 5)) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x002300) == 6 &&
                unless(once(byte(0x002C32) < prev(byte(0x002C32)))) && prev(byte(0x002C45)) != 5 &&
                trigger_when(byte(0x002C45) == 5)))
)

achievement(
    title = "I Told You Taking The Train Was a Mistake", points = 10,
    description = "Clear part 3 of Starfish-Man to the Rescue in under 1:05",
    id = 445584, badge = "516845", published = "7/5/2024 4:07:04 AM", modified = "1/8/2025 3:43:42 AM",
    trigger = byte(0x000158) == 54 && never(word(0x000062) == 0) &&
              ((byte(0x0001F5) == 0 && unless(byte(0x00103C) == 1) &&
                unless(repeated(3900, once(byte(0x000C2F) == 3) && byte(0x000C0A) == 1 && byte(0x000158) == 54)) &&
                prev(byte(0x0022F0)) == 10 && trigger_when(byte(0x0022F0) == 87)) ||
               (byte(0x0001F5) == 8 && unless(byte(0x00104C) == 1) &&
                unless(repeated(3900, once(byte(0x000C3F) == 3) && byte(0x000C1A) == 1 && byte(0x000158) == 54)) &&
                prev(byte(0x002300)) == 10 && trigger_when(byte(0x002300) == 87)))
)

achievement(
    title = "The Fiery Fist O' Pain", points = 10,
    description = "Defeat Dreaded Patrick in part 4 of Starfish-Man to the Rescue without taking damage",
    id = 445583, badge = "523994", published = "7/5/2024 4:07:03 AM", modified = "1/8/2025 3:43:43 AM",
    trigger = byte(0x000158) == 55 && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 11)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 11)) &&
              ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x0022F0) == 11 &&
                unless(once(byte(0x002C22) > 0 && byte(0x002C22) < prev(byte(0x002C22)))) && prev(byte(0x005E10)) != 1 &&
                trigger_when(byte(0x005E10) == 1)) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x002300) == 11 &&
                unless(once(byte(0x002C32) > 0 && byte(0x002C32) < prev(byte(0x002C32)))) && prev(byte(0x005E20)) != 1 &&
                trigger_when(byte(0x005E20) == 1)))
)

achievement(
    title = "The Sticky Goo of My Own Folley", points = 10,
    description = "Clear part 2 of Super-Sized Patty without touching the goo",
    id = 445569, badge = "531807", published = "7/5/2024 4:06:57 AM", modified = "1/8/2025 3:43:43 AM",
    trigger = byte(0x000158) == 57 && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 13)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 13)) &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 13 && byte(0x000C0A) == 1 && unless(once(byte(0x000357) == 1)) &&
                prev(word(0x000062)) != 4208 && trigger_when(word(0x000062) == 4208)) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 13 && byte(0x000C1A) == 1 && unless(once(byte(0x000357) == 1)) &&
                prev(word(0x000062)) != 4208 && trigger_when(word(0x000062) == 4208)))
)

achievement(
    title = "A Little Too Much Sauce", points = 10,
    description = "Defeat the Patty boss in part 4 of Super-Sized Patty without getting hit",
    id = 445570, badge = "531808", published = "7/5/2024 4:06:57 AM", modified = "1/8/2025 3:43:44 AM",
    trigger = byte(0x000158) == 59 && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 15)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 15)) &&
              ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x0022F0) == 15 &&
                unless(once(byte(0x002C22) > 0 && byte(0x002C22) < prev(byte(0x002C22)))) && prev(byte(0x005E10)) != 1 &&
                trigger_when(byte(0x005E10) == 1)) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x002300) == 15 &&
                unless(once(byte(0x002C32) > 0 && byte(0x002C32) < prev(byte(0x002C32)))) && prev(byte(0x005E20)) != 1 &&
                trigger_when(byte(0x005E20) == 1)))
)

achievement(
    title = "One Very Long Digestive Tract Later...", points = 10,
    description = "Make your way through part 2 of Alaskan Belly Trouble in under 1:40",
    id = 445593, badge = "516846", published = "7/5/2024 4:07:08 AM", modified = "1/8/2025 3:43:44 AM",
    trigger = byte(0x000158) == 60 && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 17)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 17)) &&
              ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x0022F0) == 17 && unless(byte(0x00103C) == 1) &&
                unless(repeated(6000, once(byte(0x000C0A) == 1 && word(0x000066) == 767) && byte(0x000158) == 60)) &&
                prev(word(0x000062)) != 5344 && trigger_when(word(0x000062) == 5344)) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x002300) == 17 && unless(byte(0x00104C) == 1) &&
                unless(repeated(6000, once(byte(0x000C1A) == 1 && word(0x000066) == 767) && byte(0x000158) == 60)) &&
                prev(word(0x000062)) != 5344 && trigger_when(word(0x000062) == 5344)))
)

achievement(
    title = "82 Kilometers Later...", points = 10,
    description = "Clear part 3 of Rocket Rodeo without getting hit and without shooting a laser",
    id = 445592, badge = "535050", published = "7/5/2024 4:07:08 AM", modified = "1/8/2025 3:43:45 AM",
    trigger = byte(0x000158) == 66 && never(word(0x000062) == 0) &&
              ((byte(0x0001F5) == 0 &&
                unless(once(byte(0x0022F0) == 23 && byte(0x000C0A) == 6 && prev(bit1(0x000F10)) == 0 && bit1(0x000F10) == 1)) &&
                unless(once(byte(0x002C22) > 0 && byte(0x002C22) < prev(byte(0x002C22)))) && prev(byte(0x0022F0)) == 23 &&
                trigger_when(byte(0x0022F0) == 100)) ||
               (byte(0x0001F5) == 8 &&
                unless(once(byte(0x002300) == 23 && byte(0x000C1A) == 6 && prev(bit1(0x0014A4)) == 0 && bit1(0x0014A4) == 1)) &&
                unless(once(byte(0x002C32) > 0 && byte(0x002C32) < prev(byte(0x002C32)))) && prev(byte(0x002300)) == 23 &&
                trigger_when(byte(0x002300) == 100)))
)

achievement(
    title = "I See You... Zap!", points = 10,
    description = "Clear part 2 of Revenge of the Giant Plankton Monster without letting any part of the bridge crumble",
    id = 445572, badge = "535051", published = "7/5/2024 4:06:58 AM", modified = "1/10/2025 11:16:06 PM",
    trigger = byte(0x000158) == 69 &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 26 && byte(0x000C0A) == 1 && byte(0x007274) == 0 &&
                prev(word(0x000066)) != 800 && trigger_when(word(0x000066) == 800)) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 26 && byte(0x000C1A) == 1 && byte(0x007284) == 0 &&
                prev(word(0x000066)) != 800 && trigger_when(word(0x000066) == 800)))
)

achievement(
    title = "I'll Have To Sue For My Pain and Suffering", points = 5,
    description = "Make it to the end of the final part of Revenge of the Giant Plankton Monster while surviving at least 10 attacks from Bikini Bottomites",
    id = 445594, badge = "535052", published = "7/5/2024 4:07:08 AM", modified = "1/8/2025 3:43:46 AM",
    trigger = byte(0x000158) == 71 && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 28)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 28)) &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 28 && byte(0x000C0A) == 1 && prev(word(0x000066)) != 2307 &&
                word(0x000066) == 2307 && repeated(10, byte(0x002C22) > 0 && byte(0x002C22) < prev(byte(0x002C22)))) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 28 && byte(0x000C1A) == 1 && prev(word(0x000066)) != 2307 &&
                word(0x000066) == 2307 && repeated(10, byte(0x002C32) > 0 && byte(0x002C32) < prev(byte(0x002C32)))))
)

achievement(
    title = "Local Nutcase Tries to Fly", points = 10,
    description = "Clear part 3 of It Came From Bikini Bottom without getting hit from Plankton's laser eye",
    id = 445574, badge = "535053", published = "7/5/2024 4:06:59 AM", modified = "1/8/2025 3:43:46 AM",
    trigger = never((byte(0x0001F5) == 0 && byte(0x0022F0) != 133 && word(0x000062) == 0)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 133 && word(0x000062) == 0)) && prev(byte(0x000158)) == 74 &&
              trigger_when(byte(0x000158) == 75) &&
              ((byte(0x0001F5) == 0 && prev(byte(0x000C0A)) == 1 &&
                unless(once(byte(0x0022F0) == 31 && byte(0x002C22) > 0 && byte(0x002C22) < prev(byte(0x002C22))))) ||
               (byte(0x0001F5) == 8 && prev(byte(0x000C1A)) == 1 &&
                unless(once(byte(0x002300) == 31 && byte(0x002C32) > 0 && byte(0x002C32) < prev(byte(0x002C32))))))
)

achievement(
    title = "I Am Confident In My Abilities To Successfully Succeed", points = 10,
    description = "Defeat Plankton in the final part of It Came From Bikini Bottom without taking damage",
    id = 445596, badge = "535054", published = "7/5/2024 4:07:09 AM", modified = "1/8/2025 3:43:46 AM",
    trigger = byte(0x000158) == 75 && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 32)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 32)) &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 32 && byte(0x000C0A) == 1 &&
                unless(once(byte(0x002C22) < prev(byte(0x002C22)))) && prev(byte(0x005E10)) != 1 &&
                trigger_when(byte(0x005E10) == 1)) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 32 && byte(0x000C1A) == 1 &&
                unless(once(byte(0x002C32) < prev(byte(0x002C32)))) && prev(byte(0x005E20)) != 1 &&
                trigger_when(byte(0x005E20) == 1)))
)

achievement(
    title = "Don't Touch Me, I'm Sterile!", points = 10,
    description = "Get through part 1 of Rooftop Rumble without gliding and without getting clinged on by Plankton's minions",
    id = 445586, badge = "535055", published = "7/5/2024 4:07:05 AM", modified = "1/8/2025 3:43:47 AM",
    trigger = byte(0x000158) == 76 && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 33)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 33)) &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 33 && byte(0x000C0A) == 1 && unless(once(byte(0x002C78) != 0)) &&
                unless(once(byte(0x002C62) == 3)) && prev(word(0x000062)) < 7728 && trigger_when(word(0x000062) >= 7728)) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 33 && byte(0x000C1A) == 1 && unless(once(byte(0x002C88) != 0)) &&
                unless(once(byte(0x002C72) == 3)) && prev(word(0x000062)) < 7728 && trigger_when(word(0x000062) >= 7728)))
)

achievement(
    title = "Laser Equipped Bermuda Shorts", points = 25,
    description = "Defeat Plankton in the final part of Rooftop Rumble without shooting your laser more than 150 times",
    id = 445585, badge = "535269", published = "7/5/2024 4:07:04 AM", modified = "1/8/2025 3:43:47 AM",
    trigger = byte(0x000158) == 78 && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 35)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 35)) && never(word(0x000062) == 0) &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 35 && byte(0x000C0A) == 3 && prev(byte(0x005E10)) != 1 &&
                trigger_when(byte(0x005E10) == 1) &&
                unless(repeated(150, byte(0x000C0A) == 3 && prev(bit1(0x000F10)) == 0 && bit1(0x000F10) == 1))) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 35 && byte(0x000C1A) == 3 && prev(byte(0x005E20)) != 1 &&
                trigger_when(byte(0x005E20) == 1) &&
                unless(repeated(150, byte(0x000C1A) == 3 && prev(bit1(0x0014A4)) == 0 && bit1(0x0014A4) == 1))))
)

achievement(
    title = "Hands At Ten and Two and Finally... Floor It!", points = 10,
    description = "Clear Hypnotic Highway as any character while taking the fastest route possible",
    id = 445587, badge = "535270", published = "7/5/2024 4:07:05 AM", modified = "1/8/2025 3:43:48 AM",
    trigger = byte(0x000158) == 79 && never((byte(0x0001F5) == 0 && byte(0x0022F0) == 131)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) == 131)) &&
              ((byte(0x0001F5) == 8 && byte(0x00050E) == 1 && prev(byte(0x002300)) == 38 &&
                trigger_when(byte(0x002300) == 120) && unless(once(word(0x0004FC) == 328))) ||
               (byte(0x0001F5) == 8 && byte(0x00050E) == 2 && prev(byte(0x002300)) == 37 &&
                trigger_when(byte(0x002300) == 118) && unless(once(word(0x0004FC) == 628))) ||
               (byte(0x0001F5) == 8 && byte(0x00050E) == 3 && prev(byte(0x002300)) == 39 &&
                trigger_when(byte(0x002300) == 119) && unless(once(word(0x0004FC) == 208))) ||
               (byte(0x0001F5) == 0 && byte(0x00050E) == 1 && prev(byte(0x0022F0)) == 38 &&
                trigger_when(byte(0x0022F0) == 120) && unless(once(word(0x0004FC) == 328))) ||
               (byte(0x0001F5) == 0 && byte(0x00050E) == 2 && prev(byte(0x0022F0)) == 37 &&
                trigger_when(byte(0x0022F0) == 118) && unless(once(word(0x0004FC) == 628))) ||
               (byte(0x0001F5) == 0 && byte(0x00050E) == 3 && prev(byte(0x0022F0)) == 39 &&
                trigger_when(byte(0x0022F0) == 119) && unless(once(word(0x0004FC) == 208))))
)

achievement(
    title = "F.U.N.", points = 4,
    description = "Win the Trampoline minigame",
    id = 445575, badge = "535271", published = "7/5/2024 4:07:00 AM", modified = "1/10/2025 10:58:15 PM",
    trigger = byte(0x000158) == 82 && prev(byte(0x009876)) == 0 && byte(0x009876) == 1
)

achievement(
    title = "All That Glitters", points = 4,
    description = "Reach Round 6 of the Spatula Toss minigame",
    id = 445576, badge = "535272", published = "7/5/2024 4:07:00 AM", modified = "1/10/2025 10:58:16 PM",
    trigger = byte(0x000158) == 84 && prev(byte(0x009876)) == 5 && byte(0x009876) == 6
)

achievement(
    title = "Rock Bottom", points = 5,
    description = "Score 50 points or more in the Pit minigame",
    id = 445577, badge = "535273", published = "7/5/2024 4:07:00 AM", modified = "1/10/2025 10:58:16 PM",
    trigger = byte(0x000158) == 85 && prev(word(0x000560)) == 49 && word(0x000560) == 50
)

achievement(
    title = "The Krusty Plate", points = 4,
    description = "Reach Round 6 in the Plate Spinning minigame",
    id = 445578, badge = "535274", published = "7/5/2024 4:07:01 AM", modified = "1/10/2025 10:58:17 PM",
    trigger = byte(0x000158) == 80 && prev(byte(0x009862)) == 5 && byte(0x009862) == 6
)

achievement(
    title = "Jellyfishing", points = 4,
    description = "Reach Round 6 of the Jellyfishing minigame without getting stung",
    id = 445579, badge = "535275", published = "7/5/2024 4:07:01 AM", modified = "1/10/2025 10:58:17 PM",
    trigger = byte(0x000158) == 83 && prev(byte(0x009876)) == 5 && byte(0x009876) == 6
)

achievement(
    title = "Sandy, SpongeBob, and the Worm", points = 4,
    description = "Reach Round 6 of the Worm minigame",
    id = 445580, badge = "535276", published = "7/5/2024 4:07:02 AM", modified = "1/10/2025 10:58:18 PM",
    trigger = byte(0x000158) == 81 && prev(byte(0x009862)) == 5 && byte(0x009862) == 6
)

achievement(
    title = "The Sponge Who Could Fly", points = 5,
    description = "Score 100 points or more in the Float minigame",
    id = 445581, badge = "535277", published = "7/5/2024 4:07:02 AM", modified = "1/10/2025 10:58:19 PM",
    trigger = byte(0x000158) == 86 && prev(byte(0x009876)) == 0 && byte(0x009876) == 1
)

achievement(
    title = "The Fry Cook Games", points = 3,
    description = "Win the Hurdle minigame",
    id = 445582, badge = "535278", published = "7/5/2024 4:07:03 AM", modified = "1/10/2025 10:58:19 PM",
    trigger = byte(0x000158) == 87 && prev(byte(0x009876)) == 0 && byte(0x009876) == 2
)

leaderboard(
    id = 106812, title = "High Score - The Pit",
    description = "Get the highest score in The Pit minigame!",
    start  = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x000158) == 85) ||
              (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x000158) == 85)),
    cancel = ((byte(0x0001F5) == 0 && byte(0x0022F0) == 40) ||
              (byte(0x0001F5) == 8 && byte(0x002300) == 40)),
    submit = ((byte(0x0001F5) == 0 && word(0x009828) == 0) ||
              (byte(0x0001F5) == 8 && word(0x009828) == 0)),
    value  = measured(word(0x000560)),
    format = "VALUE"
)

leaderboard(
    id = 106813, title = "High Score - Float",
    description = "Get the highest score in the Float minigame!",
    start  = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x000158) == 86) ||
              (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x000158) == 86)),
    cancel = ((byte(0x0001F5) == 0 && word(0x0022F0) == 40) ||
              (byte(0x0001F5) == 8 && byte(0x002300) == 40)),
    submit = word(0x009828) == 0,
    value  = measured((byte(0x00989E) * 1 + byte(0x00988A) * 10 + byte(0x009876) * 100)),
    format = "VALUE"
)

leaderboard(
    id = 114885, title = "Train Stopper",
    description = "Clear part 3 of Starfish-Man to the rescue in the fastest time!",
    start  = byte(0x000158) == 54 &&
             ((byte(0x0001F5) == 0 && byte(0x0022F0) == 10 && byte(0x000C0A) == 1 && byte(0x000C2F) == 3) ||
              (byte(0x0001F5) == 8 && byte(0x002300) == 10 && byte(0x000C1A) == 1 && byte(0x000C3F) == 3)),
    cancel = ((byte(0x0001F5) == 0 && (byte(0x000158) != 54 || byte(0x0022F0) == 59 || byte(0x0022F0) == 43)) ||
              (byte(0x0001F5) == 8 && (byte(0x000158) != 54 || byte(0x002300) == 59 || byte(0x002300) == 43))),
    submit = ((byte(0x0001F5) == 0 && byte(0x00705C) == 12) ||
              (byte(0x0001F5) == 8 && byte(0x00706C) == 12)),
    value  = max_of(
                 measured(tally(0, byte(0x000C0A) == 1)) && unless(byte(0x00103C) == 1) &&
                 never((byte(0x000C0A) == 1 && word(0x000062) == 0)),
                 measured(tally(0, byte(0x000C1A) == 1)) && unless(byte(0x00104C) == 1) &&
                 never((byte(0x000C1A) == 1 && word(0x000062) == 0))
             ),
    format = "FRAMES"
)

leaderboard(
    id = 114886, title = "Bull Worm Gastroenterologist",
    description = "Clear part 2 of Alaskan Belly Trouble in the fastest time!",
    start  = byte(0x000158) == 60 && word(0x000066) == 767 &&
             ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x0022F0) == 17) ||
              (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x002300) == 17)),
    cancel = ((byte(0x0001F5) == 0 && (byte(0x000158) != 60 || byte(0x0022F0) == 59 || byte(0x0022F0) == 43)) ||
              (byte(0x0001F5) == 8 && (byte(0x000158) != 60 || byte(0x002300) == 59 || byte(0x002300) == 43))),
    submit = word(0x000062) == 5344,
    value  = max_of(
                 measured(tally(0, byte(0x000C0A) == 1)) && unless(byte(0x00103C) == 1) &&
                 never((byte(0x000C0A) == 1 && word(0x000062) == 0)),
                 measured(tally(0, byte(0x000C1A) == 1)) && unless(byte(0x00104C) == 1) &&
                 never((byte(0x000C1A) == 1 && word(0x000062) == 0))
             ),
    format = "FRAMES"
)

rich_presence_conditional_display( &&
    ((word(0x00012C) == 50) ||
     (word(0x00012C) == 46) ||
     (word(0x00012C) == 48) ||
     (word(0x00012C) == 47) ||
     (word(0x00012C) == 49) ||
     (word(0x00012C) == 0)), "🫧 Diving into Bikini Bottom 🫧")

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x0022F0) == 59, "At the Title Screen")

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x002300) == 59, "At the Title Screen")

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x0022F0) == 57, "🎞️ At the Bikini Bottom Theatre")

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x002300) == 57, "🎞️ At the Bikini Bottom Theatre")

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x0022F0) == 58, "🔧 Exploring different options")

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x002300) == 58, "🔧 Exploring different options")

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x0022F0) == 40, "🕹️ At the Arcade")

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x002300) == 40, "🕹️ At the Arcade")

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x0022F0) == 41, "Taking a seat")

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x002300) == 41, "Taking a seat")

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x0022F0) == 42, "📽️ Watching the Credits Roll")

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x002300) == 42, "📽️ Watching the Credits Roll")

rich_presence_conditional_display(word(0x00012C) == 40, "🕹️ At the Arcade playing the {0} minigame",
    rich_presence_lookup("Minigame", word(0x000158), MinigameLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x00050E) == 1 && word(0x000158) == 79, "💤 SpongeBob is in {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x00050E) == 2 && word(0x000158) == 79, "💤 Patrick is in {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 0 && word(0x00050E) == 3 && word(0x000158) == 79, "💤 Plankton is in {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x00050E) == 1 && word(0x000158) == 79, "💤 SpongeBob is in {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x00050E) == 2 && word(0x000158) == 79, "💤 Patrick is in {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 8 && word(0x00050E) == 3 && word(0x000158) == 79, "💤 Plankton is in {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 0, "💤 {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_conditional_display(word(0x0001F5) == 8, "💤 {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)

rich_presence_display("💤 {0}...",
    rich_presence_lookup("Stage", word(0x000158), StageLookup)
)
