// PK: Out of the Shadows | Donald Duck PK
// #ID = 20750
// RA Hash: 873907017178e976e7d7470210d67497 [NTSC-U]
//          186415f7721aff0ebef19421b8038665 [PAL]

// Code Notes
// 0x100000-0x02003fff [Game RAM]
// Code notes refer to PAL version primarily. NTSC-U offset is generally +0x628C (or 25228 in decimal) unless otherwise noted
function ntsc_offset() => 25228

// 0x35FA64: [Bitflag] Player Input
//           +480: NTSC-U

// 0x36094C: [PAL] [ASCII | 14-bytes] [32-bit BE] CD Serial
//           SLES_507.73;1
function pal() => ascii_string_equals(0x36094C, "SLES_507.73;1")

// 0x360DCC: [NTSC-U] [ASCII | 14-bytes] [32-bit BE] CD Serial
//           SLUS_204.78;1
function ntsc() => ascii_string_equals(0x360DCC, "SLUS_204.78;1")

// 0x7A5FDB: [Bitflag] Alternate Level Clear Flag
function Levelclear_pal_alt() => prev(bit0(0x7A5FDB) == 0) && bit0(0x7A5FDB) == 1

// 0x7A602B: [Bitflag] Level Clear Flag
//           +0x4000: NTSC-U
function LevelClear_pal() => prev(bit0(0x7A602B) == 0) && bit0(0x7A602B) == 1
function LevelClear_ntsc() => prev(bit0(0x7A602B +16384) == 0) && bit0(0x7A602B +16384) == 1


// 0x7BD75D: [NTSC-U] [Bitflag] Level Clear Flag
//           Used in Mothership level
function MothershipClear_NTSC() => prev(bit0(0x7BD75D) == 0) && bit0(0x7BD75D) == 1

// 0xCCDA3D: [8-bit] Player Health
//           Bit 6: Supercharge available
//           +0x6340: NTSC-U
function DamageCheck() => byte(0xCCDA3D) < prev(byte(0xCCDA3D))
function DamageCheck_NTSC() => byte(0xCCDA3D +25408) < prev(byte(0xCCDA3D +25408))
function Death() => byte(0xCCDA3D) == 0
function Death_NTSC() => byte(0xCCDA3D +25408) == 0

// 0xCFCB00: [Bitflag] Last checkpoint activated
//           Changes depending on which checkpoint in the level was activated. 
//           Earlier bits reflect earlier checkpoints. Is always either 2 or 4 bits active at the same time. 
//           Starting checkpoints can begin with either Bits 0 & 2, or Bits 1 & 3.
function Checkpoint() => byte(0xCFCB00)
function Checkpoint_NTSC() => byte(0xCFCB00 +ntsc_offset())

function CheckpointCheck() => prev(byte(0xCFCB00)) == 0 && byte(0xCFCB00) > 0
function CheckpointCheck_NTSC() => prev(byte(0xCFCB00 +ntsc_offset())) == 0 && byte(0xCFCB00 +ntsc_offset()) > 0

function ResetIfCheckpoint() => never(byte(0xCFCB00) != 0)
function ResetIfCheckpoint_NTSC() => never(byte(0xCFCB00 +ntsc_offset()) != 0)

// 0xCFCB04: [32-bit] Current Activation Star Count
//           Displays the amount of Activation Stars a player has. When activating a checkpoint, data resets to 0 and excess is deposited the next address over.
function ActivationStarCount() => dword(0xCFCB04)
function ActivationStarCount_NTSC() => dword(0xCFCB04 +ntsc_offset())
		
// 0xCFCB08: [32-bit] Activation Star "leftovers"
//           When a teleport panel is activated, any excess Stars are "deposited" here. Data does not accumulate, rather, it is always where excess goes. 
//           For example if a player has excess of 1 on first checkpoint, data is 1. If a player has 1 excess again at second checkpoint, data is still 1. 
//           When added to original Activation Star Count address, it reflects the current available Stars the player has.

// 0xCFCB8C: [Bitflag Array | 6 Bytes] Player Data Saved to Memory Card
//           Last saved player data written to memory card. For whatever reason, the final boss data is used here, exclusively.

//           +0x4
//           Bit 2: Zondag Fight Intro
//           Bit 3: Zondag Defeated
function ZondagDefeat() => prev(bit3(0xCFCB8C +4) == 0) && bit3(0xCFCB8C +4) == 1
function ZondagDefeat_NTSC() => prev(bit3(0xCFCB8C +ntsc_offset() +4) == 0) && bit3(0xCFCB8C +ntsc_offset() +4) == 1

