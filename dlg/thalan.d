/*
 * Thalantyr has a couple grumpy starting conversations, the first of which is gated by the
 * "RumorTalkThalan" global. This extends the top of state 1 to include transitions for asking
 * Thalantyr to imbue the player's masterwork weapon from Taerom.
 */
EXTEND_TOP THALAN 1 #1
  // If the player has already assuaged Thalantyr's ego, but does not have a weapon from Taerom,
  // Thalantyr will tell them that he doesn't see a weapon worth imbuing, and hints that Taerom
  // could make them one.
  IF ~Global("RumorTalkThalan", "GLOBAL", 1)
      Global("cu#tha_imbue", "GLOBAL", 0)
      !PartyHasItem("CU#2H001")
      !PartyHasItem("CU#AX001")
      !PartyHasItem("CU#BS001")
      !PartyHasItem("CU#CL001")
      !PartyHasItem("CU#DG001")
      !PartyHasItem("CU#FL001")
      !PartyHasItem("CU#HB001")
      !PartyHasItem("CU#KT001")
      !PartyHasItem("CU#LS001")
      !PartyHasItem("CU#MC001")
      !PartyHasItem("CU#MS001")
      !PartyHasItem("CU#NT001")
      !PartyHasItem("CU#QS001")
      !PartyHasItem("CU#SC001")
      !PartyHasItem("CU#SP001")
      !PartyHasItem("CU#SS001")
      !PartyHasItem("CU#WH001")
      !PartyHasItem("CU#WZ001")~ THEN REPLY @2001 GOTO cu#tha_no_weapon

  // If the player has already assuaged Thalantyr's ego, and has a weapon from Taerom,
  // Thalantyr will offer to imbue it with an elemental damage of the player's choice.
  IF ~Global("RumorTalkThalan", "GLOBAL", 1)
      Global("cu#tha_imbue", "GLOBAL", 0)
      OR(18) PartyHasItem("CU#2H001")
             PartyHasItem("CU#AX001")
             PartyHasItem("CU#BS001")
             PartyHasItem("CU#CL001")
             PartyHasItem("CU#DG001")
             PartyHasItem("CU#FL001")
             PartyHasItem("CU#HB001")
             PartyHasItem("CU#KT001")
             PartyHasItem("CU#LS001")
             PartyHasItem("CU#MC001")
             PartyHasItem("CU#MS001")
             PartyHasItem("CU#NT001")
             PartyHasItem("CU#QS001")
             PartyHasItem("CU#SC001")
             PartyHasItem("CU#SP001")
             PartyHasItem("CU#SS001")
             PartyHasItem("CU#WH001")
             PartyHasItem("CU#WZ001")~ THEN REPLY @2003 GOTO cu#tha_elem_dmg
END

/*
 * State 2 is similar to state 1, but does not need to be guarded by the RumorTalkThalan
 * global variable, so this is just a repeat of the above transitions without that guard.
 */
EXTEND_TOP THALAN 2 #1
  IF ~Global("cu#tha_imbue", "GLOBAL", 0)
      !PartyHasItem("CU#2H001")
      !PartyHasItem("CU#AX001")
      !PartyHasItem("CU#BS001")
      !PartyHasItem("CU#CL001")
      !PartyHasItem("CU#DG001")
      !PartyHasItem("CU#FL001")
      !PartyHasItem("CU#HB001")
      !PartyHasItem("CU#KT001")
      !PartyHasItem("CU#LS001")
      !PartyHasItem("CU#MC001")
      !PartyHasItem("CU#MS001")
      !PartyHasItem("CU#NT001")
      !PartyHasItem("CU#QS001")
      !PartyHasItem("CU#SC001")
      !PartyHasItem("CU#SP001")
      !PartyHasItem("CU#SS001")
      !PartyHasItem("CU#WH001")
      !PartyHasItem("CU#WZ001")~ THEN REPLY @2001 GOTO cu#tha_no_weapon
  IF ~Global("cu#tha_imbue", "GLOBAL", 0)
      OR(18) PartyHasItem("CU#2H001")
             PartyHasItem("CU#AX001")
             PartyHasItem("CU#BS001")
             PartyHasItem("CU#CL001")
             PartyHasItem("CU#DG001")
             PartyHasItem("CU#FL001")
             PartyHasItem("CU#HB001")
             PartyHasItem("CU#KT001")
             PartyHasItem("CU#LS001")
             PartyHasItem("CU#MC001")
             PartyHasItem("CU#MS001")
             PartyHasItem("CU#NT001")
             PartyHasItem("CU#QS001")
             PartyHasItem("CU#SC001")
             PartyHasItem("CU#SP001")
             PartyHasItem("CU#SS001")
             PartyHasItem("CU#WH001")
             PartyHasItem("CU#WZ001")~ THEN REPLY @2003 GOTO cu#tha_elem_dmg
