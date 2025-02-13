// SpongeBob SquarePants: Creature from the Krusty Krab
// #ID = 7698
// RA Hash: 45e6e3088c5c9006175aaf045e8795e8 (USA)
//          7f22c443ec71a696d84ae46a9fe61980 (Europe)

// Code Notes

// 0x0062: [16-bit] Screen X axis scroll
function respawn() => word(0x000062) == 0
function stage_position_x() => word(0x000062)
		
// 0x0066: [16-bit] Screen Y axis scroll
function stage_position_y() => word(0x000066)
		
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
function starfishman_rescue_1() => byte(0x000158) == 52
function starfishman_rescue_3() => byte(0x000158) == 54
function starfishman_rescue_4() => byte(0x000158) == 55
function supersized_patty_1() => byte(0x000158) == 56
function supersized_patty_2() => byte(0x000158) == 57
function supersized_patty_4() => byte(0x000158) == 59
function alaskan_belly_2() => byte(0x000158) == 60
function rocket_rodeo_3() => byte(0x000158) == 66
function plankton_monster_2() => byte(0x000158) == 69
function plankton_monster_4() => byte(0x000158) == 71
function bikini_bottom_1() => byte(0x000158) == 72
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
function stage_rpc() => byte(0x000158)
		
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
		
// 0x0357: [8-bit] Goo Status
//         0x00: Out of Goo
//         0x01: In Goo
function goo() => byte(0x000357) == 1
		
// 0x04FC: [16-bit] Countdown Timer
//         Tied to graphical countdown timer in-level. Once it hits 0000, player dies and is respawned at the start and timer resets.
function time_left() => word(0x0004FC)
		
// 0x050E: [8-bit] Hypnotic Highway Vehicle Selection
//         0x01: SpongeBob
//         0x02: Patrick
//         0x03: Plankton
function sponge_racer() => byte(0x00050E) == 1
function pat_racer() => byte(0x00050E) == 2
function plank_racer() => byte(0x00050E) == 3
		
//0x0560: [16-bit] Pit Minigame
//        Score from the pit minigame. Value updates each time the player hits a new platform lower than the current one.
function pit_score() => word(0x000560)
		
// 0x0C0A: [USA] [8-bit] In-Game Indicator
//         0x00: Not in-game
//         0x01: In-game
//         0x03: In-game only during final Plankton boss for some reason
//         0x06: In-game during Rocket level
function usa_in_stage() => byte(0x000C0A) == 1
function usa_in_final_boss() => byte(0x000C0A) == 3
function usa_in_rocket() => byte(0x000C0A) == 6
		
// 0x0C1A: [EUR] [8-bit] In-Game Indicator
//         0x00: Not in-game
//         0x01: In-game
//         0x03: In-game only during final Plankton boss for some reason
//         0x06: In-game during Rocket level
function europe_in_stage() => byte(0x000C1A) == 1
function europe_in_final_boss() => byte(0x000C1A) == 3
function europe_in_rocket() => byte(0x000C1A) == 6
		
// 0x0C2F: [USA] [8-bit] Train Sections
//         Increases as you move along the train. Stage starts at 2 when cutscene glide plays and then goes to 3 as you land on the first one you're able to move on
function usa_on_train() => byte(0x000C2F) == 3
		
// 0x0C3F: [EUR] [8-bit] Train Sections
//         Increases as you move along the train. Stage starts at 2 when cutscene glide plays and then goes to 3 as you land on the first one you're able to move on
function eur_on_train() => byte(0x000C3F) == 3
		
// 0x0F10: [USA] [BitCount] Player Control
//         Bit 0: A
//         Bit 1: B
//         Bit 2: Select
//         Bit 3: Start
//         Bit 4: Right
//         Bit 5: Left
//         Bit 6: Up
//         Bit 7: Down
function usa_laser() => bit1(0x000F10) == 1
		
// 0x103C: [USA] [8-bit] Pause Indicator
//         0x00: Not paused
//         0x01: Paused
function usa_pause() => byte(0x00103C) == 1
		
// 0x104C: [EUR] [8-bit] Pause Indicator
//         0x00: Not paused
//         0x01: Paused
function eur_pause() => byte(0x00104C) == 1
		
// 0x14A4: [EUR] [BitCount] Player Control
//         Bit 0: A
//         Bit 1: B
//         Bit 2: Select
//         Bit 3: Start
//         Bit 4: Right
//         Bit 5: Left
//         Bit 6: Up
//         Bit 7: Down
function eur_laser() => bit1(0x0014A4) == 1
		
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
function usa_screen() => byte(0x0022F0)
		
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
function eur_screen() => byte(0x002300)
		
// 0x2C22: [USA] [8-bit] Player Health
//         Max: 0x0a
function usa_health() => byte(0x002C22)
		
// 0x2C32: [EUR] [8-bit] Player Health
//         Max: 0x0a
function eur_health() => byte(0x002C32)
		
// 0x2C35: [USA] [8-bit] Various Player Data
//         [SpongeBob]
//         Car Parts Tally
//         [Patrick]
//         Starfish-Man Combo
//         0x01: Punch
//         0x02: Uppercut
//         0x03: Shove
function usa_all_car_parts() => byte(0x002C35) == 5
		
// 0x2C45: [EUR] [8-bit] Various Player Data
//         [SpongeBob]
//         Car Parts Tally
//         [Patrick]
//         Starfish-Man Combo
//         0x01: Punch
//         0x02: Uppercut
//         0x03: Shove
function eur_all_car_parts() => byte(0x002C45) ==5
		
