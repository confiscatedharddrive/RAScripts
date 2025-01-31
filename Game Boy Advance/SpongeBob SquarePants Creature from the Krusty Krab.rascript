// SpongeBob SquarePants: Creature from the Krusty Krab
// #ID = 7698
// RA Hash: 45e6e3088c5c9006175aaf045e8795e8 (USA)
//          7f22c443ec71a696d84ae46a9fe61980 (Europe)

// Code Notes

// 0x0062: [16-bit] Screen X axis scroll
function respawn() => word(0x000062) == 0
		
// 0x0066: [16-bit] Screen Y axis scroll
		
// 0x012C: [8-bit] Last Menu Been In
//         Updates according to screen ID but only for menus or if in the arcade. Stagnates well for RP data
function startup() => 
        ((byte(0x00012C) == 50) ||
        (byte(0x00012C) == 46) ||
        (byte(0x00012C) == 48) ||
        (byte(0x00012C) == 47) ||
        (byte(0x00012C) == 49) ||
        (byte(0x00012C) == 0))
function arcade_in_minigame() => byte(0x00012C) == 40
		
// 0x0158: [8-bit] Level Indicator
//         Changes depending on which level you're in. Value remains the same even if exited a level.
//         [Levels]
//         0x30: Diesel Dreaming
//         0x31: Diesel Dreaming 2
//         0x32: Diesel Dreaming 3
//         0x33: Diesel Dreaming 4
//         0x34: Starfish-Man to the Rescue 1
//         0x35: Starfish-Man to the Rescue 2
//         0x36: Starfish-Man to the Rescue 3
//         0x37: Starfish-Man to the Rescue 4
//         0x38: Super-Sized Patty 1
//         0x39: Super-Sized Patty 2
//         0x3a: Super-Sized Patty 3
//         0x3b: Super-Sized Patty 4
//         0x3f: Alaskan Belly Trouble 1
//         0x3c: Alaskan Belly Trouble 2
//         0x3d: Alaskan Belly Trouble 3
//         0x3e: Alaskan Belly Trouble 4
//         0x40: Rocket Rodeo 1
//         0x41: Rocket Rodeo 2
//         0x42: Rocket Rodeo 3
//         0x43: Rocket Rodeo 4
//         0x44: Revenge of the Giant Plankton Monster 1
//         0x45: Revenge of the Giant Plankton Monster 2
//         0x46: Revenge of the Giant Plankton Monster 3
//         0x47: Revenge of the Giant Plankton Monster 4
//         0x48: It Came From Bikini Bottom 1
//         0x49: It Came From Bikini Bottom 2
//         0x4a: It Came From Bikini Bottom 3
//         0x4b: It Came From Bikini Bottom 4
//         0x4c: Rooftop Rumble 1
//         0x4d: Rooftop Rumble 2
//         0x4e: Rooftop Rumble 3
//         0x4f: Hypnotic Highway
//         [Minigames]
//         0x50: Plate Spinning
//         0x51: Worm (Snake)
//         0x52: Trampoline
//         0x53: Whack-a-Jellyfish
//         0x54: Target Shooting
//         0x55: Pit
//         0x56: Float Maze
//         0x57: Hurdles
function diesel_dreaming_1() => byte(0x000158) == 48
function diesel_dreaming_3() => byte(0x000158) == 50
function starfishman_rescue_3() => byte(0x000158) == 54
function starfishman_rescue_4() => byte(0x000158) == 55
function supersized_patty_2() => byte(0x000158) == 57
function supersized_patty_4() => byte(0x000158) == 59
function alaskan_belly_2() => byte(0x000158) == 60
function rocket_rodeo_3() => byte(0x000158) == 66
function plankton_monster_2() => byte(0x000158) == 69
function plankton_monster_4() => byte(0x000158) == 71
function bikini_bottom_4() => byte(0x000158) == 75
function rooftop_rumble_1() => byte(0x000158) == 76
function rooftop_rumble_3() => byte(0x000158) == 78
function hypnotic_highway() => byte(0x000158) == 79
function plates() => byte(0x000158) == 80
function worm() => byte(0x000158) == 81
function trampoline() => byte(0x000158) == 82
function jellyfish() => byte(0x000158) == 83
function target() => byte(0x000158) == 84
function pit() => byte(0x000158) == 85
function float() => byte(0x000158) == 86
function hurdles() => byte(0x000158) == 87
		