// 0xCFCBC4: [Bitflag Array | 8 bytes] Scientists Saved
//           Temporary storage of data pre-save to memory card
// 0xCFCBC4:
//          Bit 0-5: Observatory Scientists
//          Bit 6-7: Science Lab Scientists
// 0xCFCBC5:
//          Bit 0-3: Science Lab Scientists
//          Bit 4-7: Machinery Scientists
// 0xCFCBC6:
//          Bit 0-1: Machinery Scientists
//          Bit 2-7: Frozen Mine Scientists
// 0xCFCBC7:
//          Bit 0-5: Canyon Scientists
//          Bit 6-7: Area 52 Scientists
// 0xCFCBC8:
//          Bit 0-3: Area 52 Scientists
//          Bit 4-7: Underground Scientists
// 0xCFCBC9:
//          Bit 0-1: Underground Scientists
//          Bit 2-7: Sewers Scientists
// 0xCFCBCA:
//          Bit 0-5: Channel 00 Scientists
//          Bit 6-7: Backstage Scientists
// 0xCFCBCB:
//          Bit 0-3: Backstage Scientists
function TotalScientistsRescued()
{
    count = 0
    for address in range(0xCFCBC4,0xCFCBCA) {
        count = count + bitcount(address)
    }
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBCB))
    return count
}

function TotalScientistsRescued_NTSC()
{
    count = 0
    for address in range(0xCFCBC4 +ntsc_offset(),0xCFCBCA +ntsc_offset()) {
        count = count + bitcount(address)
    }
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBCB +ntsc_offset()))
    return count
}

function ObservatoryScientists()
{
    count = 0
    count = count + sum_of(range(0,5), b => bit(b,0xCFCBC4))
    return count
}

function ObservatoryScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(0,5), b => bit(b,0xCFCBC4 +ntsc_offset()))
    return count
}

function ScienceLabScientists()
{
    count = 0
    count = count + sum_of(range(6,7), b => bit(b,0xCFCBC4))
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBC5))
    return count
}

function ScienceLabScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(6,7), b => bit(b,0xCFCBC4 +ntsc_offset()))
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBC5 +ntsc_offset()))
    return count
}

function MachineryScientists()
{
    count = 0
    count = count + sum_of(range(4,7), b => bit(b,0xCFCBC5))
    count = count + sum_of(range(0,1), b => bit(b,0xCFCBC6))
    return count
}

function MachineryScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(4,7), b => bit(b,0xCFCBC5 +ntsc_offset()))
    count = count + sum_of(range(0,1), b => bit(b,0xCFCBC6 +ntsc_offset()))
    return count
}

function FrozenMineScientists()
{
    count = 0
    count = count + sum_of(range(2,7), b => bit(b,0xCFCBC6))
    return count
}

function FrozenMineScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(2,7), b => bit(b,0xCFCBC6 +ntsc_offset()))
    return count
}

function CanyonScientists()
{
    count = 0
    count = count + sum_of(range(0,5), b => bit(b,0xCFCBC7))
    return count
}

function CanyonScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(0,5), b => bit(b,0xCFCBC7 +ntsc_offset()))
    return count
}

function Area52Scientists()
{
    count = 0
    count = count + sum_of(range(6,7), b => bit(b,0xCFCBC7))
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBC8))
    return count
}

function Area52Scientists_NTSC()
{
    count = 0
    count = count + sum_of(range(6,7), b => bit(b,0xCFCBC7 +ntsc_offset()))
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBC8 +ntsc_offset()))
    return count
}

function UndergroundScientists()
{
    count = 0
    count = count + sum_of(range(4,7), b => bit(b,0xCFCBC8))
    count = count + sum_of(range(0,1), b => bit(b,0xCFCBC9))
    return count
}

function UndergroundScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(4,7), b => bit(b,0xCFCBC8 +ntsc_offset()))
    count = count + sum_of(range(0,1), b => bit(b,0xCFCBC9 +ntsc_offset()))
    return count
}

function SewersScientists()
{
    count = 0
    count = count + sum_of(range(2,7), b => bit(b,0xCFCBC9))
    return count
}

function SewersScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(2,7), b => bit(b,0xCFCBC9 +ntsc_offset()))
    return count
}

function Channel00Scientists()
{
    count = 0
    count = count + sum_of(range(0,5), b => bit(b,0xCFCBCA))
    return count
}

function Channel00Scientists_NTSC()
{
    count = 0
    count = count + sum_of(range(0,5), b => bit(b,0xCFCBCA +ntsc_offset()))
    return count
}

function BackstageScientists()
{
    count = 0
    count = count + sum_of(range(6,7), b => bit(b,0xCFCBCA))
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBCB))
    return count
}

