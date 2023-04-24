/*
 * Add transitions to states 0, 8, 12 and 14, which are all the states in which the player
 * can ask to look at Taerom's store inventory.
 */
EXTEND_TOP TAEROM 0 8 12 14 #2
  // If the player has not yet completed the Nashkel mines, Taerom isn't interested in
  // crafting a custom weapon, and says so.
  IF ~Global("cu#custom_weapon", "GLOBAL", 0)
      GlobalLT("Chapter", "GLOBAL", 3)~ THEN REPLY @1001 GOTO cu#tae_impress

  // If the player has completed the Nashkel mines, and is proficient in a melee weapon,
  // Taerom will offer to make a weapon matching one of the player's proficiencies.
  IF ~Global("cu#custom_weapon", "GLOBAL", 0)
      GlobalGT("Chapter", "GLOBAL", 2)
      OR(15)
        ProficiencyGT(Player1, 89, 0)
        ProficiencyGT(Player1, 90, 0)
        ProficiencyGT(Player1, 91, 0)
        ProficiencyGT(Player1, 92, 0)
        ProficiencyGT(Player1, 93, 0)
        ProficiencyGT(Player1, 94, 0)
        ProficiencyGT(Player1, 95, 0)
        ProficiencyGT(Player1, 96, 0)
        ProficiencyGT(Player1, 97, 0)
        ProficiencyGT(Player1, 98, 0)
        ProficiencyGT(Player1, 99, 0)
        ProficiencyGT(Player1, 100, 0)
        ProficiencyGT(Player1, 101, 0)
        ProficiencyGT(Player1, 102, 0)
        ProficiencyGT(Player1, 115, 0)~ THEN REPLY @1001 GOTO cu#tae_weapprof

  // If the player has completed the Nashkel mines, but is NOT proficient in a melee
  // weapon, Taerom will offer to craft any melee weapon the player wants.
  IF ~Global("cu#custom_weapon", "GLOBAL", 0)
      GlobalGT("Chapter", "GLOBAL", 2)
      ProficiencyLT(Player1, 89, 1)
      ProficiencyLT(Player1, 90, 1)
      ProficiencyLT(Player1, 91, 1)
      ProficiencyLT(Player1, 92, 1)
      ProficiencyLT(Player1, 93, 1)
      ProficiencyLT(Player1, 94, 1)
      ProficiencyLT(Player1, 95, 1)
      ProficiencyLT(Player1, 96, 1)
      ProficiencyLT(Player1, 97, 1)
      ProficiencyLT(Player1, 98, 1)
      ProficiencyLT(Player1, 99, 1)
      ProficiencyLT(Player1, 100, 1)
      ProficiencyLT(Player1, 101, 1)
      ProficiencyLT(Player1, 102, 1)
      ProficiencyLT(Player1, 115, 1)~ THEN REPLY @1001 GOTO cu#tae_categories
END

APPEND TAEROM

/*
 * The first time the player visits Taerom after completing the Nashkel mines, he will offer
 * his congratulations and agree to make the player a custom weapon (which the player can do
 * at this time using one of these replies, or later, as noted in the previous EXTEND_TOP).
 */