// 0x01F4: [8-bit] Language Select
//         0x00: English
//         0x01: Italian
//         0x02: German
//         0x03: French
//         0x04: Spanish
//         0x05: Dutch
//         0x06: Swedish
//         0x07: Danish
		
// 0x01F5: [8-bit] Region Indicator
//         0x00: USA
//         0x08: EUR
function usa() => byte(0x0001F5) == 0
function europe() => byte(0x0001F5) == 8

// 0x0238: [BitCount] Cumulative Minigame Unlocks
//         Takes into account all save files when calculating what games are unlocked.
function minigames_unlocked() => bitcount(0x000238) == 8
		
// 0x0321: [EUR] [8-bit] Boss Animation(?)
//         Only used by giant patty boss. Death animation value, possibly.
//         0xff: Boss defeat
		
// 0x0357: [8-bit] Goo Status
//         0x00: Out of Goo
//         0x01: In Goo
		
// 0x03A6: [EUR] [16-bit] Level Time
//         Time spent in a level. Resets on level entry or respawn
		
// 0x03B0: [USA] [16-bit] Level Time
//         Time spent in a level. Resets on level entry or respawn
		
// 0x04FC: [16-bit] Countdown Timer
//         Tied to graphical countdown timer in-level. Once it hits 0000, player dies and is respawned at the start and timer resets.
		
// 0x050E: [8-bit] Hypnotic Highway Vehicle Selection
//         0x01: SpongeBob
//         0x02: Patrick
//         0x03: Plankton
		
//0x0560: [16-bit] Pit Minigame
//        Score from the pit minigame. Value updates each time the player hits a new platform lower than the current one.
		
// 0x0C0A: [USA] [8-bit] In-Game Indicator
//         0x00: Not in-game
//         0x01: In-game
//         0x03: In-game only during final Plankton boss for some reason
		
// 0x0C1A: [EUR] [8-bit] In-Game Indicator
//         0x00: Not in-game
//         0x01: In-game
//         0x03: In-game only during final Plankton boss for some reason
		
// 0x0C2F: [USA] [8-bit] Train Sections
//         Increases as you move along the train. Stage starts at 2 when cutscene glide plays and then goes to 3 as you land on the first one you're able to move on
		
// 0x0C3F: [EUR] [8-bit] Train Sections
//         Increases as you move along the train. Stage starts at 2 when cutscene glide plays and then goes to 3 as you land on the first one you're able to move on
		
// 0x0F10: [USA] [BitCount] Player Control
//         Bit 0: A
//         Bit 1: B
//         Bit 2: Select
//         Bit 3: Start
//         Bit 4: Right
//         Bit 5: Left
//         Bit 6: Up
//         Bit 7: Down
		
// 0x103C: [USA] [8-bit] Pause Indicator
//         0x00: Not paused
//         0x01: Paused
		
// 0x104C: [EUR] [8-bit] Pause Indicator
//         0x00: Not paused
//         0x01: Paused
		
// 0x14A4: [EUR] [BitCount] Player Control
//         Bit 0: A
//         Bit 1: B
//         Bit 2: Select
//         Bit 3: Start
//         Bit 4: Right
//         Bit 5: Left
//         Bit 6: Up
//         Bit 7: Down
		
// 0x22F0: [USA] [8-bit] Screen ID
//         Changes every time there's a screen change (ie. cutscene progression, level change, splash screen)
//         0x28: Arcade Room
//         0x29: Credits
//         0x3a: Options Menu
//         0x3b: Title Screen
//         0x39: Game Select Screen
//         0x2b: Game Over/Continue Screen
//         0x7b: Diesel Dreaming Intro Screen
//         0x53: Final Diesel Dreaming Cutscene
		
// 0x2300: [EUR] [8-bit] Screen ID
//         Changes every time there's a screen change (ie. cutscene progression, level change, splash screen)
//         0x28: Arcade Room
//         0x29: Credits
//         0x3a: Options Menu
//         0x3b: Title Screen
//         0x39: Game Select Screen
//         0x2b: Game Over/Continue Screen
//         0x7b: Diesel Dreaming Intro Screen
//         0x53: Final Diesel Dreaming Cutscene
		
// 0x2C22: [USA] [8-bit] Player Health
//         Max: 0x0a
		