function BackstageScientists_NTSC()
{
    count = 0
    count = count + sum_of(range(6,7), b => bit(b,0xCFCBCA +ntsc_offset()))
    count = count + sum_of(range(0,3), b => bit(b,0xCFCBCB +ntsc_offset()))
    return count
}

// 0xCFCBCC: [Bitflag Array | 6 Bytes] Player Data Active
//           Temporary storage of data pre-save to memory card

//           Bit 5: Successfully progressed with Propulsor
//           Bit 6: Successfully smashed glass for the first time

//           +0x1
//           Bit 4: Propulsor Acquired
//           Bit 5: Iron Fist Acquired
//           Bit 6: Supercharge Acquired
//           Bit 7: REX Acquired

//           +0x2
//           Bit 0: Swingport Ability Unlocked
//           Bit 1: Evronian Outfit Acquired
//           Bit 2: Evronian Soldier Encounter
//           Bit 3: Targeting Tutorial
//           Bit 4: Coolflames Encounter
//           Bit 5: Scientists Tutorial

//           +0x3
//           Bit 2: Evronian Surfers Encounter
//           Bit 3: What is PK Cutscene
//           Bit 4: No Coffee Break Cutscene
//           Bit 5: About Zoster Cuscene
//           Bit 6: Zoster Intro Cutscene
//           Bit 7: Zoster Defeated Cutscene

//           +0x4
//           Bit 7: Activation Star Tutorial

//           +0x5
//           Bit 3: Reinforcement #1 Acquired
//           Bit 4: Reinforcement #2 Acquired
function ZosterDefeat() => prev(bit7(0xCFCBCC +3) == 0) && bit7(0xCFCBCC +3) == 1
function ZosterDefeat_NTSC() => prev(bit7(0xCFCBCC +ntsc_offset() +3) == 0) && bit7(0xCFCBCC +ntsc_offset() +3) == 1

function EvronianOutfitGet() => prev(bit1(0xCFCBCC +2)) == 0 && bit1(0xCFCBCC +2) == 1
function EvronianOutfitGet_NTSC() => prev(bit1(0xCFCBCC +ntsc_offset() +2)) == 0 && bit1(0xCFCBCC +ntsc_offset() +2) == 1

function PKCheck() => bit1(0xCFCBCC +2) == 0
function PKCheck_NTSC() => bit1(0xCFCBCC +ntsc_offset() +2) == 0

function HiddenReinforcementsGet()
{
    count = 0
    count = count + sum_of(range(3,4), b => bit(b,0xCFCBCC +5))
    return count
}

function HiddenReinforcementsGet_NTSC()
{
    count = 0
    count = count + sum_of(range(3,4), b => bit(b,0xCFCBCC +ntsc_offset() +5))
    return count
}

// 0xCFCBFC: [32-bit] Scientists Saved In-Level
//           Counts amount of scientists saved in the current level loaded.

// 0xCFCC58: [8-bit] X-Transformer Upgrade Count
//           Increments per 1 every time an upgrade is acquired
function UpgradeCount() => byte(0xCFCC58)
function UpgradeCount_NTSC() => byte(0xCFCC58 +ntsc_offset())
		
// 0xCFD044: [32-bit] Level Indicator
function CurrentLevel() => dword(0xCFD044)
function CurrentLevel_NTSC() => dword(0xCFD044 +ntsc_offset())

function LB_InObservatory() => once(prev(dword(0xCFD044)) != 1 && dword(0xCFD044) == 1)
function LB_InObservatory_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 1 && dword(0xCFD044 +ntsc_offset()) == 1)
function LB_InScienceLab() => once(prev(dword(0xCFD044)) != 2 && dword(0xCFD044) == 2)
function LB_InScienceLab_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 2 && dword(0xCFD044 +ntsc_offset()) == 2)
function LB_InMachinery() => once(prev(dword(0xCFD044)) != 3 && dword(0xCFD044) == 3)
function LB_InMachinery_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 3 && dword(0xCFD044 +ntsc_offset()) == 3)
function LB_InFrozenMine() => once(prev(dword(0xCFD044)) != 4 && dword(0xCFD044) == 4)
function LB_InFrozenMine_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 4 && dword(0xCFD044 +ntsc_offset()) == 4)
function LB_InCanyon() => once(prev(dword(0xCFD044)) != 5 && dword(0xCFD044) == 5)
function LB_InCanyon_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 5 && dword(0xCFD044 +ntsc_offset()) == 5)
function LB_InArea52() => once(prev(dword(0xCFD044)) != 6 && dword(0xCFD044) == 6)
function LB_InArea52_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 6 && dword(0xCFD044 +ntsc_offset()) == 6)
function LB_InUnderground() => once(prev(dword(0xCFD044)) != 7 && dword(0xCFD044) == 7)
function LB_InUnderground_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 7 && dword(0xCFD044 +ntsc_offset()) == 7)
function LB_InSewers() => once(prev(dword(0xCFD044)) != 9 && dword(0xCFD044) == 9)
function LB_InSewers_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 9 && dword(0xCFD044 +ntsc_offset()) == 9)
function LB_InChannel00() => once(prev(dword(0xCFD044)) != 10 && dword(0xCFD044) == 10)
function LB_InChannel00_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 10 && dword(0xCFD044 +ntsc_offset()) == 10)
function LB_InBackstage() => once(prev(dword(0xCFD044)) != 11 && dword(0xCFD044) == 11)
function LB_InBackstage_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 11 && dword(0xCFD044 +ntsc_offset()) == 11)
function LB_InMothership() => once(prev(dword(0xCFD044)) != 12 && dword(0xCFD044) == 12)
function LB_InMothership_NTSC() => once(prev(dword(0xCFD044 +ntsc_offset())) != 12 && dword(0xCFD044 +ntsc_offset()) == 12)
		
