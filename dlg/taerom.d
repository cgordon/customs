EXTEND_BOTTOM TAEROM 0 8 12 14
  IF ~Global("cu#custom_weapon", "GLOBAL", 0)~ THEN REPLY @1001 GOTO cu#tae_weapprof
END

APPEND TAEROM

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
  IF ~~ THEN REPLY @1046 EXIT
END

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