IF WEIGHT #1 ~Global("cu#custom_weapon", "GLOBAL", 0)
    GlobalGT("Chapter", "GLOBAL", 2)
    Global("cu#tae_gratitude", "GLOBAL", 0)~ THEN BEGIN cu#tae_gratitude
  SAY @1061

  // If the player has at least one melee weapon proficiency, Taerom will offer to craft a weapon
  // matching one of the player's melee weapon proficiencies.
  IF ~OR(15)
        ProficiencyGT(Player1, 89, 0)
        ProficiencyGT(Player1, 90, 0)
        ProficiencyGT(Player1, 91, 0)
        ProficiencyGT(Player1, 92, 0)
        ProficiencyGT(Player1, 93, 0)
        ProficiencyGT(Player1, 94, 0)
        ProficiencyGT(Player1, 95, 0)
        ProficiencyGT(Player1, 96, 0)
        ProficiencyGT(Player1, 97, 0)
        ProficiencyGT(Player1, 98, 0)
        ProficiencyGT(Player1, 99, 0)
        ProficiencyGT(Player1, 100, 0)
        ProficiencyGT(Player1, 101, 0)
        ProficiencyGT(Player1, 102, 0)
        ProficiencyGT(Player1, 115, 0)~ THEN DO ~SetGlobal("cu#tae_gratitude", "GLOBAL", 1)~ REPLY @1062 GOTO cu#tae_weapprof

  // If the player does not have any melee weapon proficiencies, Taerom will provide a menu of options
  // for the player to craft any melee weapon.
  IF ~ProficiencyLT(Player1, 89, 1)
      ProficiencyLT(Player1, 90, 1)
      ProficiencyLT(Player1, 91, 1)
      ProficiencyLT(Player1, 92, 1)
      ProficiencyLT(Player1, 93, 1)
      ProficiencyLT(Player1, 94, 1)
      ProficiencyLT(Player1, 95, 1)
      ProficiencyLT(Player1, 96, 1)
      ProficiencyLT(Player1, 97, 1)
      ProficiencyLT(Player1, 98, 1)
      ProficiencyLT(Player1, 99, 1)
      ProficiencyLT(Player1, 100, 1)
      ProficiencyLT(Player1, 101, 1)
      ProficiencyLT(Player1, 102, 1)
      ProficiencyLT(Player1, 115, 1)~ THEN DO ~SetGlobal("cu#tae_gratitude", "GLOBAL", 1)~ REPLY @1062 GOTO cu#tae_categories
  IF ~~ THEN DO ~SetGlobal("cu#tae_gratitude", "GLOBAL", 1)~ REPLY @1063 EXIT
END

/*
 * Taerom is not yet impressed enough by the player to craft a custom weapon.
 */
IF ~~ THEN BEGIN cu#tae_impress
  SAY @1064
  IF ~~ THEN EXIT
END

/*
 * The player has at least one melee weapon proficiency, so Taerom will offer to make a weapon matching any of the player's
 * melee proficiencies. Note that a proficiency like "Scimitar / Wakizashi / Ninjato" will result in all three of those
 * weapons being offered. The player has the option to make any other kind of weapon as well, or to exit the conversation.
 */
IF ~~ THEN BEGIN cu#tae_weapprof
  SAY @1002
  IF ~ProficiencyGT(Player1, 89, 0)~ THEN REPLY @1012 GOTO cu#tae_bastard_sword
  IF ~ProficiencyGT(Player1, 90, 0)~ THEN REPLY @1009 GOTO cu#tae_long_sword
  IF ~ProficiencyGT(Player1, 91, 0)~ THEN REPLY @1015 GOTO cu#tae_short_sword
  IF ~ProficiencyGT(Player1, 92, 0)~ THEN REPLY @1007 GOTO cu#tae_battle_axe
  IF ~ProficiencyGT(Player1, 93, 0)~ THEN REPLY @1013 GOTO cu#tae_two_handed_sword
  IF ~ProficiencyGT(Player1, 94, 0)~ THEN REPLY @1010 GOTO cu#tae_katana
  IF ~ProficiencyGT(Player1, 95, 0)~ THEN REPLY @1011 GOTO cu#tae_scimitar
  IF ~ProficiencyGT(Player1, 95, 0)~ THEN REPLY @1017 GOTO cu#tae_wakizashi
  IF ~ProficiencyGT(Player1, 95, 0)~ THEN REPLY @1016 GOTO cu#tae_ninjato
  IF ~ProficiencyGT(Player1, 96, 0)~ THEN REPLY @1018 GOTO cu#tae_dagger
  IF ~ProficiencyGT(Player1, 97, 0)~ THEN REPLY @1020 GOTO cu#tae_war_hammer
  IF ~ProficiencyGT(Player1, 98, 0)~ THEN REPLY @1026 GOTO cu#tae_spear
  IF ~ProficiencyGT(Player1, 99, 0)~ THEN REPLY @1027 GOTO cu#tae_halberd
  IF ~ProficiencyGT(Player1, 100, 0)~ THEN REPLY @1024 GOTO cu#tae_flail
  IF ~ProficiencyGT(Player1, 100, 0)~ THEN REPLY @1023 GOTO cu#tae_morning_star
  IF ~ProficiencyGT(Player1, 101, 0)~ THEN REPLY @1022 GOTO cu#tae_mace
  IF ~ProficiencyGT(Player1, 102, 0)~ THEN REPLY @1028 GOTO cu#tae_quarterstaff
  IF ~ProficiencyGT(Player1, 115, 0)~ THEN REPLY @1021 GOTO cu#tae_club
  IF ~~ THEN REPLY @1060 GOTO cu#tae_categories
  IF ~~ THEN REPLY @1046 EXIT