// 0x2C62: [USA] [8-bit] Starfish-Man Gliding Status
//         0x00: Not Gliding
//         0x01: Cutscene Glide
//         0x02: Running on Ground
//         0x03: Player Gliding
//         0xff: Glide Turnaround
function usa_gliding() => byte(0x002C62) == 3
		
// 0x2C72: [EUR] [8-bit] Starfish-Man Gliding Status
//         0x00: Not Gliding
//         0x01: Cutscene Glide
//         0x02: Running on Ground
//         0x03: Player Gliding
//         0xff: Glide Turnaround
function eur_gliding() => byte(0x002C72) == 3
		
// 0x2C78: [USA] [8-bit] Enemy Cling Number
//         Goes up by 1 with each enemy that clings on to you for a maximum of 5
function usa_cling() => byte(0x002C78) != 0
		
// 0x2C88: [EUR] [8-bit] Enemy Cling Number
//         Goes up by 1 with each enemy that clings on to you for a maximum of 5
function eur_cling() => byte(0x002C88) != 0
		
// 0x300A: [USA] [8-bit] Diesel Dreaming 3 Car HP
//         Value increases from 0 as stage goes on, when value reaches 0a, car breaks down
//         0x04: Yellow Indicator
//         0x07: Red Indicator (Critically low)
function usa_car_critical() => byte(0x00300A) >= 7
		
// 0x301A: [EUR] [8-bit] Diesel Dreaming 3 Car HP
//         Value increases from 0 as stage goes on, when value reaches 0a, car breaks down
//         0x04: Yellow Indicator
//         0x07: Red Indicator (Critically low)
function eur_car_critical() => byte(0x00301A) >= 7
		
// 0x5E10: [USA] [8-bit] Boss Defeat Flag
//         0x01: Defeated
function usa_boss_kill() => byte(0x005E10) == 1
		
// 0x5E20: [EUR] [8-bit] Boss Defeat Flag
//         0x01: Defeated
function eur_boss_kill() => byte(0x005E20) == 1
		
// 0x6FE0: [USA] [8-bit] Lives Counter #1
//         Used in file 1
function lives_1() => byte(0x006FE0)
		
// 0x6FE8: [USA] [8-bit] Lives Counter #2
//         Used in File 2
function lives_2() => byte(0x006FE8)
		
// 0x6FF0: [USA] [8-bit] Lives Counter #3
//         Used in file 3
//         [EUR] [8-bit] Lives Counter #1
//         Used in file 1
function lives_3() => byte(0x006FF0)
		
// 0x6FF8: [EUR] [8-bit] Lives Counter #2
//         Used in File 2
function lives_4() => byte(0x006FF8)
		
// 0x7000: [EUR] [8-bit] Lives Counter #3
//         Used in File 3
function lives_5() => byte(0x007000)
		
// 0x7010: [USA] [8-bit] Save File Select
//         0x01: File 1
//         0x02: File 2
//         0x03: File 3
function usa_save() => byte(0x007010)
		
// 0x7020: [EUR] [8-bit] Save File Select
//         0x01: File 1
//         0x02: File 2
//         0x03: File 3
function eur_save() => byte(0x007020)
		
// 0x705C: [USA] [8-bit] Game Scene Indicator
//         Linearly progresses consistently with each in-game cutscene. 
//         Value stays in memory even after a game over and only changes depending on cutscene load.
function usa_scene() => byte(0x00705C)
		
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
function usa_1up_get() => 
                        bit0(0x00706C) > prev(bit0(0x00706C)) || bit1(0x00706C) > prev(bit1(0x00706C)) ||
                        bit2(0x00706C) > prev(bit2(0x00706C))
function usa_health_get() => bit4(0x00706C) > prev(bit4(0x00706C))
function usa_invincibility_get() => bit5(0x00706C) > prev(bit5(0x00706C))
function usa_poof() => bit3(0x00706C) > prev(bit3(0x00706C))
function usa_speed_star_get() => bit7(0x00706C) > prev(bit7(0x00706C))
function usa_speed_star() => bit7(0x00706C)
function eur_scene() => byte(0x00706C)
		
// 0x707C: [EUR] [BitCount] Variable Collectible
//         Bit 0: Patrick Extra Life
//         Bit 1: Plankton Extra Life
//         Bit 2: SpongeBob Extra Life
//         Bit 3: Moon Shower
//         Bit 4: Snooze Wink
//         Bit 5: Electric Cloud
//         Bit 6: Secret Mini-Game
//         Bit 7: Speed Star
function eur_1up_get() =>
                        bit0(0x00707C) > prev(bit0(0x00707C)) || bit1(0x00707C) > prev(bit1(0x00707C)) ||
                        bit2(0x00707C) > prev(bit2(0x00707C))
function eur_health_get() => bit4(0x00707C) > prev(bit4(0x00707C))
function eur_invincibility_get() => bit5(0x00707C) > prev(bit5(0x00707C))
function eur_poof() => bit3(0x00707C) > prev(bit3(0x00707C))
function eur_speed_star_get() => bit7(0x00707C) > prev(bit7(0x00707C))
function eur_speed_star() => bit7(0x00707C)
		
// 0x7274: [USA] [8-bit] Revenge of the Giant Plankton Monster 2 Bridge Pieces Destroyed
//         Increments by 1 value for each part of the bridge broken by enemies, until 6, where it collapses.
function usa_bridge_intact() => byte(0x007274) == 0
		