END

APPEND THALAN

/*
 * Thalantyr notes that the player does not have a weapon that he can imbue, and recommends
 * talking to Taerom about it.
 */
IF ~~ THEN BEGIN cu#tha_no_weapon
  SAY @2002
  IF ~~ THEN DO ~~ EXIT
END

/*
 * Thalantyr provides a menu of elemental damage types from which the player may select.
 */
IF ~~ THEN BEGIN cu#tha_elem_dmg
  SAY @2006
  IF ~~ THEN REPLY @2007 GOTO cu#tha_acid_dmg
  IF ~~ THEN REPLY @2008 GOTO cu#tha_cold_dmg
  IF ~~ THEN REPLY @2009 GOTO cu#tha_fire_dmg
  IF ~~ THEN REPLY @2010 GOTO cu#tha_elec_dmg
  IF ~~ THEN REPLY @2005 EXIT
END

/*
 * Thalantyr tells the player to get richer.
 */
IF ~~ THEN BEGIN cu#tha_lack_funds
  SAY @2011
  IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN cu#tha_cold_dmg
  SAY @2012

  IF ~PartyHasItem("CU#SC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SC001", 1) DestroyItem("CU#SC001")
    GiveItemCreate("CU#SC002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#BS001", 1) DestroyItem("CU#BS001")
    GiveItemCreate("CU#BS002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#2H001", 1) DestroyItem("CU#2H001")
    GiveItemCreate("CU#2H002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SS001", 1) DestroyItem("CU#SS001")
    GiveItemCreate("CU#SS002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#NT001", 1) DestroyItem("CU#NT001")
    GiveItemCreate("CU#NT002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WZ001", 1) DestroyItem("CU#WZ001")
    GiveItemCreate("CU#WZ002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#DG001", 1) DestroyItem("CU#DG001")
    GiveItemCreate("CU#DG002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WH001", 1) DestroyItem("CU#WH001")
    GiveItemCreate("CU#WH002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#CL001", 1) DestroyItem("CU#CL001")
    GiveItemCreate("CU#CL002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MC001", 1) DestroyItem("CU#MC001")
    GiveItemCreate("CU#MC002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MS001", 1) DestroyItem("CU#MS001")
    GiveItemCreate("CU#MS002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#FL001", 1) DestroyItem("CU#FL001")
    GiveItemCreate("CU#FL002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#AX001", 1) DestroyItem("CU#AX001")
    GiveItemCreate("CU#AX002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#HB001", 1) DestroyItem("CU#HB001")
    GiveItemCreate("CU#HB002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#QS001", 1) DestroyItem("CU#QS001")
    GiveItemCreate("CU#QS002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#LS001", 1) DestroyItem("CU#LS001")
    GiveItemCreate("CU#LS002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#KT001", 1) DestroyItem("CU#KT001")
    GiveItemCreate("CU#KT002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SP001", 1) DestroyItem("CU#SP001")
    GiveItemCreate("CU#SP002", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1999)~ THEN REPLY @2017 GOTO cu#tha_lack_funds
  IF ~~ THEN REPLY @2005 EXIT
END

IF ~~ THEN BEGIN cu#tha_acid_dmg
  SAY @2013

  IF ~PartyHasItem("CU#SC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SC001", 1) DestroyItem("CU#SC001")
    GiveItemCreate("CU#SC003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#BS001", 1) DestroyItem("CU#BS001")
    GiveItemCreate("CU#BS003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#2H001", 1) DestroyItem("CU#2H001")
    GiveItemCreate("CU#2H003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SS001", 1) DestroyItem("CU#SS001")
    GiveItemCreate("CU#SS003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#NT001", 1) DestroyItem("CU#NT001")
    GiveItemCreate("CU#NT003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WZ001", 1) DestroyItem("CU#WZ001")
    GiveItemCreate("CU#WZ003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#DG001", 1) DestroyItem("CU#DG001")
    GiveItemCreate("CU#DG003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WH001", 1) DestroyItem("CU#WH001")
    GiveItemCreate("CU#WH003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#CL001", 1) DestroyItem("CU#CL001")
    GiveItemCreate("CU#CL003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MC001", 1) DestroyItem("CU#MC001")
    GiveItemCreate("CU#MC003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MS001", 1) DestroyItem("CU#MS001")
    GiveItemCreate("CU#MS003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#FL001", 1) DestroyItem("CU#FL001")
    GiveItemCreate("CU#FL003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#AX001", 1) DestroyItem("CU#AX001")
    GiveItemCreate("CU#AX003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#HB001", 1) DestroyItem("CU#HB001")
    GiveItemCreate("CU#HB003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#QS001", 1) DestroyItem("CU#QS001")
    GiveItemCreate("CU#QS003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#LS001", 1) DestroyItem("CU#LS001")
    GiveItemCreate("CU#LS003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#KT001", 1) DestroyItem("CU#KT001")
    GiveItemCreate("CU#KT003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SP001", 1) DestroyItem("CU#SP001")
    GiveItemCreate("CU#SP003", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1999)~ THEN REPLY @2017 GOTO cu#tha_lack_funds
  IF ~~ THEN REPLY @2005 EXIT