END

/*
 * If the player doesn't have any melee proficiencies, or would prefer to make a weapon that does not match one of their
 * melee proficiencies, this provides a two-level menu for selecting a weapon to create from the list of all possible
 * melee weapons.
 */
IF ~~ THEN BEGIN cu#tae_categories
  SAY @1055
  IF ~~ THEN REPLY @1056 GOTO cu#tae_large_blades
  IF ~~ THEN REPLY @1057 GOTO cu#tae_short_blades
  IF ~~ THEN REPLY @1058 GOTO cu#tae_blunts
  IF ~~ THEN REPLY @1059 GOTO cu#tae_staff
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_large_blades
  SAY @1051
  IF ~~ THEN REPLY @1012 GOTO cu#tae_bastard_sword
  IF ~~ THEN REPLY @1009 GOTO cu#tae_long_sword
  IF ~~ THEN REPLY @1013 GOTO cu#tae_two_handed_sword
  IF ~~ THEN REPLY @1010 GOTO cu#tae_katana
  IF ~~ THEN REPLY @1011 GOTO cu#tae_scimitar
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_short_blades
  SAY @1052
  IF ~~ THEN REPLY @1015 GOTO cu#tae_short_sword
  IF ~~ THEN REPLY @1007 GOTO cu#tae_battle_axe
  IF ~~ THEN REPLY @1017 GOTO cu#tae_wakizashi
  IF ~~ THEN REPLY @1016 GOTO cu#tae_ninjato
  IF ~~ THEN REPLY @1018 GOTO cu#tae_dagger
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_blunts
  SAY @1053
  IF ~~ THEN REPLY @1022 GOTO cu#tae_mace
  IF ~~ THEN REPLY @1020 GOTO cu#tae_war_hammer
  IF ~~ THEN REPLY @1024 GOTO cu#tae_flail
  IF ~~ THEN REPLY @1021 GOTO cu#tae_club
  IF ~~ THEN REPLY @1023 GOTO cu#tae_morning_star
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_staff
  SAY @1054
  IF ~~ THEN REPLY @1028 GOTO cu#tae_quarterstaff
  IF ~~ THEN REPLY @1026 GOTO cu#tae_spear
  IF ~~ THEN REPLY @1027 GOTO cu#tae_halberd
  IF ~~ THEN REPLY @1046 EXIT
END

/*
 * Taerom tells the player to get out there and fix their lack of funds.
 */
IF ~~ THEN BEGIN cu#tae_lack_funds
  SAY @1049
  IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN cu#tae_scimitar
  SAY @1029
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#SC001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_bastard_sword
  SAY @1030
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#BS001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_two_handed_sword
  SAY @1031
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#2H001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_short_sword
  SAY @1032
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#SS001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_ninjato
  SAY @1033
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#NT001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_wakizashi
  SAY @1034
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#WZ001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_dagger
  SAY @1035
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#DG001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_war_hammer
  SAY @1036
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#WH001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_club
  SAY @1037
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#CL001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_mace
  SAY @1038
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#MC001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_morning_star
  SAY @1039
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#MS001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_flail
  SAY @1040
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#FL001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_battle_axe
  SAY @1041
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#AX001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_halberd
  SAY @1042
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#HB001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_quarterstaff
  SAY @1043
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#QS001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_long_sword
  SAY @1044
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#LS001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_katana
  SAY @1045
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#KT001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END

IF ~~ THEN BEGIN cu#tae_spear
  SAY @1050
  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~
    TakePartyGold(1800)
    DestroyGold(1800)
    GiveItemCreate("CU#SP001", Player1, 1, 1, 1)
    SetGlobal("cu#custom_weapon", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds
  IF ~~ THEN REPLY @1046 EXIT
END
END