// 0x2C32: [EUR] [8-bit] Player Health
//         Max: 0x0a
		
// 0x2C35: [USA] [8-bit] Various Player Data
//         [SpongeBob]
//         Car Parts Tally
//         [Patrick]
//         Starfish-Man Combo
//         0x01: Punch
//         0x02: Uppercut
//         0x03: Shove
		
// 0x2C45: [EUR] [8-bit] Various Player Data
//         [SpongeBob]
//         Car Parts Tally
//         [Patrick]
//         Starfish-Man Combo
//         0x01: Punch
//         0x02: Uppercut
//         0x03: Shove
		
// 0x2C62: [USA] [8-bit] Starfish-Man Gliding Status
//         0x00: Not Gliding
//         0x01: Cutscene Glide
//         0x02: Running on Ground
//         0x03: Player Gliding
//         0xff: Glide Turnaround
		
// 0x2C71: [EUR] [8-bit] Starfish-Man Gliding Status
//         0x00: Not Gliding
//         0xa0: Gliding
//         0x80: Glide Turnaround
//         0xc0: Glide Turnaround Alt Value
		
// 0x2C72: [EUR] [8-bit] Starfish-Man Gliding Status
//         0x00: Not Gliding
//         0x01: Cutscene Glide
//         0x02: Running on Ground
//         0x03: Player Gliding
//         0xff: Glide Turnaround
		
// 0x2C78: [USA] [8-bit] Enemy Cling Number
//         Goes up by 1 with each enemy that clings on to you for a maximum of 5
		
// 0x2C88: [EUR] [8-bit] Enemy Cling Number
//         Goes up by 1 with each enemy that clings on to you for a maximum of 5
		
// 0x2C9D: [EUR] [8-bit] Whack-a-Jellyfish Current Round
		
// 0x2D12: [8-bit] Evil Patrick Enemy Health
//         Starts at 3HP, goes down with each hit
//         0x03: 3HP when spawned in area
		
// 0x300A: [USA] [8-bit] Diesel Dreaming 3 Car HP
//         Value increases from 0 as stage goes on, when value reaches 0a, car breaks down
//         0x04: Yellow Indicator
//         0x07: Red Indicator (Critically low)
		
// 0x301A: [EUR] [8-bit] Diesel Dreaming 3 Car HP
//         Value increases from 0 as stage goes on, when value reaches 0a, car breaks down
//         0x04: Yellow Indicator
//         0x07: Red Indicator (Critically low)
		
// 0x5E10: [USA] [8-bit] Boss Defeat Flag
//         0x01: Defeated
		
// 0x5E20: [EUR] [8-bit] Boss Defeat Flag
//         0x01: Defeated
		
// 0x6FE0: [USA] [8-bit] Lives Counter #1
//         Used in file 1
		
// 0x6FE4: [USA] [BitCount] Minigames Unlocked
//         Bit 0: Trampoline
//         Bit 1: Targets
//         Bit 2: Pit
//         Bit 3: Plate Spinning
//         Bit 4: Whack-a-Jellyfish
//         Bit 5: Worm
//         Bit 6: Float Maze
//         Bit 7: Hurdles
		
// 0x6FE8: [USA] [8-bit] Lives Counter #2
//         Used in File 2
		
// 0x6FF0: [USA] [8-bit] Lives Counter #3
//         Used in file 3
//         [EUR] [8-bit] Lives Counter #1
//         Used in file 1
		
// 0x6FF4: [EUR] [BitCount] Minigames Unlocked
//         Bit 0: Trampoline
//         Bit 1: Targets
//         Bit 2: Pit
//         Bit 3: Plate Spinning
//         Bit 4: Whack-a-Jellyfish
//         Bit 5: Worm
//         Bit 6: Float Maze
//         Bit 7: Hurdles
		
// 0x6FF8: [EUR] [8-bit] Lives Counter #2
//         Used in File 2
		
// 0x7000: [EUR] [8-bit] Lives Counter #3
//         Used in File 3
		
// 0x7010: [USA] [8-bit] Save File Select
//         0x01: File 1
//         0x02: File 2
//         0x03: File 3
		
// 0x7020: [EUR] [8-bit] Save File Select
//         0x01: File 1
//         0x02: File 2
//         0x03: File 3
		