// 0x7284: [EUR] [8-bit] Revenge of the Giant Plankton Monster 2 Bridge Pieces Destroyed
//         Increments by 1 value for each part of the bridge broken by enemies, until 6, where it collapses.
function eur_bridge_intact() => byte(0x007284) == 0

// 0x9828: [16-bit] Minigame Game Over
//         0x0000 Indicates Game Over screen
function game_over() => word(0x009828) == 0
		
// 0x9862: [8-bit] Plate Spinning/Worm Minigame Current Round
function minigame_data_1() => byte(0x009862)
		
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
function minigame_data_2() => byte(0x009876)
function float_score_hundreds() => byte(0x009876) * 100
		
// 0x988A: [8-bit] Float Maze Minigame Score (0000x0)
function float_score_tens() => byte(0x00988A) * 10
		
// 0x989E: [8-bit] Float Maze Minigame Score (00000x)
function float_score_ones() => byte(0x00989E) * 1
function float_score() => float_score_ones() + float_score_tens() + float_score_hundreds()


achievement(
    title = "And the Winner Is... SpringBoob SquirePin!",
    description = "Clear Diesel Dreaming",
    id = 445557, 
    badge = "515577",
    points = 3, 
    type="progression",
    trigger = 
            (
                (usa() && 
                prev(usa_screen()) == 83 && usa_screen() == 124) ||
                
                (europe() && 
                prev(eur_screen()) == 83 && eur_screen() == 124)
               )
)

achievement(
    title = "Fear Not, Starfish-Man Is Here",
    description = "Clear Starfish-Man to the Rescue",
    id = 445558, 
    badge = "515578",
    points = 3, 
    type="progression",
    trigger =
            (
                (usa() && 
                prev(usa_screen()) == 89 && usa_screen() == 125) ||
                
                (europe() && 
                prev(eur_screen()) == 89 && eur_screen() == 125)
                )
)

achievement(
    title = "I Can Deny It No Longer! I Am Small...",
    description = "Clear Super-Sized Patty",
    id = 445559, 
    badge = "515579",
    points = 3, 
    type="progression",
    trigger = 
            (
                (usa() && 
                prev(usa_screen()) == 94 && usa_screen() == 126) ||
                
                (europe() && 
                prev(eur_screen()) == 94 && eur_screen() == 126)
                )
)

achievement(
    title = "It's Big, Scary, and Pink!",
    description = "Clear Alaskan Belly Trouble",
    id = 445560, 
    badge = "515580",
    points = 5, 
    type="progression",
    trigger = 
            (
                (usa() && 
                prev(usa_screen()) == 98 && usa_screen() == 127) ||
                
                (europe() && 
                prev(eur_screen()) == 98 && eur_screen() == 127)
                )
)

achievement(
    title = "Hey, Who Turned the Heavy Back On?",
    description = "Clear Rocket Rodeo",
    id = 445561, 
    badge = "515581", 
    points = 5, 
    type="progression",
    trigger = 
            (
                (usa() && 
                prev(usa_screen()) == 101 && usa_screen() == 128) ||
                
                (europe() && 
                prev(eur_screen()) == 101 && eur_screen() == 128)
                )
)

achievement(
    title = "I Will Destroy All of You!",
    description = "Clear Revenge of the Giant Plankton Monster",
    id = 445562, 
    badge = "515582",
    points = 5, 
    type="progression",
    trigger = 
            (
                (usa() && 
                prev(usa_screen()) == 108 && usa_screen() == 129) ||
                
                (europe() && 
                prev(eur_screen()) == 108 && eur_screen() == 129)
                )
)

achievement(
    title = "The SquarePants Flyer Mark III",
    description = "Clear It Came From Bikini Bottom",
    id = 445563, 
    badge = "515583",
    points = 5, 
    type="progression",
    trigger = 
            (
                (usa() && 
                prev(usa_screen()) == 111 && usa_screen() == 130) ||
                
                (europe() && 
                prev(eur_screen()) == 111 && eur_screen() == 130)
                )
)

achievement(
    title = "I Am Starfish-Man: Defender of Bikini Bottom!",
    description = "Clear Rooftop Rumble",
    id = 445564, 
    badge = "515584",
    points = 10, 
    type="progression",
    trigger = 
            rooftop_rumble_3() &&
              (
                (usa() && 
                prev(!usa_boss_kill()) && usa_boss_kill()) ||
                
                (europe() && 
                prev(!eur_boss_kill()) && eur_boss_kill())
                )
)

achievement(
    title = "Jelly Patty",
    description = "Clear Hypnotic Highway with SpongeBob",
    id = 445565, 
    badge = "515585",
    points = 10, 
    type="win_condition",
    trigger = 
            sponge_racer() && 
            hypnotic_highway() &&
              (
                (usa() && 
                prev(usa_screen()) == 38 && usa_screen() == 120) ||
                
                (europe() && 
                prev(eur_screen()) == 38 && eur_screen() == 120)
                )
)

achievement(
    title = "Krabby Double Deluxe",
    description = "Clear Hypnotic Highway as Patrick",
    id = 445566, 
    badge = "515586",
    points = 10, 
    type="win_condition",
    trigger = 
            pat_racer() && hypnotic_highway() &&
              (
                (usa() && 
                prev(usa_screen()) == 37 && usa_screen() == 118) ||
                
                (europe() && 
                prev(eur_screen()) == 37 && eur_screen() == 118)
                )
)