// 0xCFD6DD: [Bitflag] Pause Indicator

// 0x11AB488: [8-bit] Menu Selection
//            From Final Boss. Changes per level; no pointer found
//            +5460: NTSC-U 21600
function BossReset() => byte(0x11AB488) == 13 && prev(bit6(0x35FA64)) == 0 && bit6(0x35FA64) == 1
function BossReset_NTSC() => byte(0x11AB488 +21600) == 13 && prev(bit6(0x35FA64 +1152)) == 0 && bit6(0x35FA64 +1152) == 1

achievement(
    title = "Evronians", points = 2, type="progression",
    description = "Clear Observatory",
    trigger =
            (
                pal() && 
                CurrentLevel() == 1 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 1 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Portrait of the Hero as a Young Duck", points = 2, type="progression",
    description = "Clear Science Lab",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 2 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 2 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Silicon", points = 2, type="progression",
    description = "Clear Machinery",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 3 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 3 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Day of the Cold Sun", points = 3, type="progression",
    description = "Clear Frozen Mine",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 4 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 4 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Carpe Diem", points = 3, type="progression",
    description = "Clear Canyon",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 5 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 5 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Crossfire", points = 4, type="progression",
    description = "Clear Area 52",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 6 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 6 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Underground", points = 4, type="progression",
    description = "Clear Underground",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 7 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 7 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Phase Two", points = 10, type="progression",
    description = "Defeat Zoster",
    trigger = 
            (
                pal() &&
                CurrentLevel() == 8 &&
                ZosterDefeat() ||
                ntsc() &&
                CurrentLevel_NTSC() == 8 &&
                ZosterDefeat_NTSC()
            )
)

achievement(
    title = "Invasion!", points = 5, type="progression",
    description = "Clear Sewers",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 9 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 9 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Camera, Action!", points = 5, type="progression",
    description = "Clear Channel 00",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 10 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 10 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Shooting Star", points = 5, type="progression",
    description = "Clear Backstage",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 11 &&
                LevelClear_pal() ||
                ntsc() &&
                CurrentLevel_NTSC() == 11 &&
                LevelClear_ntsc()
            )
)

achievement(
    title = "Stowaway on Board", points = 5, type="progression",
    description = "Clear Mothership",
    trigger = 
            (
                pal() && 
                CurrentLevel() == 12 &&
                Levelclear_pal_alt() ||
                ntsc() &&
                CurrentLevel_NTSC() == 12 &&
                MothershipClear_NTSC()
            )
)

achievement(
    title = "Nothing Personal", points = 10, type="win_condition",
    description = "Defeat Zondag",
    trigger = 
            (
                pal() &&
                CurrentLevel() == 13 &&
                ZondagDefeat() ||
                ntsc() &&
                CurrentLevel_NTSC() == 13 &&
                ZondagDefeat_NTSC()
            )
)

achievement(
    title = "Propelled Duck", points = 1,
    description = "Acquire the X-Transformer's Propulsor",
    trigger = 
            (
                pal() &&
                prev(UpgradeCount()) == 0 &&
                UpgradeCount() == 1 ||
                ntsc() &&
                prev(UpgradeCount_NTSC()) == 0 &&
                UpgradeCount_NTSC() == 1
            )
)

achievement(
    title = "Steel Duck", points = 1,
    description = "Acquire the Iron Fist",
    trigger = 
            (
                pal() &&
                prev(UpgradeCount()) == 1 &&
                UpgradeCount() == 2 ||
                ntsc() &&
                prev(UpgradeCount_NTSC()) == 1 &&
                UpgradeCount_NTSC() == 2
            )
)

