EXTEND_TOP HALBAZ 0 #1
  IF ~Global("cu#hal_imbue", "GLOBAL", 0)
      OR(18)
             PartyHasItem("CU#2H002")
             PartyHasItem("CU#AX002")
             PartyHasItem("CU#BS002")
             PartyHasItem("CU#CL002")
             PartyHasItem("CU#DG002")
             PartyHasItem("CU#FL002")
             PartyHasItem("CU#HB002")
             PartyHasItem("CU#KT002")
             PartyHasItem("CU#LS002")
             PartyHasItem("CU#MC002")
             PartyHasItem("CU#MS002")
             PartyHasItem("CU#NT002")
             PartyHasItem("CU#QS002")
             PartyHasItem("CU#SC002")
             PartyHasItem("CU#SP002")
             PartyHasItem("CU#SS002")
             PartyHasItem("CU#WH002")
             PartyHasItem("CU#WZ002")~ THEN REPLY @3001 GOTO cu#hal_imbue

  IF ~Global("cu#hal_imbue", "GLOBAL", 0)
      OR(18)
             PartyHasItem("CU#2H003")
             PartyHasItem("CU#AX003")
             PartyHasItem("CU#BS003")
             PartyHasItem("CU#CL003")
             PartyHasItem("CU#DG003")
             PartyHasItem("CU#FL003")
             PartyHasItem("CU#HB003")
             PartyHasItem("CU#KT003")
             PartyHasItem("CU#LS003")
             PartyHasItem("CU#MC003")
             PartyHasItem("CU#MS003")
             PartyHasItem("CU#NT003")
             PartyHasItem("CU#QS003")
             PartyHasItem("CU#SC003")
             PartyHasItem("CU#SP003")
             PartyHasItem("CU#SS003")
             PartyHasItem("CU#WH003")
             PartyHasItem("CU#WZ003")~ THEN REPLY @3002 GOTO cu#hal_imbue

  IF ~Global("cu#hal_imbue", "GLOBAL", 0)
      OR(18)
             PartyHasItem("CU#2H004")
             PartyHasItem("CU#AX004")
             PartyHasItem("CU#BS004")
             PartyHasItem("CU#CL004")
             PartyHasItem("CU#DG004")
             PartyHasItem("CU#FL004")
             PartyHasItem("CU#HB004")
             PartyHasItem("CU#KT004")
             PartyHasItem("CU#LS004")
             PartyHasItem("CU#MC004")
             PartyHasItem("CU#MS004")
             PartyHasItem("CU#NT004")
             PartyHasItem("CU#QS004")
             PartyHasItem("CU#SC004")
             PartyHasItem("CU#SP004")
             PartyHasItem("CU#SS004")
             PartyHasItem("CU#WH004")
             PartyHasItem("CU#WZ004")~ THEN REPLY @3003 GOTO cu#hal_imbue

  IF ~Global("cu#hal_imbue", "GLOBAL", 0)
      OR(18)
             PartyHasItem("CU#2H005")
             PartyHasItem("CU#AX005")
             PartyHasItem("CU#BS005")
             PartyHasItem("CU#CL005")
             PartyHasItem("CU#DG005")
             PartyHasItem("CU#FL005")
             PartyHasItem("CU#HB005")
             PartyHasItem("CU#KT005")
             PartyHasItem("CU#LS005")
             PartyHasItem("CU#MC005")
             PartyHasItem("CU#MS005")
             PartyHasItem("CU#NT005")
             PartyHasItem("CU#QS005")
             PartyHasItem("CU#SC005")
             PartyHasItem("CU#SP005")
             PartyHasItem("CU#SS005")
             PartyHasItem("CU#WH005")
             PartyHasItem("CU#WZ005")~ THEN REPLY @3004 GOTO cu#hal_imbue
END

APPEND HALBAZ