achievement(
    title = "Chum Patty",
    description = "Clear Hypnotic Highway as Plankton",
    id = 445567, 
    badge = "515587", 
    points = 10, 
    type="win_condition",
    trigger = 
            plank_racer() && hypnotic_highway() &&
              (
                (usa() && 
                prev(usa_screen()) == 39 && usa_screen() == 119) ||
                
                (europe() && 
                prev(eur_screen()) == 39 && eur_screen() == 119)
                )
)

achievement(
    title = "\"M\" For Mini",
    description = "Collect an extra life for the first time",
    id = 445588, 
    badge = "521853",
    points = 1,
    trigger = 
            (
                (usa() && 
                usa_in_stage() && usa_1up_get()) ||
                
                (europe() && 
                europe_in_stage() && eur_1up_get())
                )
)

achievement(
    title = "Thank You, Sir Cecil", 
    description = "Collect a Snooze Wink for the first time",
    id = 445595, 
    badge = "521854",
    points = 1,
    trigger = 
            (
                (usa() && 
                usa_in_stage() && usa_health_get()) ||
                
                (europe() && 
                europe_in_stage() && eur_health_get())
                )
)

achievement(
    title = "I Feel All Tingly Inside", 
    description = "Collect an Electric Cloud for the first time",
    id = 445589, 
    badge = "522532",
    points = 1,
    trigger = 
            (
                (usa() && 
                usa_in_stage() && usa_invincibility_get()) ||
                
                (europe() && 
                europe_in_stage() && eur_invincibility_get())
                )
)

achievement(
    title = "Where Did Everybody Go?!", 
    description = "Collect a Moon Shower for the first time",
    id = 445590, 
    badge = "521855",
    points = 1,
    trigger = 
            (
                (usa() && 
                usa_in_stage() && usa_poof()) ||
                
                (europe() && 
                europe_in_stage() && eur_poof())
                )
)

achievement(
    title = "Maximum Overdrive", 
    description = "Collect a Speed Star for the first time",
    id = 445591, 
    badge = "521856",
    points = 1,
    trigger = 
            (
                (usa() && 
                usa_in_stage() && usa_speed_star_get()) ||
                
                (europe() && 
                europe_in_stage() && eur_speed_star_get())
                )
)

achievement(
    title = "Are You Ready To Be a Winner?",
    description = "Unlock all mini-games by finding each hidden arcade cabinet",
    id = 445573, 
    badge = "521857",
    points = 3,
    trigger = 
            (
                (prev(!minigames_unlocked()) && usa() && 
                measured(minigames_unlocked()) &&
                prev(usa_in_stage()) &&
                    (prev(diesel_dreaming_1()) || prev(starfishman_rescue_1()) || prev(supersized_patty_1()) ||
                    prev(alaskan_belly_2()) || prev(rocket_rodeo_3()) || prev(plankton_monster_4()) ||
                    prev(bikini_bottom_1()) || prev(rooftop_rumble_1())
                )) ||
                
                (prev(!minigames_unlocked()) && europe() && 
                measured(minigames_unlocked()) &&
                prev(europe_in_stage()) &&
                    (prev(diesel_dreaming_1()) || prev(starfishman_rescue_1()) || prev(supersized_patty_1()) ||
                    prev(alaskan_belly_2()) || prev(rocket_rodeo_3()) || prev(plankton_monster_4()) ||
                    prev(bikini_bottom_1()) || prev(rooftop_rumble_1())
                ))
                )
)

achievement(
    title = "I'd Say... I'm Already Halfway There!",
    description = "Pick up 8 Speed Stars in part 1 of Diesel Dreaming without respawning",
    id = 445571, 
    badge = "523992",
    points = 5,
    trigger = 
            diesel_dreaming_1() && 
            never(respawn()) && 
            never((usa() && usa_screen() != 4)) &&
            never((europe() && eur_screen() != 4)) &&
                (
                    (usa() &&
                    (usa_in_stage() && 
                    usa_screen() == 4 &&
                    measured(tally(8, repeated(8, usa() && 
                    prev(usa_speed_star()) == 0 && usa_speed_star() == 1))))) ||
                    
                    (europe() &&
                    (europe_in_stage() && 
                    eur_screen() == 4 &&
                    measured(tally(8, repeated(8, europe() && 
                    prev(eur_speed_star()) == 0 && eur_speed_star() == 1)))))
                    )
)

achievement(
    title = "SpongeBob GreasePants",
    description = "Repair the car in part 3 of Diesel Dreaming without getting damaged and before letting the car reach critical condition",
    id = 445568, 
    badge = "523993",
    points = 10,
    trigger = 
            diesel_dreaming_3() && 
            never(respawn()) && 
            never((usa() && usa_car_critical())) &&
            never((europe() && eur_car_critical())) && 
            never((usa() && usa_screen() != 6)) &&
            never((europe() && eur_screen() != 6)) &&
                (
                    (usa() && 
                    usa_in_stage() && 
                    usa_screen() == 6 &&
                    unless(once(usa_health() < prev(usa_health()))) && 
                    prev(!usa_all_car_parts()) &&
                    trigger_when(usa_all_car_parts())) ||
                    
                    (europe() && 
                    europe_in_stage() &&
                    eur_screen() == 6 &&
                    unless(once(eur_health() < prev(eur_health()))) && 
                    prev(!eur_all_car_parts()) &&
                    trigger_when(eur_all_car_parts()))
                )
)