achievement(
    title = "Super Duck", points = 2,
    description = "Acquire the X-Transformer supercharge upgrade",
    trigger = 
            (
                pal() &&
                prev(UpgradeCount()) == 2 &&
                UpgradeCount() == 3 ||
                ntsc() &&
                prev(UpgradeCount_NTSC()) == 2 &&
                UpgradeCount_NTSC() == 3
            )
)

achievement(
    title = "Remote X-Transformer", points = 2,
    description = "Acquire REX",
    trigger = 
            (
                pal() &&
                prev(UpgradeCount()) == 3 &&
                UpgradeCount() == 4 ||
                ntsc() &&
                prev(UpgradeCount_NTSC()) == 3 &&
                UpgradeCount_NTSC() == 4
            )
)


achievement(
    title = "Swinging Menace", points = 3,
    description = "Acquire the ability to use Swingports with your X-Transformer",
    trigger = 
            (
                pal() &&
                prev(UpgradeCount()) == 4 &&
                UpgradeCount() == 5 ||
                ntsc() &&
                prev(UpgradeCount_NTSC()) == 4 &&
                UpgradeCount_NTSC() == 5
            )
)

achievement(
    title = "It's Easy to Be an Evronian!", points = 4,
    description = "Acquire the Stolen Outfit",
    trigger = 
            (
                pal() &&
                EvronianOutfitGet() ||
                ntsc() &&
                EvronianOutfitGet_NTSC()
            )
)

achievement(
    title = "Duckburg's Savior", points = 5, type="progression",
    description = "Rescue 40 Scientists and get access to the final level of the game",
    trigger = 
            (
                (pal() &&
                prev(TotalScientistsRescued()) == 39 &&
                measured(TotalScientistsRescued() == 40)) ||
                (ntsc() &&
                prev(TotalScientistsRescued_NTSC()) == 39 &&
                measured(TotalScientistsRescued_NTSC() == 40))
            )
)

achievement(
    title = "The Masked Avenger of the Night", points = 10,
    description = "Rescue all 60 Scientists",
    trigger = (
                (pal() &&
                prev(TotalScientistsRescued()) == 59 &&
                measured(TotalScientistsRescued() == 60)) ||
                (ntsc() &&
                prev(TotalScientistsRescued_NTSC()) == 59 &&
                measured(TotalScientistsRescued_NTSC() == 60))
            )
)


achievement(
    title = "Platyrhynchos Kineticus Pleres", points = 2,
    description = "Acquire both hidden X-Transformer Reinforcements",
    trigger = 
            (
                (pal() &&
                prev(HiddenReinforcementsGet()) == 1 &&
                measured(HiddenReinforcementsGet() == 2)) ||
                (ntsc() &&
                prev(HiddenReinforcementsGet_NTSC()) == 1 &&
                measured(HiddenReinforcementsGet_NTSC() == 2))
            )
)