// 0x705C: [USA] [8-bit] Game Scene Indicator
//         Linearly progresses consistently with each in-game cutscene. 
//         Value stays in memory even after a game over and only changes depending on cutscene load.
		
// 0x706C: [USA] [BitCount] Variable Collectible
//         Bit 0: Patrick Extra Life
//         Bit 1: Plankton Extra Life
//         Bit 2: SpongeBob Extra Life
//         Bit 3: Moon Shower
//         Bit 4: Snooze Wink
//         Bit 5: Electric Cloud
//         Bit 6: Secret Mini-Game
//         Bit 7: Speed Star
//         [EUR] [8-bit] Game Scene Indicator
//         Linearly progresses consistently with each in-game cutscene. 
//         Value stays in memory even after a game over and only changes depending on cutscene load.
		
// 0x707C: [EUR] [BitCount] Variable Collectible
//         Bit 0: Patrick Extra Life
//         Bit 1: Plankton Extra Life
//         Bit 2: SpongeBob Extra Life
//         Bit 3: Moon Shower
//         Bit 4: Snooze Wink
//         Bit 5: Electric Cloud
//         Bit 6: Secret Mini-Game
//         Bit 7: Speed Star
		
// 0x7274: [USA] [8-bit] Revenge of the Giant Plankton Monster 2 Bridge Pieces Destroyed
//         Increments by 1 value for each part of the bridge broken by enemies, until 6, where it collapses.
		
// 0x7284: [EUR] [8-bit] Revenge of the Giant Plankton Monster 2 Bridge Pieces Destroyed
//         Increments by 1 value for each part of the bridge broken by enemies, until 6, where it collapses.
		
// 0x7C7D: [EUR] [8-bit] Car Speed
//         0x05: Low Speed/Idling Vehicle
//         0x06: High Speed
//         0x07: Boost Pickup
		
// 0x9828: [16-bit] Minigame Game Over
//         0x0000 Indicates Game Over screen
		
// 0x9862: [8-bit] Plate Spinning/Worm Minigame Current Round
		
// 0x9876: [8-bit] Varying Minigame Indicators
//         Updates depending on minigame. Value stagnates until another minigame is chosen or reset, regardless if value is used.
//         [Trampoline]
//         0x01: Win Condition
//         [Target]
//         Round Indicator
//         [Whack-a-Jellyfish]
//         Round Indicator
//         [Hurdles]
//         0x02: Win Condition
//         [Float Maze]
//         Score (000x00)
		
// 0x988A: [8-bit] Float Maze Minigame Score (0000x0)
		
// 0x989E: [8-bit] Float Maze Minigame Score (00000x)


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
    trigger = rooftop_rumble_3() &&
              ((byte(0x0001F5) == 0 && prev(byte(0x005E10)) != 1 && byte(0x005E10) == 1) ||
               (byte(0x0001F5) == 8 && prev(byte(0x005E20)) != 1 && byte(0x005E20) == 1))
)

achievement(
    title = "Jelly Patty", points = 10, type="win_condition",
    description = "Clear Hypnotic Highway with SpongeBob",
    id = 445565, badge = "515585", published = "7/5/2024 4:06:55 AM", modified = "1/10/2025 10:34:54 PM",
    trigger = byte(0x00050E) == 1 && hypnotic_highway() &&
              ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 38 && byte(0x0022F0) == 120) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 38 && byte(0x002300) == 120))
)

achievement(
    title = "Krabby Double Deluxe", points = 10, type="win_condition",
    description = "Clear Hypnotic Highway as Patrick",
    id = 445566, badge = "515586", published = "7/5/2024 4:06:55 AM", modified = "1/10/2025 10:34:54 PM",
    trigger = byte(0x00050E) == 2 && hypnotic_highway() &&
              ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 37 && byte(0x0022F0) == 118) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 37 && byte(0x002300) == 118))
)

achievement(
    title = "Chum Patty", points = 10, type="win_condition",
    description = "Clear Hypnotic Highway as Plankton",
    id = 445567, badge = "515587", published = "7/5/2024 4:06:56 AM", modified = "1/10/2025 10:34:55 PM",
    trigger = byte(0x00050E) == 3 && hypnotic_highway() &&
              ((byte(0x0001F5) == 0 && prev(byte(0x0022F0)) == 39 && byte(0x0022F0) == 119) ||
               (byte(0x0001F5) == 8 && prev(byte(0x002300)) == 39 && byte(0x002300) == 119))
)