achievement(
    title = "I Told You Taking The Train Was a Mistake", 
    description = "Clear part 3 of Starfish-Man to the Rescue in under 1:05",
    id = 445584, 
    badge = "516845",
    points = 10,
    trigger = 
            starfishman_rescue_3() && 
            never(respawn()) &&
                (
                    (usa() && 
                    unless(usa_pause()) &&
                    unless(repeated(3900, once(usa_on_train()) && 
                    usa_in_stage() && starfishman_rescue_3())) &&
                    prev(usa_screen()) == 10 && 
                    trigger_when(usa_screen() == 87)) ||
                    
                    (europe() && 
                    unless(eur_pause()) &&
                    unless(repeated(3900, once(eur_on_train()) && 
                    europe_in_stage() && starfishman_rescue_3())) &&
                    prev(eur_screen()) == 10 && 
                    trigger_when(eur_screen() == 87))
                    )
)

achievement(
    title = "The Fiery Fist O' Pain", 
    description = "Defeat Dreaded Patrick in part 4 of Starfish-Man to the Rescue without taking damage",
    id = 445583, 
    badge = "523994",
    points = 10,
    trigger = 
            starfishman_rescue_4() &&
            never(respawn()) &&
            never((usa() && 
            usa_screen() != 11)) &&
            never((europe() && 
            eur_screen() != 11)) &&
                (
                    (usa() && 
                    usa_in_stage() && 
                    usa_screen() == 11 &&
                    unless(once(usa_health() > 0 && usa_health() < prev(usa_health()))) && 
                    prev(!usa_boss_kill()) &&
                    trigger_when(usa_boss_kill())) ||
                    
                    (europe() && 
                    europe_in_stage() && 
                    eur_screen() == 11 &&
                    unless(once(eur_health() > 0 && eur_health() < prev(eur_health()))) && 
                    prev(!eur_boss_kill()) &&
                    trigger_when(eur_boss_kill()))
                    )
)

achievement(
    title = "The Sticky Goo of My Own Folley", 
    description = "Clear part 2 of Super-Sized Patty without touching the goo",
    id = 445569, 
    badge = "531807",
    points = 10,
    trigger = 
            supersized_patty_2() && 
            never(respawn()) && 
            never((usa() && 
            usa_screen() != 13)) &&
            never((europe() && 
            eur_screen() != 13)) &&
                (
                    (usa() && 
                    usa_screen() == 13 && 
                    usa_in_stage() && 
                    unless(once(goo())) &&
                    prev(stage_position_x()) != 4208 && 
                    trigger_when(stage_position_x() == 4208)) ||
                    
                    (europe() && 
                    eur_screen() == 13 && 
                    europe_in_stage() && 
                    unless(once(goo())) &&
                    prev(stage_position_x()) != 4208 && 
                    trigger_when(stage_position_x() == 4208))
                    )
)

achievement(
    title = "A Little Too Much Sauce",
    description = "Defeat the Patty boss in part 4 of Super-Sized Patty without getting hit",
    id = 445570, 
    badge = "531808",
    points = 10,
    trigger = 
            supersized_patty_4() && 
            never(respawn()) && 
            never((usa() && 
            usa_screen() != 15)) &&
            never((europe() && 
            eur_screen() != 15)) &&
                (
                    (usa() && 
                    usa_in_stage() && 
                    usa_screen() == 15 &&
                    unless(once(usa_health() > 0 && usa_health() < prev(usa_health()))) && 
                    prev(!usa_boss_kill()) &&
                    trigger_when(usa_boss_kill())) ||
               
                    (europe() && 
                    europe_in_stage() && 
                    eur_screen() == 15 &&
                    unless(once(eur_health() > 0 && eur_health() < prev(eur_health()))) && 
                    prev(!eur_boss_kill()) &&
                    trigger_when(eur_boss_kill()))
                    )
)

achievement(
    title = "One Very Long Digestive Tract Later...", 
    description = "Make your way through part 2 of Alaskan Belly Trouble in under 1:40",
    id = 445593, 
    badge = "516846",
    points = 10,
    trigger = 
            alaskan_belly_2() && 
            never(respawn()) && 
            never((usa() && 
            usa_screen() != 17)) &&
            never((europe() && 
            eur_screen() != 17)) &&
                (
                    (usa() && 
                    usa_in_stage() && 
                    usa_screen() == 17 && 
                    unless(usa_pause()) &&
                    unless(repeated(6000, once(usa_in_stage() && 
                    stage_position_y() == 767) && 
                    alaskan_belly_2())) &&
                    prev(stage_position_x()) != 5344 && 
                    trigger_when(stage_position_x() == 5344)) ||
                    
                    (europe() && 
                    europe_in_stage() && 
                    eur_screen() == 17 && 
                    unless(eur_pause()) &&
                    unless(repeated(6000, once(europe_in_stage() && 
                    stage_position_y() == 767) && 
                    alaskan_belly_2())) &&
                    prev(stage_position_x()) != 5344 && 
                    trigger_when(stage_position_x() == 5344))
                    )
)