achievement(
    title = "All Scientists: Observatory", points = 5,
    description = "Rescue all Scientists in Observatory",
    trigger =
            (
                (pal() &&
                prev(ObservatoryScientists()) == 5 &&
                measured(ObservatoryScientists() == 6)) ||
                (ntsc() &&
                prev(ObservatoryScientists_NTSC()) == 5 &&
                measured(ObservatoryScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Science Lab", points = 5,
    description = "Rescue all Scientists in Science Lab",
    trigger =
            (
                (pal() &&
                prev(ScienceLabScientists()) == 5 &&
                measured(ScienceLabScientists() == 6)) ||
                (ntsc() &&
                prev(ScienceLabScientists_NTSC()) == 5 &&
                measured(ScienceLabScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Machinery", points = 5,
    description = "Rescue all Scientists in Machinery",
    trigger =
            (
                (pal() &&
                prev(MachineryScientists()) == 5 &&
                measured(MachineryScientists() == 6)) ||
                (ntsc() &&
                prev(MachineryScientists_NTSC()) == 5 &&
                measured(MachineryScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Frozen Mine", points = 5,
    description = "Rescue all Scientists in Frozen Mine",
    trigger =
            (
                (pal() &&
                prev(FrozenMineScientists()) == 5 &&
                measured(FrozenMineScientists() == 6)) ||
                (ntsc() &&
                prev(FrozenMineScientists_NTSC()) == 5 &&
                measured(FrozenMineScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Canyon", points = 5,
    description = "Rescue all Scientists in Canyon",
    trigger =
            (
                (pal() &&
                prev(CanyonScientists()) == 5 &&
                measured(CanyonScientists() == 6)) ||
                (ntsc() &&
                prev(CanyonScientists_NTSC()) == 5 &&
                measured(CanyonScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Area 52", points = 5,
    description = "Rescue all Scientists in Area 52",
    trigger =
            (
                (pal() &&
                prev(Area52Scientists()) == 5 &&
                measured(Area52Scientists() == 6)) ||
                (ntsc() &&
                prev(Area52Scientists_NTSC()) == 5 &&
                measured(Area52Scientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Underground", points = 5,
    description = "Rescue all Scientists in Underground",
    trigger =
            (
                (pal() &&
                prev(UndergroundScientists()) == 5 &&
                measured(UndergroundScientists() == 6)) ||
                (ntsc() &&
                prev(UndergroundScientists_NTSC()) == 5 &&
                measured(UndergroundScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Sewers", points = 5,
    description = "Rescue all Scientists in Sewers",
    trigger =
            (
                (pal() &&
                prev(SewersScientists()) == 5 &&
                measured(SewersScientists() == 6)) ||
                (ntsc() &&
                prev(SewersScientists_NTSC()) == 5 &&
                measured(SewersScientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Channel 00", points = 5,
    description = "Rescue all Scientists in Channel 00",
    trigger =
            (
                (pal() &&
                prev(Channel00Scientists()) == 5 &&
                measured(Channel00Scientists() == 6)) ||
                (ntsc() &&
                prev(Channel00Scientists_NTSC()) == 5 &&
                measured(Channel00Scientists_NTSC() == 6))
            )
)

achievement(
    title = "All Scientists: Backstage", points = 5,
    description = "Rescue all Scientists in Backstage",
    trigger =
            (
                (pal() &&
                prev(BackstageScientists()) == 5 &&
                measured(BackstageScientists() == 6)) ||
                (ntsc() &&
                prev(BackstageScientists_NTSC()) == 5 &&
                measured(BackstageScientists_NTSC() == 6))
            )
)

achievement(
    title = "The Diabolical Duck Avenger", points = 25,
    description = "Defeat Zondag without taking damage",
    trigger =
            never((pal() &&                             // Core with conditional reset for exiting the level
            CurrentLevel() != 13)) &&
            never((ntsc() && 
            CurrentLevel_NTSC() != 13)) &&
            (                                           // Alts
                pal() &&                                // Conditional reset for manually restarting boss from level select
                CurrentLevel() == 13 &&
                disable_when(DamageCheck(), until=BossReset()) && 
                trigger_when(ZondagDefeat()) ||
                pal() &&                                // Conditional reset for death during boss
                CurrentLevel() == 13 &&
                disable_when(DamageCheck(), until=Death()) &&
                trigger_when(ZondagDefeat()) || 
                ntsc() &&
                CurrentLevel_NTSC() == 13 &&
                disable_when(DamageCheck_NTSC(), until=BossReset_NTSC()) &&
                trigger_when(ZondagDefeat_NTSC()) ||
                ntsc() &&
                CurrentLevel_NTSC() == 13 &&
                disable_when(DamageCheck_NTSC(), until=Death_NTSC()) &&
                trigger_when(ZondagDefeat_NTSC())
            )
)

achievement(
    title = "All I Need Is My Trusty X-Transformer!", points = 5, type="missable",
    description = "Clear Canyon without activating any Teleportation Stations and before unlocking the Stolen Outfit upgrade (Exit level to retry)",
    trigger =
            never((pal() &&                             
            CurrentLevel() != 5)) &&
            never((ntsc() && 
            CurrentLevel_NTSC() != 5)) &&
            (                                           
                pal() &&                                
                CurrentLevel() == 5 &&
                PKCheck() &&
                disable_when(CheckpointCheck()) && 
                trigger_when(LevelClear_pal()) ||
                ntsc() &&
                CurrentLevel_NTSC() == 5 &&
                PKCheck_NTSC() &&
                disable_when(CheckpointCheck_NTSC()) &&
                trigger_when(LevelClear_ntsc())
            )
)

achievement(
    title = "More Tense than an Episode of Anxieties", points = 10, type="missable",
    description = "Clear Channel 00 without activating any Teleportation Stations and before unlocking the Stolen Outfit upgrade (Exit level to retry)",
    trigger =
            never((pal() &&                             
            CurrentLevel() != 10)) &&
            never((ntsc() && 
            CurrentLevel_NTSC() != 10)) &&
            (                                           
                pal() &&                                
                CurrentLevel() == 10 &&
                PKCheck() &&
                disable_when(CheckpointCheck()) && 
                trigger_when(LevelClear_pal()) ||
                ntsc() &&
                CurrentLevel_NTSC() == 10 &&
                PKCheck_NTSC() &&
                disable_when(CheckpointCheck_NTSC()) &&
                trigger_when(LevelClear_ntsc())
            )
)

leaderboard(
    title = "Broke Duck - Observatory",
    description = "Collect the fewest number of Activation Stars in Observatory without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 1)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 1)) &&
            (((pal() && 
            LB_InObservatory()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InObservatory_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Science Lab",
    description = "Collect the fewest number of Activation Stars in Science Lab without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 2)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 2)) &&
            (((pal() && 
            LB_InScienceLab()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InScienceLab_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Machinery",
    description = "Collect the fewest number of Activation Stars in Machinery without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 3)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 3)) &&
            (((pal() && 
            LB_InMachinery()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InMachinery_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Frozen Mine",
    description = "Collect the fewest number of Activation Stars in Frozen Mine without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 4)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 4)) &&
            (((pal() && 
            LB_InFrozenMine()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InFrozenMine_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Canyon",
    description = "Collect the fewest number of Activation Stars in Canyon without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 5)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 5)) &&
            (((pal() && 
            LB_InCanyon()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InCanyon_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Area 52",
    description = "Collect the fewest number of Activation Stars in Area 52 without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 6)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 6)) &&
            (((pal() && 
            LB_InArea52()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InArea52_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Underground",
    description = "Collect the fewest number of Activation Stars in Underground without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 7)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 7)) &&
            (((pal() && 
            LB_InUnderground()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InUnderground_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Sewers",
    description = "Collect the fewest number of Activation Stars in Sewers without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 9)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 9)) &&
            (((pal() && 
            LB_InSewers()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InSewers_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Channel 00",
    description = "Collect the fewest number of Activation Stars in Channel 00 without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 10)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 10)) &&
            (((pal() && 
            LB_InChannel00()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InChannel00_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Backstage",
    description = "Collect the fewest number of Activation Stars in Backstage without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 11)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 11)) &&
            (((pal() && 
            LB_InBackstage()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InBackstage_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    title = "Broke Duck - Mothership",
    description = "Collect the fewest number of Activation Stars in Mothership without activating any Teleportation Stations (Exit level to retry)",
    start  = 
            never((pal() && Checkpoint() != 0)) &&
            never((pal() && CurrentLevel() != 12)) &&
            never((ntsc() && Checkpoint_NTSC() != 0)) &&
            never((ntsc() && CurrentLevel_NTSC() != 12)) &&
            (((pal() && 
            LB_InMothership()) &&
            LevelClear_pal()) ||
            ((ntsc() && 
            LB_InMothership_NTSC()) &&
            LevelClear_ntsc())),
    cancel = 
            always_false(),
    submit = 
            always_true(),
    value  = 
            max_of(
                 measured(ActivationStarCount(),
                     when=(pal())
                     ),
                 measured(ActivationStarCount_NTSC(),
                     when=(ntsc())
                    )
             ),
    format = "VALUE", lower_is_better = true
)


// Rich Presence
Format:Scientists
FormatType=VALUE

Format:ActivationStars
FormatType=VALUE

Lookup:Level
    0=suiting up in the Ducklair Tower...
    1=fighting Evronians in the Observatory
    2=fighting Evronians in the Science Lab
    3=fighting Evronians amongst Machinery
    4=fighting Evronians in the Frozen Mine
    5=fighting Evronians in the Canyon
    6=fighting Evronians in Area 52
    7=fighting Evronians in the Underground
    8=fighting against Zoster
    9=fighting Evronians in the Sewers
    10=fighting Evronians in the Channel 00 Headquarters
    11=fighting Evronians in the Backstage of Channel 00
    12=fighting Evronians in the Evronian Mothership
    13=fighting against Zondag

Display:
    ?0xG36094C=1397507411_0xXCFD044=0?PK is @Level(0xXCFD044) // PAL Dyanmic Level RP
    ?0xG36094C=1397507411_0xXCFD044=1?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xMCFCBC4_0xNCFCBC4_0xOCFCBC4_0xPCFCBC4_0xQCFCBC4_0xRCFCBC4)/6]
    ?0xG36094C=1397507411_0xXCFD044=2?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xSCFCBC4_0xTCFCBC4_0xMCFCBC5_0xNCFCBC5_0xOCFCBC5_0xPCFCBC5)/6]
    ?0xG36094C=1397507411_0xXCFD044=3?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xQCFCBC5_0xRCFCBC5_0xSCFCBC5_0xTCFCBC5_0xMCFCBC6_0xNCFCBC6)/6]
    ?0xG36094C=1397507411_0xXCFD044=4?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xOCFCBC6_0xPCFCBC6_0xQCFCBC6_0xRCFCBC6_0xSCFCBC6_0xTCFCBC6)/6]
    ?0xG36094C=1397507411_0xXCFD044=5?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xMCFCBC7_0xNCFCBC7_0xOCFCBC7_0xPCFCBC7_0xQCFCBC7_0xRCFCBC7)/6]
    ?0xG36094C=1397507411_0xXCFD044=6?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xSCFCBC7_0xTCFCBC7_0xMCFCBC8_0xNCFCBC8_0xOCFCBC8_0xPCFCBC8)/6]
    ?0xG36094C=1397507411_0xXCFD044=7?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xQCFCBC8_0xRCFCBC8_0xSCFCBC8_0xTCFCBC8_0xMCFCBC9_0xNCFCBC9)/6]
    ?0xG36094C=1397507411_0xXCFD044=8?PK is @Level(0xXCFD044)
    ?0xG36094C=1397507411_0xXCFD044=9?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xOCFCBC9_0xPCFCBC9_0xQCFCBC9_0xRCFCBC9_0xSCFCBC9_0xTCFCBC9)/6]
    ?0xG36094C=1397507411_0xXCFD044=10?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xMCFCBCA_0xNCFCBCA_0xOCFCBCA_0xPCFCBCA_0xQCFCBCA_0xRCFCBCA)/6]
    ?0xG36094C=1397507411_0xXCFD044=11?PK is @Level(0xXCFD044) [💫 @ActivationStars(0xHCFCB04_0xHCFCB08)] [🥼 @Scientists(0xSCFCBCA_0xTCFCBCA_0xMCFCBCB_0xNCFCBCB_0xOCFCBCB_0xPCFCBCB)/6]
    ?0xG36094C=1397507411_0xXCFD044=12?PK is @Level(0xXCFD044)
    ?0xG36094C=1397507411_0xXCFD044=13?PK is @Level(0xXCFD044)

    ?0xG360DCC=1397511507_0xXD032D0=0?PK is @Level(0xXD032D0) // NTSC-U Dynamic Level RP
    ?0xG360DCC=1397511507_0xXD032D0=1?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xMD02E50_0xND02E50_0xOD02E50_0xPD02E50_0xQD02E50_0xRD02E50)/6]
    ?0xG360DCC=1397511507_0xXD032D0=2?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xSD02E50_0xTD02E50_0xMD02E51_0xND02E51_0xOD02E51_0xPD02E51)/6]
    ?0xG360DCC=1397511507_0xXD032D0=3?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xQD02E51_0xRD02E51_0xSD02E51_0xTD02E51_0xMD02E52_0xND02E52)/6]
    ?0xG360DCC=1397511507_0xXD032D0=4?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xOD02E52_0xPD02E52_0xQD02E52_0xRD02E52_0xSD02E52_0xTD02E52)/6]
    ?0xG360DCC=1397511507_0xXD032D0=5?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xMD02E53_0xND02E53_0xOD02E53_0xPD02E53_0xQD02E53_0xRD02E53)/6]
    ?0xG360DCC=1397511507_0xXD032D0=6?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xSD02E53_0xTD02E53_0xMD02E54_0xND02E54_0xOD02E54_0xPD02E54)/6]
    ?0xG360DCC=1397511507_0xXD032D0=7?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xQD02E54_0xRD02E54_0xSD02E54_0xTD02E54_0xMD02E55_0xND02E55)/6]
    ?0xG360DCC=1397511507_0xXD032D0=8?PK is @Level(0xXD032D0)
    ?0xG360DCC=1397511507_0xXD032D0=9?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xOD02E55_0xPD02E55_0xQD02E55_0xRD02E55_0xSD02E55_0xTD02E55)/6]
    ?0xG360DCC=1397511507_0xXD032D0=10?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xMD02E56_0xND02E56_0xOD02E56_0xPD02E56_0xQD02E56_0xRD02E56)/6]
    ?0xG360DCC=1397511507_0xXD032D0=11?PK is @Level(0xXD032D0) [💫 @ActivationStars(0xHD02D90_0xHD02D94)] [🥼 @Scientists(0xSD02E56_0xTD02E56_0xMD02E57_0xND02E57_0xOD02E57_0xPD02E57)/6]
    ?0xG360DCC=1397511507_0xXD032D0=12?PK is @Level(0xXD032D0)
    ?0xG360DCC=1397511507_0xXD032D0=13?PK is @Level(0xXD032D0)

    Napping in the Ducklair Tower's 151st Floor... //Bootup