achievement(
    title = "\"M\" For Mini", points = 1,
    description = "Collect an extra life for the first time",
    id = 445588, badge = "521853", published = "7/5/2024 4:07:06 AM", modified = "1/10/2025 11:35:54 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 &&
                (bit0(0x00706C) > prev(bit0(0x00706C)) || bit1(0x00706C) > prev(bit1(0x00706C)) ||
                    bit2(0x00706C) > prev(bit2(0x00706C))
                )) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 &&
                (bit0(0x00707C) > prev(bit0(0x00707C)) || bit1(0x00707C) > prev(bit1(0x00707C)) ||
                    bit2(0x00707C) > prev(bit2(0x00707C))
                )))
)

achievement(
    title = "Thank You, Sir Cecil", points = 1,
    description = "Collect a Snooze Wink for the first time",
    id = 445595, badge = "521854", published = "7/5/2024 4:07:09 AM", modified = "1/10/2025 11:35:54 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit4(0x00706C) > prev(bit4(0x00706C))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit4(0x00707C) > prev(bit4(0x00707C))))
)

achievement(
    title = "I Feel All Tingly Inside", points = 1,
    description = "Collect an Electric Cloud for the first time",
    id = 445589, badge = "522532", published = "7/5/2024 4:07:06 AM", modified = "1/11/2025 12:22:22 AM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit5(0x00706C) > prev(bit5(0x00706C))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit5(0x00707C) > prev(bit5(0x00707C))))
)

achievement(
    title = "Where Did Everybody Go?!", points = 1,
    description = "Collect a Moon Shower for the first time",
    id = 445590, badge = "521855", published = "7/5/2024 4:07:07 AM", modified = "1/11/2025 12:22:22 AM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit3(0x00706C) > prev(bit3(0x00706C))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit3(0x00707C) > prev(bit3(0x00707C))))
)

achievement(
    title = "Maximum Overdrive", points = 1,
    description = "Collect a Speed Star for the first time",
    id = 445591, badge = "521856", published = "7/5/2024 4:07:07 AM", modified = "1/10/2025 11:35:55 PM",
    trigger = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && bit7(0x00706C) > prev(bit7(0x00706C))) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && bit7(0x00707C) > prev(bit7(0x00707C))))
)

achievement(
    title = "Are You Ready To Be a Winner?", points = 3,
    description = "Unlock all mini-games by finding each hidden arcade cabinet",
    id = 445573, badge = "521857", published = "7/5/2024 4:06:59 AM", modified = "1/14/2025 3:11:19 AM",
    trigger = ((prev(bitcount(0x000238)) != 8 && byte(0x0001F5) == 0 && measured(bitcount(0x000238) == 8) &&
                prev(byte(0x000C0A)) == 1 &&
                (prev(byte(0x000158)) == 48 || prev(byte(0x000158)) == 52 || prev(byte(0x000158)) == 56 ||
                    prev(byte(0x000158)) == 60 || prev(byte(0x000158)) == 66 || prev(byte(0x000158)) == 71 ||
                    prev(byte(0x000158)) == 72 || prev(byte(0x000158)) == 76
                )) ||
               (prev(bitcount(0x000238)) != 8 && byte(0x0001F5) == 8 && measured(bitcount(0x000238) == 8) &&
                prev(byte(0x000C1A)) == 1 &&
                (prev(byte(0x000158)) == 48 || prev(byte(0x000158)) == 52 || prev(byte(0x000158)) == 56 ||
                    prev(byte(0x000158)) == 60 || prev(byte(0x000158)) == 66 || prev(byte(0x000158)) == 71 ||
                    prev(byte(0x000158)) == 72 || prev(byte(0x000158)) == 76
                )))
)