achievement(
    title = "82 Kilometers Later...",
    description = "Clear part 3 of Rocket Rodeo without getting hit and without shooting a laser",
    id = 445592, 
    badge = "535050",
    points = 10,
    trigger = 
            rocket_rodeo_3() && 
            never(respawn()) &&
                (
                    (usa() &&
                    unless(once(usa_screen() == 23 && 
                    usa_in_rocket() && 
                    prev(!usa_laser()) && usa_laser())) &&
                    unless(once(usa_health() > 0 && usa_health() < prev(usa_health()))) && 
                    prev(usa_screen()) == 23 &&
                    trigger_when(usa_screen() == 100)) ||
                    
                    (europe() &&
                    unless(once(eur_screen() == 23 && 
                    europe_in_rocket() && 
                    prev(!eur_laser()) && eur_laser())) &&
                    unless(once(eur_health() > 0 && eur_health() < prev(eur_health()))) && 
                    prev(eur_screen()) == 23 &&
                    trigger_when(eur_screen() == 100))
                    )
)

achievement(
    title = "I See You... Zap!",
    description = "Clear part 2 of Revenge of the Giant Plankton Monster without letting any part of the bridge crumble",
    id = 445572, 
    badge = "535051",
    points = 10,
    trigger = 
            plankton_monster_2() &&
                (
                    (usa() && 
                    usa_screen() == 26 && 
                    usa_in_stage() && 
                    usa_bridge_intact() &&
                    prev(stage_position_y()) != 800 && 
                    trigger_when(stage_position_y() == 800)) ||
                    
                    (europe() && 
                    eur_screen() == 26 && 
                    europe_in_stage() && 
                    eur_bridge_intact() &&
                    prev(stage_position_y()) != 800 && 
                    trigger_when(stage_position_y() == 800))
                    )
)

achievement(
    title = "I'll Have To Sue For My Pain and Suffering", 
    description = "Make it to the end of the final part of Revenge of the Giant Plankton Monster while surviving at least 10 attacks from Bikini Bottomites",
    id = 445594, 
    badge = "535052",
    points = 5,
    trigger = 
            plankton_monster_4() && 
            never(respawn()) && 
            never((usa() && 
            usa_screen() != 28)) &&
            never((europe() && 
            eur_screen() != 28)) &&
                (
                    (usa() && 
                    usa_screen() == 28 && 
                    usa_in_stage() && 
                    prev(stage_position_y()) != 2307 &&
                    stage_position_y() == 2307 && 
                    repeated(10, usa_health() > 0 && usa_health() < prev(usa_health()))) ||
               
                    (europe() && 
                    eur_screen() == 28 && 
                    europe_in_stage() && 
                    prev(stage_position_y()) != 2307 &&
                    stage_position_y() == 2307 && 
                    repeated(10, eur_health() > 0 && eur_health() < prev(eur_health())))
                    )
)

achievement(
    title = "Local Nutcase Tries to Fly",
    description = "Clear part 3 of It Came From Bikini Bottom without getting hit from Plankton's laser eye",
    id = 445574, 
    badge = "535053",
    points = 10,
    trigger = 
            never((usa() && 
            usa_screen() != 133 && 
            respawn())) &&
            never((europe() && 
            eur_screen() != 133 && 
            respawn())) && 
            prev(byte(0x000158)) == 74 &&
            trigger_when(bikini_bottom_4()) &&
                (
                    (usa() && 
                    prev(usa_in_stage()) &&
                    unless(once(usa_screen() == 31 && 
                    usa_health() > 0 && usa_health() < prev(usa_health())))) ||
                    
                    (europe() && 
                    prev(europe_in_stage()) &&
                    unless(once(eur_screen() == 31 && eur_health() > 0 && 
                    eur_health() < prev(eur_health()))))
                    )
)

achievement(
    title = "I Am Confident In My Abilities To Successfully Succeed", 
    description = "Defeat Plankton in the final part of It Came From Bikini Bottom without taking damage",
    id = 445596, 
    badge = "535054",
    points = 10,
    trigger = 
            bikini_bottom_4() && 
            never(respawn()) && 
            never((usa() && 
            usa_screen() != 32)) &&
            never((europe() && 
            eur_screen() != 32)) &&
                (
                    (usa() && 
                    usa_screen() == 32 && 
                    usa_in_stage() &&
                    unless(once(usa_health() < prev(usa_health()))) && 
                    prev(!usa_boss_kill()) &&
                    trigger_when(usa_boss_kill())) ||
                    
                    (europe() && 
                    eur_screen() == 32 && 
                    europe_in_stage() &&
                    unless(once(eur_health() < prev(eur_health()))) && 
                    prev(!eur_boss_kill()) &&
                    trigger_when(eur_boss_kill()))
                    )
)

achievement(
    title = "Don't Touch Me, I'm Sterile!",
    description = "Get through part 1 of Rooftop Rumble without gliding and without getting clinged on by Plankton's minions",
    id = 445586, 
    badge = "535055",
    points = 10,
    trigger = 
            rooftop_rumble_1() && 
            never((usa() && 
            usa_screen() != 33)) &&
            never((europe() && 
            eur_screen() != 33)) &&
                (
                    (usa() && 
                    usa_screen() == 33 && 
                    usa_in_stage() && 
                    unless(once(usa_cling())) &&
                    unless(once(usa_gliding())) && 
                    prev(stage_position_x()) < 7728 && 
                    trigger_when(stage_position_x() >= 7728)) ||
                    
                    (europe() && 
                    eur_screen() == 33 && 
                    europe_in_stage() && 
                    unless(once(eur_cling())) &&
                    unless(once(eur_gliding())) && 
                    prev(stage_position_x()) < 7728 && 
                    trigger_when(stage_position_x() >= 7728))
                    )
)