END

IF ~~ THEN BEGIN cu#tha_elec_dmg
  SAY @2014

  IF ~PartyHasItem("CU#SC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SC001", 1) DestroyItem("CU#SC001")
    GiveItemCreate("CU#SC004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#BS001", 1) DestroyItem("CU#BS001")
    GiveItemCreate("CU#BS004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#2H001", 1) DestroyItem("CU#2H001")
    GiveItemCreate("CU#2H004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SS001", 1) DestroyItem("CU#SS001")
    GiveItemCreate("CU#SS004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#NT001", 1) DestroyItem("CU#NT001")
    GiveItemCreate("CU#NT004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WZ001", 1) DestroyItem("CU#WZ001")
    GiveItemCreate("CU#WZ004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#DG001", 1) DestroyItem("CU#DG001")
    GiveItemCreate("CU#DG004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WH001", 1) DestroyItem("CU#WH001")
    GiveItemCreate("CU#WH004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#CL001", 1) DestroyItem("CU#CL001")
    GiveItemCreate("CU#CL004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MC001", 1) DestroyItem("CU#MC001")
    GiveItemCreate("CU#MC004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MS001", 1) DestroyItem("CU#MS001")
    GiveItemCreate("CU#MS004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#FL001", 1) DestroyItem("CU#FL001")
    GiveItemCreate("CU#FL004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#AX001", 1) DestroyItem("CU#AX001")
    GiveItemCreate("CU#AX004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#HB001", 1) DestroyItem("CU#HB001")
    GiveItemCreate("CU#HB004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#QS001", 1) DestroyItem("CU#QS001")
    GiveItemCreate("CU#QS004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#LS001", 1) DestroyItem("CU#LS001")
    GiveItemCreate("CU#LS004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#KT001", 1) DestroyItem("CU#KT001")
    GiveItemCreate("CU#KT004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SP001", 1) DestroyItem("CU#SP001")
    GiveItemCreate("CU#SP004", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1999)~ THEN REPLY @2017 GOTO cu#tha_lack_funds
  IF ~~ THEN REPLY @2005 EXIT
END

IF ~~ THEN BEGIN cu#tha_fire_dmg
  SAY @2015

  IF ~PartyHasItem("CU#SC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SC001", 1) DestroyItem("CU#SC001")
    GiveItemCreate("CU#SC005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#BS001", 1) DestroyItem("CU#BS001")
    GiveItemCreate("CU#BS005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#2H001", 1) DestroyItem("CU#2H001")
    GiveItemCreate("CU#2H005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SS001", 1) DestroyItem("CU#SS001")
    GiveItemCreate("CU#SS005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#NT001", 1) DestroyItem("CU#NT001")
    GiveItemCreate("CU#NT005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WZ001", 1) DestroyItem("CU#WZ001")
    GiveItemCreate("CU#WZ005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#DG001", 1) DestroyItem("CU#DG001")
    GiveItemCreate("CU#DG005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#WH001", 1) DestroyItem("CU#WH001")
    GiveItemCreate("CU#WH005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#CL001", 1) DestroyItem("CU#CL001")
    GiveItemCreate("CU#CL005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MC001", 1) DestroyItem("CU#MC001")
    GiveItemCreate("CU#MC005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#MS001", 1) DestroyItem("CU#MS001")
    GiveItemCreate("CU#MS005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#FL001", 1) DestroyItem("CU#FL001")
    GiveItemCreate("CU#FL005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#AX001", 1) DestroyItem("CU#AX001")
    GiveItemCreate("CU#AX005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#HB001", 1) DestroyItem("CU#HB001")
    GiveItemCreate("CU#HB005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#QS001", 1) DestroyItem("CU#QS001")
    GiveItemCreate("CU#QS005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#LS001", 1) DestroyItem("CU#LS001")
    GiveItemCreate("CU#LS005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#KT001", 1) DestroyItem("CU#KT001")
    GiveItemCreate("CU#KT005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP001") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~
    TakePartyGold(2000) DestroyGold(2000)
    TakePartyItemNum("CU#SP001", 1) DestroyItem("CU#SP001")
    GiveItemCreate("CU#SP005", Player1, 1, 1, 1)
    SetGlobal("cu#tha_imbue", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(1999)~ THEN REPLY @2017 GOTO cu#tha_lack_funds
  IF ~~ THEN REPLY @2005 EXIT
END
END