achievement(
    title = "I'd Say... I'm Already Halfway There!", points = 5,
    description = "Pick up 8 Speed Stars in part 1 of Diesel Dreaming without respawning",
    id = 445571, badge = "523992", published = "7/5/2024 4:06:58 AM", modified = "1/8/2025 3:43:42 AM",
    trigger = diesel_dreaming_1() && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 4)) &&
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
    trigger = diesel_dreaming_3() && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x00300A) >= 7)) &&
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
    trigger = starfishman_rescue_3() && never(word(0x000062) == 0) &&
              ((byte(0x0001F5) == 0 && unless(byte(0x00103C) == 1) &&
                unless(repeated(3900, once(byte(0x000C2F) == 3) && byte(0x000C0A) == 1 && starfishman_rescue_3())) &&
                prev(byte(0x0022F0)) == 10 && trigger_when(byte(0x0022F0) == 87)) ||
               (byte(0x0001F5) == 8 && unless(byte(0x00104C) == 1) &&
                unless(repeated(3900, once(byte(0x000C3F) == 3) && byte(0x000C1A) == 1 && starfishman_rescue_3())) &&
                prev(byte(0x002300)) == 10 && trigger_when(byte(0x002300) == 87)))
)

achievement(
    title = "The Fiery Fist O' Pain", points = 10,
    description = "Defeat Dreaded Patrick in part 4 of Starfish-Man to the Rescue without taking damage",
    id = 445583, badge = "523994", published = "7/5/2024 4:07:03 AM", modified = "1/8/2025 3:43:43 AM",
    trigger = starfishman_rescue_4() && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 11)) &&
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
    trigger = supersized_patty_2() && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 13)) &&
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
    trigger = supersized_patty_4() && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 15)) &&
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
    trigger = alaskan_belly_2() && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 17)) &&
              never((byte(0x0001F5) == 8 && byte(0x002300) != 17)) &&
              ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && byte(0x0022F0) == 17 && unless(byte(0x00103C) == 1) &&
                unless(repeated(6000, once(byte(0x000C0A) == 1 && word(0x000066) == 767) && alaskan_belly_2())) &&
                prev(word(0x000062)) != 5344 && trigger_when(word(0x000062) == 5344)) ||
               (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && byte(0x002300) == 17 && unless(byte(0x00104C) == 1) &&
                unless(repeated(6000, once(byte(0x000C1A) == 1 && word(0x000066) == 767) && alaskan_belly_2())) &&
                prev(word(0x000062)) != 5344 && trigger_when(word(0x000062) == 5344)))
)

achievement(
    title = "82 Kilometers Later...", points = 10,
    description = "Clear part 3 of Rocket Rodeo without getting hit and without shooting a laser",
    id = 445592, badge = "535050", published = "7/5/2024 4:07:08 AM", modified = "1/8/2025 3:43:45 AM",
    trigger = rocket_rodeo_3() && never(word(0x000062) == 0) &&
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
    trigger = plankton_monster_2() &&
              ((byte(0x0001F5) == 0 && byte(0x0022F0) == 26 && byte(0x000C0A) == 1 && byte(0x007274) == 0 &&
                prev(word(0x000066)) != 800 && trigger_when(word(0x000066) == 800)) ||
               (byte(0x0001F5) == 8 && byte(0x002300) == 26 && byte(0x000C1A) == 1 && byte(0x007284) == 0 &&
                prev(word(0x000066)) != 800 && trigger_when(word(0x000066) == 800)))
)

achievement(
    title = "I'll Have To Sue For My Pain and Suffering", points = 5,
    description = "Make it to the end of the final part of Revenge of the Giant Plankton Monster while surviving at least 10 attacks from Bikini Bottomites",
    id = 445594, badge = "535052", published = "7/5/2024 4:07:08 AM", modified = "1/8/2025 3:43:46 AM",
    trigger = plankton_monster_4() && never(word(0x000062) == 0) && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 28)) &&
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
              trigger_when(bikini_bottom_4()) &&
              ((byte(0x0001F5) == 0 && prev(byte(0x000C0A)) == 1 &&
                unless(once(byte(0x0022F0) == 31 && byte(0x002C22) > 0 && byte(0x002C22) < prev(byte(0x002C22))))) ||
               (byte(0x0001F5) == 8 && prev(byte(0x000C1A)) == 1 &&
                unless(once(byte(0x002300) == 31 && byte(0x002C32) > 0 && byte(0x002C32) < prev(byte(0x002C32))))))
)