achievement(
    title = "Laser Equipped Bermuda Shorts", 
    description = "Defeat Plankton in the final part of Rooftop Rumble without shooting your laser more than 150 times",
    id = 445585, 
    badge = "535269",
    points = 25,
    trigger = 
            rooftop_rumble_3() && 
            never((usa() && 
            usa_screen() != 35)) &&
            never((europe() && 
            eur_screen() != 35)) && 
            never(respawn()) &&
                (
                    (usa() && 
                    usa_screen() == 35 && 
                    usa_in_final_boss() && 
                    prev(!usa_boss_kill()) &&
                    trigger_when(usa_boss_kill()) &&
                    unless(repeated(150, usa_in_final_boss() && 
                    prev(!usa_laser()) && usa_laser()))) ||
                    
                    (europe() && 
                    eur_screen() == 35 && 
                    europe_in_final_boss() && 
                    prev(!eur_boss_kill()) &&
                    trigger_when(eur_boss_kill()) &&
                    unless(repeated(150, europe_in_final_boss() && 
                    prev(!eur_laser()) && eur_laser())))
                    )
)

achievement(
    title = "Hands At Ten and Two and Finally... Floor It!",
    description = "Clear Hypnotic Highway as any character while taking the fastest route possible",
    id = 445587, 
    badge = "535270",
    points = 10,
    trigger = 
            hypnotic_highway() && 
            never((usa() && 
            usa_screen() == 131)) &&
            never((europe() && 
            eur_screen() == 131)) &&
                (
                    (usa() && 
                    sponge_racer() && 
                    prev(usa_screen()) == 38 &&
                    trigger_when(usa_screen() == 120) && 
                    unless(once(time_left() == 328))) ||
                    (usa() && 
                    pat_racer() && 
                    prev(usa_screen()) == 37 &&
                    trigger_when(usa_screen() == 118) && 
                    unless(once(time_left() == 628))) ||
                    (usa() && 
                    plank_racer() && 
                    prev(usa_screen()) == 39 &&
                    trigger_when(usa_screen() == 119) && 
                    unless(once(time_left() == 208)))
                    
                    (europe() && 
                    sponge_racer() && 
                    prev(eur_screen()) == 38 &&
                    trigger_when(eur_screen() == 120) && 
                    unless(once(time_left() == 328))) ||
                    (europe() && 
                    pat_racer() && 
                    prev(eur_screen()) == 37 &&
                    trigger_when(eur_screen() == 118) && 
                    unless(once(time_left() == 628))) ||
                    (europe() && 
                    plank_racer() && 
                    prev(eur_screen()) == 39 &&
                    trigger_when(eur_screen() == 119) && 
                    unless(once(time_left() == 208))) ||
               )
)

achievement(
    title = "F.U.N.", 
    description = "Win the Trampoline minigame",
    id = 445575, 
    badge = "535271",
    points = 4,
    trigger = 
            trampoline() && 
            prev(minigame_data_2()) == 0 && 
            minigame_data_2() == 1
)

achievement(
    title = "All That Glitters", 
    description = "Reach Round 6 of the Spatula Toss minigame",
    id = 445576, 
    badge = "535272",
    points = 4,
    trigger = 
            target() && 
            prev(minigame_data_2()) == 5 && 
            minigame_data_2() == 6
)

achievement(
    title = "Rock Bottom", 
    description = "Score 50 points or more in the Pit minigame",
    id = 445577, 
    badge = "535273",
    points = 5,
    trigger = 
            pit() && 
            prev(pit_score()) == 49 && 
            pit_score() == 50
)

achievement(
    title = "The Krusty Plate",
    description = "Reach Round 6 in the Plate Spinning minigame",
    id = 445578, 
    badge = "535274",
    points = 4,
    trigger = 
            plates() && 
            prev(minigame_data_1()) == 5 && 
            minigame_data_1() == 6
)

achievement(
    title = "Jellyfishing",
    description = "Reach Round 6 of the Jellyfishing minigame",
    id = 445579, 
    badge = "535275",
    points = 4,
    trigger = 
            jellyfish() && 
            prev(minigame_data_2()) == 5 && 
            minigame_data_2() == 6
)

achievement(
    title = "Sandy, SpongeBob, and the Worm",
    description = "Reach Round 6 of the Worm minigame",
    id = 445580, 
    badge = "535276",
    points = 4,
    trigger = 
            worm() && 
            prev(minigame_data_1()) == 5 && 
            minigame_data_1() == 6
)

achievement(
    title = "The Sponge Who Could Fly",
    description = "Score 100 points or more in the Float minigame",
    id = 445581, 
    badge = "535277",
    points = 5,
    trigger = 
            float() && 
            prev(minigame_data_2()) == 0 && 
            minigame_data_2() == 1
)

achievement(
    title = "The Fry Cook Games", 
    description = "Win the Hurdle minigame",
    id = 445582, 
    badge = "535278",
    points = 3,
    trigger = 
            hurdles() && 
            prev(minigame_data_2()) == 0 && 
            minigame_data_2() == 2
)

leaderboard(
    title = "High Score - The Pit",
    description = "Get the highest score in The Pit minigame!",
    id = 106812,
    start  = 
            (
                (usa() && 
                usa_in_stage() && 
                pit()) ||
                
                (europe() && 
                europe_in_stage() && 
                pit())
                ),
    cancel = 
            (
                (usa() && 
                usa_screen() == 40) ||
                
                (europe() && 
                eur_screen() == 40)
                ),
    submit = 
            (
                (usa() && 
                game_over()) ||
                (europe() && 
                game_over())),
    value  = 
            measured(pit_score()),
    format = "VALUE"
)