IF ~~ THEN BEGIN cu#hal_lack_funds
  SAY @3005
  IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN cu#hal_imbue
  SAY @3006

  IF ~PartyHasItem("CU#SC002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SC002", 1) DestroyItem("CU#SC002")
      GiveItemCreate("CU#SC006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#BS002", 1) DestroyItem("CU#BS002")
      GiveItemCreate("CU#BS006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#2H002", 1) DestroyItem("CU#2H002")
      GiveItemCreate("CU#2H006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SS002", 1) DestroyItem("CU#SS002")
      GiveItemCreate("CU#SS006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#NT002", 1) DestroyItem("CU#NT002")
      GiveItemCreate("CU#NT006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WZ002", 1) DestroyItem("CU#WZ002")
      GiveItemCreate("CU#WZ006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#DG002", 1) DestroyItem("CU#DG002")
      GiveItemCreate("CU#DG006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WH002", 1) DestroyItem("CU#WH002")
      GiveItemCreate("CU#WH006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#CL002", 1) DestroyItem("CU#CL002")
      GiveItemCreate("CU#CL006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MC002", 1) DestroyItem("CU#MC002")
      GiveItemCreate("CU#MC006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MS002", 1) DestroyItem("CU#MS002")
      GiveItemCreate("CU#MS006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#FL002", 1) DestroyItem("CU#FL002")
      GiveItemCreate("CU#FL006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#AX002", 1) DestroyItem("CU#AX002")
      GiveItemCreate("CU#AX006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#HB002", 1) DestroyItem("CU#HB002")
      GiveItemCreate("CU#HB006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#QS002", 1) DestroyItem("CU#QS002")
      GiveItemCreate("CU#QS006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#LS002", 1) DestroyItem("CU#LS002")
      GiveItemCreate("CU#LS006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#KT002", 1) DestroyItem("CU#KT002")
      GiveItemCreate("CU#KT006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP002") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SP002", 1) DestroyItem("CU#SP002")
      GiveItemCreate("CU#SP006", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SC003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SC003", 1) DestroyItem("CU#SC003")
      GiveItemCreate("CU#SC007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#BS003", 1) DestroyItem("CU#BS003")
      GiveItemCreate("CU#BS007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#2H003", 1) DestroyItem("CU#2H003")
      GiveItemCreate("CU#2H007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SS003", 1) DestroyItem("CU#SS003")
      GiveItemCreate("CU#SS007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#NT003", 1) DestroyItem("CU#NT003")
      GiveItemCreate("CU#NT007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WZ003", 1) DestroyItem("CU#WZ003")
      GiveItemCreate("CU#WZ007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#DG003", 1) DestroyItem("CU#DG003")
      GiveItemCreate("CU#DG007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WH003", 1) DestroyItem("CU#WH003")
      GiveItemCreate("CU#WH007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#CL003", 1) DestroyItem("CU#CL003")
      GiveItemCreate("CU#CL007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MC003", 1) DestroyItem("CU#MC003")
      GiveItemCreate("CU#MC007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MS003", 1) DestroyItem("CU#MS003")
      GiveItemCreate("CU#MS007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#FL003", 1) DestroyItem("CU#FL003")
      GiveItemCreate("CU#FL007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#AX003", 1) DestroyItem("CU#AX003")
      GiveItemCreate("CU#AX007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#HB003", 1) DestroyItem("CU#HB003")
      GiveItemCreate("CU#HB007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#QS003", 1) DestroyItem("CU#QS003")
      GiveItemCreate("CU#QS007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#LS003", 1) DestroyItem("CU#LS003")
      GiveItemCreate("CU#LS007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#KT003", 1) DestroyItem("CU#KT003")
      GiveItemCreate("CU#KT007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP003") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SP003", 1) DestroyItem("CU#SP003")
      GiveItemCreate("CU#SP007", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SC004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SC004", 1) DestroyItem("CU#SC004")
      GiveItemCreate("CU#SC008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#BS004", 1) DestroyItem("CU#BS004")
      GiveItemCreate("CU#BS008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#2H004", 1) DestroyItem("CU#2H004")
      GiveItemCreate("CU#2H008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SS004", 1) DestroyItem("CU#SS004")
      GiveItemCreate("CU#SS008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#NT004", 1) DestroyItem("CU#NT004")
      GiveItemCreate("CU#NT008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WZ004", 1) DestroyItem("CU#WZ004")
      GiveItemCreate("CU#WZ008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#DG004", 1) DestroyItem("CU#DG004")
      GiveItemCreate("CU#DG008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WH004", 1) DestroyItem("CU#WH004")
      GiveItemCreate("CU#WH008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#CL004", 1) DestroyItem("CU#CL004")
      GiveItemCreate("CU#CL008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MC004", 1) DestroyItem("CU#MC004")
      GiveItemCreate("CU#MC008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MS004", 1) DestroyItem("CU#MS004")
      GiveItemCreate("CU#MS008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#FL004", 1) DestroyItem("CU#FL004")
      GiveItemCreate("CU#FL008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#AX004", 1) DestroyItem("CU#AX004")
      GiveItemCreate("CU#AX008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#HB004", 1) DestroyItem("CU#HB004")
      GiveItemCreate("CU#HB008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#QS004", 1) DestroyItem("CU#QS004")
      GiveItemCreate("CU#QS008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#LS004", 1) DestroyItem("CU#LS004")
      GiveItemCreate("CU#LS008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#KT004", 1) DestroyItem("CU#KT004")
      GiveItemCreate("CU#KT008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP004") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SP004", 1) DestroyItem("CU#SP004")
      GiveItemCreate("CU#SP008", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SC005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SC005", 1) DestroyItem("CU#SC005")
      GiveItemCreate("CU#SC009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#BS005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#BS005", 1) DestroyItem("CU#BS005")
      GiveItemCreate("CU#BS009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#2H005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#2H005", 1) DestroyItem("CU#2H005")
      GiveItemCreate("CU#2H009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SS005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SS005", 1) DestroyItem("CU#SS005")
      GiveItemCreate("CU#SS009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#NT005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#NT005", 1) DestroyItem("CU#NT005")
      GiveItemCreate("CU#NT009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WZ005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WZ005", 1) DestroyItem("CU#WZ005")
      GiveItemCreate("CU#WZ009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#DG005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#DG005", 1) DestroyItem("CU#DG005")
      GiveItemCreate("CU#DG009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#WH005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#WH005", 1) DestroyItem("CU#WH005")
      GiveItemCreate("CU#WH009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#CL005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#CL005", 1) DestroyItem("CU#CL005")
      GiveItemCreate("CU#CL009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MC005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MC005", 1) DestroyItem("CU#MC005")
      GiveItemCreate("CU#MC009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#MS005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#MS005", 1) DestroyItem("CU#MS005")
      GiveItemCreate("CU#MS009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#FL005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#FL005", 1) DestroyItem("CU#FL005")
      GiveItemCreate("CU#FL009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#AX005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#AX005", 1) DestroyItem("CU#AX005")
      GiveItemCreate("CU#AX009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#HB005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#HB005", 1) DestroyItem("CU#HB005")
      GiveItemCreate("CU#HB009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#QS005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#QS005", 1) DestroyItem("CU#QS005")
      GiveItemCreate("CU#QS009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#LS005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#LS005", 1) DestroyItem("CU#LS005")
      GiveItemCreate("CU#LS009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#KT005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#KT005", 1) DestroyItem("CU#KT005")
      GiveItemCreate("CU#KT009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT

  IF ~PartyHasItem("CU#SP005") PartyGoldGT(3999)~ THEN REPLY @3009 DO ~
      TakePartyGold(4000) DestroyGold(4000)
      TakePartyItemNum("CU#SP005", 1) DestroyItem("CU#SP005")
      GiveItemCreate("CU#SP009", Player1, 1, 1, 1)
      SetGlobal("cu#hal_imbue", "GLOBAL", 1)~ EXIT
  IF ~!PartyGoldGT(3999)~ THEN REPLY @3007 GOTO cu#hal_lack_funds
  IF ~~ THEN REPLY @3008 EXIT
  END
END