achievement(
    title = "I Am Confident In My Abilities To Successfully Succeed", points = 10,
    description = "Defeat Plankton in the final part of It Came From Bikini Bottom without taking damage",
    id = 445596, badge = "535054", published = "7/5/2024 4:07:09 AM", modified = "1/8/2025 3:43:46 AM",
    trigger = bikini_bottom_4() && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 32)) &&
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
    trigger = rooftop_rumble_1() && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 33)) &&
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
    trigger = rooftop_rumble_3() && never((byte(0x0001F5) == 0 && byte(0x0022F0) != 35)) &&
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
    trigger = hypnotic_highway() && never((byte(0x0001F5) == 0 && byte(0x0022F0) == 131)) &&
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
    trigger = trampoline() && prev(byte(0x009876)) == 0 && byte(0x009876) == 1
)

achievement(
    title = "All That Glitters", points = 4,
    description = "Reach Round 6 of the Spatula Toss minigame",
    id = 445576, badge = "535272", published = "7/5/2024 4:07:00 AM", modified = "1/10/2025 10:58:16 PM",
    trigger = target() && prev(byte(0x009876)) == 5 && byte(0x009876) == 6
)

achievement(
    title = "Rock Bottom", points = 5,
    description = "Score 50 points or more in the Pit minigame",
    id = 445577, badge = "535273", published = "7/5/2024 4:07:00 AM", modified = "1/10/2025 10:58:16 PM",
    trigger = pit() && prev(word(0x000560)) == 49 && word(0x000560) == 50
)

achievement(
    title = "The Krusty Plate", points = 4,
    description = "Reach Round 6 in the Plate Spinning minigame",
    id = 445578, badge = "535274", published = "7/5/2024 4:07:01 AM", modified = "1/10/2025 10:58:17 PM",
    trigger = plates() && prev(byte(0x009862)) == 5 && byte(0x009862) == 6
)

achievement(
    title = "Jellyfishing", points = 4,
    description = "Reach Round 6 of the Jellyfishing minigame",
    id = 445579, badge = "535275", published = "7/5/2024 4:07:01 AM", modified = "1/11/2025 9:29:33 PM",
    trigger = jellyfish() && prev(byte(0x009876)) == 5 && byte(0x009876) == 6
)

achievement(
    title = "Sandy, SpongeBob, and the Worm", points = 4,
    description = "Reach Round 6 of the Worm minigame",
    id = 445580, badge = "535276", published = "7/5/2024 4:07:02 AM", modified = "1/10/2025 10:58:18 PM",
    trigger = worm() && prev(byte(0x009862)) == 5 && byte(0x009862) == 6
)

achievement(
    title = "The Sponge Who Could Fly", points = 5,
    description = "Score 100 points or more in the Float minigame",
    id = 445581, badge = "535277", published = "7/5/2024 4:07:02 AM", modified = "1/10/2025 10:58:19 PM",
    trigger = float() && prev(byte(0x009876)) == 0 && byte(0x009876) == 1
)

achievement(
    title = "The Fry Cook Games", points = 3,
    description = "Win the Hurdle minigame",
    id = 445582, badge = "535278", published = "7/5/2024 4:07:03 AM", modified = "1/10/2025 10:58:19 PM",
    trigger = hurdles() && prev(byte(0x009876)) == 0 && byte(0x009876) == 2
)

leaderboard(
    id = 106812, title = "High Score - The Pit",
    description = "Get the highest score in The Pit minigame!",
    start  = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && pit()) ||
              (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && pit())),
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
    start  = ((byte(0x0001F5) == 0 && byte(0x000C0A) == 1 && float()) ||
              (byte(0x0001F5) == 8 && byte(0x000C1A) == 1 && float())),
    cancel = ((byte(0x0001F5) == 0 && word(0x0022F0) == 40) ||
              (byte(0x0001F5) == 8 && byte(0x002300) == 40)),
    submit = word(0x009828) == 0,
    value  = measured((byte(0x00989E) * 1 + byte(0x00988A) * 10 + byte(0x009876) * 100)),
    format = "VALUE"
)

leaderboard(
    id = 114885, title = "Train Stopper",
    description = "Clear part 3 of Starfish-Man to the rescue in the fastest time!",
    start  = starfishman_rescue_3() &&
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
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 114886, title = "Bull Worm Gastroenterologist",
    description = "Clear part 2 of Alaskan Belly Trouble in the fastest time!",
    start  = alaskan_belly_2() && word(0x000066) == 767 &&
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
    format = "FRAMES", lower_is_better = true
)

// Rich Presence

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