leaderboard(
    title = "High Score - Float",
    description = "Get the highest score in the Float minigame!",
    id = 106813,
    start  = 
            (
                (usa() && 
                usa_in_stage() && 
                float()) ||
                
                (europe() && 
                europe_in_stage() && 
                float())
                ),
    cancel = 
            (
                (usa() && 
                usa_screen() == 40) ||
                
                (europe() &&
                eur_screen() == 40)
                ),
    submit = 
            game_over(),
    value  = 
            measured(float_score()),
    format = "VALUE"
)

leaderboard(
    title = "Train Stopper",
    description = "Clear part 3 of Starfish-Man to the rescue in the fastest time!",
    id = 114885, 
    start  = 
            starfishman_rescue_3() &&
                (
                    (usa() && 
                    usa_screen() == 10 && 
                    usa_in_stage() && 
                    usa_on_train()) ||
                
                    (europe() && 
                    eur_screen() == 10 && 
                    europe_in_stage() && 
                    eur_on_train())
                    ),
    cancel = 
            (
                (usa() && 
                (!starfishman_rescue_3() || 
                usa_screen() == 59 || 
                usa_screen() == 43)) ||
                
                (europe() && 
                (!starfishman_rescue_3() || 
                eur_screen() == 59 || 
                eur_screen() == 43))
                ),
    submit = 
            (
                (usa() && 
                usa_scene == 12) ||
                
                (europe() && 
                eur_scene() == 12)
                ),
    value  = 
            max_of(
                 measured(tally(0, usa_in_stage())) && 
                 unless(usa_pause()) &&
                 never((usa_in_stage() && 
                 respawn())),
                 
                 measured(tally(0, europe_in_stage())) && 
                 unless(eur_pause()) &&
                 never((europe_in_stage() && 
                 respawn()))
             ),
    format = "FRAMES", 
    lower_is_better = true
)

leaderboard(
    title = "Bull Worm Gastroenterologist",
    description = "Clear part 2 of Alaskan Belly Trouble in the fastest time!",
    id = 114886, 
    start  = 
            alaskan_belly_2() && 
            stage_position_y() == 767 &&
                (
                    (usa() && 
                    usa_in_stage() && 
                    usa_screen() == 17) ||
                    
                    (europe() && 
                    europe_in_stage() && 
                    eur_screen() == 17)
                    ),
    cancel = 
            (
                (usa() && 
                (!alaskan_belly_2() || 
                usa_screen() == 59 || 
                usa_screen() == 43)) ||
                (europe() && 
                (!alaskan_belly_2() || 
                eur_screen() == 59 || 
                eur_screen() == 43))
                ),
    submit = 
            stage_position_x() == 5344,
    value  = 
            max_of(
                 measured(tally(0, usa_in_stage())) && 
                 unless(usa_pause()) &&
                 never((usa_in_stage() && 
                 respawn())),
                 
                 measured(tally(0, europe_in_stage())) && 
                 unless(eur_pause()) &&
                 never((europe_in_stage() && 
                 respawn()))
             ),
    format = "FRAMES", 
    lower_is_better = true
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
    startup(), "🫧 Diving into Bikini Bottom 🫧")

rich_presence_conditional_display(usa() && usa_screen() == 59, "At the Title Screen")

rich_presence_conditional_display(europe() && eur_screen() == 59, "At the Title Screen")

rich_presence_conditional_display(usa() && usa_screen() == 57, "🎞️ At the Bikini Bottom Theatre")

rich_presence_conditional_display(europe() && eur_screen() == 57, "🎞️ At the Bikini Bottom Theatre")

rich_presence_conditional_display(usa() && usa_screen() == 58, "🔧 Exploring different options")

rich_presence_conditional_display(europe() && eur_screen() == 58, "🔧 Exploring different options")

rich_presence_conditional_display(usa() && usa_screen() == 40, "🕹️ At the Arcade")

rich_presence_conditional_display(europe() && eur_screen() == 40, "🕹️ At the Arcade")

rich_presence_conditional_display(usa() && usa_screen() == 41, "Taking a seat")

rich_presence_conditional_display(europe() && eur_screen() == 41, "Taking a seat")

rich_presence_conditional_display(usa() && usa_screen() == 42, "📽️ Watching the Credits Roll")

rich_presence_conditional_display(europe() && eur_screen() == 42, "📽️ Watching the Credits Roll")

rich_presence_conditional_display(arcade_in_minigame(), "🕹️ At the Arcade playing the {0} minigame",
    rich_presence_lookup("Minigame", stage_rpc(), MinigameLookup)
)

rich_presence_conditional_display(usa() && sponge_racer() && hypnotic_highway(), "💤 SpongeBob is in {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(usa() && pat_racer() && hypnotic_highway(), "💤 Patrick is in {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(usa() && plank_racer() && hypnotic_highway(), "💤 Plankton is in {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(europe() && sponge_racer() && hypnotic_highway(), "💤 SpongeBob is in {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(europe() && pat_racer() && hypnotic_highway(), "💤 Patrick is in {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(europe() && plank_racer() && hypnotic_highway(), "💤 Plankton is in {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(usa(), "💤 {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_conditional_display(europe(), "💤 {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)

rich_presence_display("💤 {0}...",
    rich_presence_lookup("Stage", stage_rpc(), StageLookup)
)
