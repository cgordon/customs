#!/usr/bin/env python

import os


ITEM_NAME = "~<CHARNAME>'s Resolve~"
ITEM_DESC = "~This masterfully crafted {lc_name} was commissioned by <CHARNAME> and forged by the renowned blacksmith Taerom Fuiruim at the Thunderhammer Smithy in Beregost. It is made from high-quality materials, balanced perfectly for <CHARNAME> and carefully constructed to withstand the hardships of regular use."


NO_MODIFIER_DESC = ""


THALAN_COLD_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to freeze anything it strikes.
"""


THALAN_ACID_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to corrode anything it strikes.
"""


THALAN_ELEC_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to shock anything it strikes.
"""


THALAN_FIRE_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to burn anything it strikes.
"""


HALBAZ_COLD_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to freeze anything it strikes, and the high mage Halbazzer Drin made the effect even more powerful.
"""

HALBAZ_ACID_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to corrode anything it strikes, and the high mage Halbazzer Drin made the effect even more powerful.
"""

HALBAZ_ELEC_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to shock anything it strikes, and the high mage Halbazzer Drin made the effect even more powerful.
"""

HALBAZ_FIRE_MODIFIER_DESC = """

The hedge mage Thalantyr imbued this {lc_name} with the power to burn anything it strikes, and the high mage Halbazzer Drin made the effect even more powerful.
"""


ITEM_STATS = """

STATISTICS:

THACO: +{hit_bonus}
Damage: {damage}+{dmg_bonus}{extra_damage} ({type})
Speed Factor: {speed}
Proficiency Type: {prof}
Type: {hands}
Requires:
 {strength} Strength

Weight: {weight}~"""


WEAPON_TYPES = [
  {
    "lc_name": "scimitar",
    "damage": "1d8",
    "hit_bonus": 1,
    "dmg_bonus": 1,
    "type": "slashing",
    "speed": 4,
    "hands": "One-handed",
    "strength": 10,
    "prof": "Scimitar/Wakizashi/Ninjato",
    "weight": 4,
    "itm_file_prefix": "CU#SC",
    "say_idx": 1029,
  },
  {
    "lc_name": "bastard sword",
    "damage": "2d4",
    "hit_bonus": 1,
    "dmg_bonus": 1,
    "type": "slashing",
    "speed": 7,
    "hands": "One-handed",
    "strength": 11,
    "prof": "Bastard Sword",
    "weight": 10,
    "itm_file_prefix": "CU#BS",
    "say_idx": 1030,
  },
  {
    "lc_name": "two-handed sword",
    "damage": "1d10",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "slashing",
    "speed": 9,
    "hands": "Two-handed",
    "strength": 14,
    "prof": "Two-Handed Sword",
    "weight": 15,
    "itm_file_prefix": "CU#2H",
    "say_idx": 1031,
  },
  {
    "lc_name": "short sword",
    "damage": "1d6",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "piercing",
    "speed": 2,
    "hands": "One-handed",
    "strength": 5,
    "prof": "Short Sword",
    "weight": 3,
    "itm_file_prefix": "CU#SS",
    "say_idx": 1032,
  },
  {
    "lc_name": "ninjato",
    "damage": "1d8",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "slashing",
    "speed": 3,
    "hands": "One-handed",
    "strength": 6,
    "prof": "Scimitar/Wakizashi/Ninjato",
    "weight": 5,
    "itm_file_prefix": "CU#NT",
    "say_idx": 1033,
  },
  {
    "lc_name": "wakizashi",
    "damage": "1d8",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "piercing",
    "speed": 2,
    "hands": "One-handed",
    "strength": 5,
    "prof": "Scimitar/Wakizashi/Ninjato",
    "weight": 3,
    "itm_file_prefix": "CU#WZ",
    "say_idx": 1034,
  },
  {
    "lc_name": "dagger",
    "damage": "1d4",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "piercing",
    "speed": 1,
    "hands": "One-handed",
    "strength": 3,
    "prof": "Dagger",
    "weight": 1,
    "itm_file_prefix": "CU#DG",
    "say_idx": 1035,
  },
  {
    "lc_name": "war hammer",
    "damage": "1d4",
    "dmg_bonus": 2,
    "hit_bonus": 1,
    "type": "crushing",
    "speed": 4,
    "hands": "One-handed",
    "strength": 9,
    "prof": "War Hammer",
    "weight": 6,
    "itm_file_prefix": "CU#WH",
    "say_idx": 1036,
  },
  {
    "lc_name": "club",
    "damage": "1d6",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "crushing",
    "speed": 3,
    "hands": "One-handed",
    "strength": 5,
    "prof": "Club",
    "weight": 3,
    "itm_file_prefix": "CU#CL",
    "say_idx": 1037,
  },
  {
    "lc_name": "mace",
    "damage": "1d6",
    "dmg_bonus": 2,
    "hit_bonus": 1,
    "type": "crushing",
    "speed": 6,
    "hands": "One-handed",
    "strength": 10,
    "prof": "Mace",
    "weight": 10,
    "itm_file_prefix": "CU#MC",
    "say_idx": 1038,
  },
  {
    "lc_name": "morning star",
    "damage": "2d4",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "crushing",
    "speed": 6,
    "hands": "One-handed",
    "strength": 11,
    "prof": "Flail/Morning Star",
    "weight": 12,
    "itm_file_prefix": "CU#MS",
    "say_idx": 1039,
  },
  {
    "lc_name": "flail",
    "damage": "1d6",
    "dmg_bonus": 2,
    "hit_bonus": 1,
    "type": "crushing",
    "speed": 6,
    "hands": "One-handed",
    "strength": 13,
    "prof": "Flail/Morning Star",
    "weight": 15,
    "itm_file_prefix": "CU#FL",
    "say_idx": 1040,
  },
  {
    "lc_name": "battle axe",
    "damage": "1d8",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "slashing",
    "speed": 6,
    "hands": "One-handed",
    "strength": 10,
    "prof": "Axe",
    "weight": 7,
    "itm_file_prefix": "CU#AX",
    "say_idx": 1041,
  },
  {
    "lc_name": "halberd",
    "damage": "1d10",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "piercing/slashing",
    "speed": 8,
    "hands": "Two-handed",
    "strength": 13,
    "prof": "Halberd",
    "weight": 15,
    "itm_file_prefix": "CU#HB",
    "say_idx": 1042,
  },
  {
    "lc_name": "quarterstaff",
    "damage": "1d6",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "crushing",
    "speed": 3,
    "hands": "Two-handed",
    "strength": 5,
    "prof": "Quarterstaff",
    "weight": 4,
    "itm_file_prefix": "CU#QS",
    "say_idx": 1043,
  },
  {
    "lc_name": "long sword",
    "damage": "1d8",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "slashing",
    "speed": 4,
    "hands": "One-handed",
    "strength": 5,
    "prof": "Long Sword",
    "weight": 4,
    "itm_file_prefix": "CU#LS",
    "say_idx": 1044,
  },
  {
    "lc_name": "katana",
    "damage": "1d10",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "slashing",
    "speed": 3,
    "hands": "One-handed",
    "strength": 6,
    "prof": "Katana",
    "weight": 6,
    "itm_file_prefix": "CU#KT",
    "say_idx": 1045,
  },
  {
    "lc_name": "spear",
    "damage": "1d6",
    "dmg_bonus": 1,
    "hit_bonus": 1,
    "type": "piercing",
    "speed": 5,
    "hands": "One-handed",
    "strength": 5,
    "prof": "Spear",
    "weight": 5,
    "itm_file_prefix": "CU#SP",
    "say_idx": 1050,
  },
]


EMPTY_MODIFIER = {
  "extra_damage": "",
  "extra_desc": "",
  "effect": "",
  "hit_bonus": 0,
  "dmg_bonus": 0,
}


THALAN_MODIFIERS = [
  {
    "say_idx": 2012,
    "tag": "cold_dmg",
    "extra_damage": ", +1 cold damage",
    "extra_desc": THALAN_COLD_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 1 parameter2 = 0x20000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "suffix": "002",
    "hit_bonus": 0,
    "dmg_bonus": 0,
  },
  {
    "say_idx": 2013,
    "tag": "acid_dmg",
    "extra_damage": ", +1 acid damage",
    "extra_desc": THALAN_ACID_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 1 parameter2 = 0x10000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "suffix": "003",
    "hit_bonus": 0,
    "dmg_bonus": 0,
  },
  {
    "say_idx": 2014,
    "tag": "elec_dmg",
    "extra_damage": ", +1 shock damage",
    "extra_desc": THALAN_ELEC_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 1 parameter2 = 0x40000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "suffix": "004",
    "hit_bonus": 0,
    "dmg_bonus": 0,
  },
  {
    "say_idx": 2015,
    "tag": "fire_dmg",
    "extra_damage": ", +1 fire damage",
    "extra_desc": THALAN_FIRE_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 1 parameter2 = 0x80000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "suffix": "005",
    "hit_bonus": 0,
    "dmg_bonus": 0,
  },
]

HALBAZ_MODIFIERS = [
  {
    "extra_damage": ", +2 cold damage",
    "extra_desc": HALBAZ_COLD_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 2 parameter2 = 0x20000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "prev_suffix": "002",
    "suffix": "006",
    "hit_bonus": 1,
    "dmg_bonus": 1,
  },
  {
    "extra_damage": ", +2 acid damage",
    "extra_desc": HALBAZ_ACID_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 2 parameter2 = 0x10000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "prev_suffix": "003",
    "suffix": "007",
    "hit_bonus": 1,
    "dmg_bonus": 1,
  },
  {
    "extra_damage": ", +2 shock damage",
    "extra_desc": HALBAZ_ELEC_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 2 parameter2 = 0x40000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "prev_suffix": "004",
    "suffix": "008",
    "hit_bonus": 1,
    "dmg_bonus": 1,
  },
  {
    "extra_damage": ", +2 fire damage",
    "extra_desc": HALBAZ_FIRE_MODIFIER_DESC,
    "effect": "LPF ADD_ITEM_EFFECT INT_VAR type = 1 opcode = 12 target = 2 parameter1 = 2 parameter2 = 0x80000 timing = 1 resist_dispel = 1 probability1 = 100 END",
    "prev_suffix": "005",
    "suffix": "009",
    "hit_bonus": 1,
    "dmg_bonus": 1,
  },
]


def write_item_tpa(items_tpa_fh, itm_file_prefix, itm_file_suffix, item_name_idx, item_desc_idx, wpm):
  bam_path = "itm/%s%s.BAM" % (itm_file_prefix, itm_file_suffix)
  if os.path.isfile(bam_path):
    items_tpa_fh.write("COPY ~customs/%s~ ~override/%s%s.BAM~\n" % (bam_path, itm_file_prefix, itm_file_suffix))
  items_tpa_fh.write("COPY ~customs/itm/%s000.itm~ ~override/%s%s.itm~\n" % (itm_file_prefix, itm_file_prefix, itm_file_suffix))
  items_tpa_fh.write("  SAY NAME1 @%d\n" % item_name_idx)
  items_tpa_fh.write("  SAY NAME2 @%d\n" % item_name_idx)
  items_tpa_fh.write("  SAY UNIDENTIFIED_DESC @%d\n" % item_desc_idx)
  items_tpa_fh.write("  SAY DESC @%d\n" % item_desc_idx)
  items_tpa_fh.write("  WRITE_LONG 0x0060 %d\n" % wpm["hit_bonus"])
  if os.path.isfile(bam_path):
    items_tpa_fh.write("  WRITE_ASCII 0x003A ~%s%s~ #8\n" % (itm_file_prefix, itm_file_suffix))

  items_tpa_fh.write("  GET_OFFSET_ARRAY hd_array ITM_V10_HEADERS\n")
  items_tpa_fh.write("  PHP_EACH hd_array AS int => hd_offset\n")
  items_tpa_fh.write("  BEGIN\n")
  items_tpa_fh.write("    WRITE_SHORT hd_offset + 0x0014 %d\n" % wpm["hit_bonus"])
  items_tpa_fh.write("    WRITE_SHORT hd_offset + 0x001A %d\n" % wpm["dmg_bonus"])
  if os.path.isfile(bam_path):
    items_tpa_fh.write("    WRITE_ASCII hd_offset + 0x0004 ~%s%s~ #8\n" % (itm_file_prefix, itm_file_suffix))
  items_tpa_fh.write("  END\n")
  if wpm["effect"] != "":
    items_tpa_fh.write("  WRITE_LONG 0x0018 THIS BOR BIT6\n")  # magical
    items_tpa_fh.write("  " + wpm["effect"] + "\n")
  items_tpa_fh.write("\n")


def write_item_tra(items_tra_fh, item_name_idx, item_desc_idx, args):
  items_tra_fh.write("@%d=%s\n" % (item_name_idx, ITEM_NAME.format(**args)))
  items_tra_fh.write("@%d=%s%s%s\n" % (item_desc_idx, ITEM_DESC.format(**args), args["extra_desc"].format(**args), ITEM_STATS.format(**args)))


def write_halbaz_header(halbaz_d_fh):
  with open("scripts/halbaz.d.template") as halbaz_tmpl_fh:
    for line in halbaz_tmpl_fh:
      halbaz_d_fh.write(line)


def write_halbaz_dlg(halbaz_d_fh, itm_file_prefix, prev_itm_file_suffix, cur_itm_file_suffix):
  prev_itm = "\"%s%s\"" % (itm_file_prefix, prev_itm_file_suffix)

  halbaz_d_fh.write("\n")
  halbaz_d_fh.write("  IF ~PartyHasItem(%s) PartyGoldGT(3999)~ THEN REPLY @3009 DO ~\n" % prev_itm)
  halbaz_d_fh.write("      TakePartyGold(4000) DestroyGold(4000)\n")
  halbaz_d_fh.write("      TakePartyItemNum(%s, 1) DestroyItem(%s)\n" % (prev_itm, prev_itm))
  halbaz_d_fh.write("      GiveItemCreate(\"%s%s\", Player1, 1, 1, 1)\n" % (itm_file_prefix, cur_itm_file_suffix))
  halbaz_d_fh.write("      SetGlobal(\"cu#hal_imbue\", \"GLOBAL\", 1)~ EXIT\n")


def write_halbaz_footer(halbaz_d_fh):
  halbaz_d_fh.write("END\n\n")


def write_thalan_header(thalan_d_fh):
  with open("scripts/thalan.d.template") as thalan_tmpl_fh:
    for line in thalan_tmpl_fh:
      thalan_d_fh.write(line)


def write_thalan_dlg(thalan_d_fh, itm_file_prefix, itm_file_suffix):
  thalan_d_fh.write("\n")
  thalan_d_fh.write("  IF ~PartyHasItem(\"%s001\") PartyGoldGT(1999)~ THEN REPLY @2016 DO ~\n" % itm_file_prefix)
  thalan_d_fh.write("    TakePartyGold(2000) DestroyGold(2000)\n")
  thalan_d_fh.write("    TakePartyItemNum(\"%s001\", 1) DestroyItem(\"%s001\")\n" % (itm_file_prefix, itm_file_prefix))
  thalan_d_fh.write("    GiveItemCreate(\"%s%s\", Player1, 1, 1, 1)\n" % (itm_file_prefix, itm_file_suffix))
  thalan_d_fh.write("    SetGlobal(\"cu#tha_imbue\", \"GLOBAL\", 1)~ EXIT\n")
  

def write_thalan_footer(thalan_d_fh):
  thalan_d_fh.write("END\n\n")


def write_taerom_header(taerom_d_fh):
  with open("scripts/taerom.d.template") as taerom_tmpl_fh:
    for line in taerom_tmpl_fh:
       taerom_d_fh.write(line)


def write_taerom_dlg(taerom_d_fh, itm_file_prefix, wpn_lc_name, say_idx):
  taerom_d_fh.write("\n")
  taerom_d_fh.write("IF ~~ THEN BEGIN cu#tae_%s\n" % wpn_lc_name.replace(" ", "_").replace("-", "_"))
  taerom_d_fh.write("  SAY @%d\n" % say_idx)
  taerom_d_fh.write("  IF ~PartyGoldGT(1799)~ THEN REPLY @1047 DO ~\n")
  taerom_d_fh.write("    TakePartyGold(1800)\n")
  taerom_d_fh.write("    DestroyGold(1800)\n")
  taerom_d_fh.write("    GiveItemCreate(\"%s001\", Player1, 1, 1, 1)\n" % itm_file_prefix)
  taerom_d_fh.write("    SetGlobal(\"cu#custom_weapon\", \"GLOBAL\", 1)~ EXIT\n")
  taerom_d_fh.write("  IF ~!PartyGoldGT(1799)~ THEN REPLY @1048 GOTO cu#tae_lack_funds\n")
  taerom_d_fh.write("  IF ~~ THEN REPLY @1046 EXIT\n")
  taerom_d_fh.write("END\n")


def write_taerom_footer(taerom_d_fh):
  taerom_d_fh.write("END\n\n")


def weapon_plus_modifier(weapon_type, modifier):
  hit_bonus = weapon_type["hit_bonus"] + modifier["hit_bonus"]
  dmg_bonus = weapon_type["dmg_bonus"] + modifier["dmg_bonus"]
  plus = weapon_type | modifier
  plus["hit_bonus"] = hit_bonus
  plus["dmg_bonus"] = dmg_bonus
  return plus


def write_import_header(import_tra_fh):
  import_tra_fh.write("INCLUDE ~customs/lib/2da.tpa~\n")
  import_tra_fh.write("COPY_EXISTING ~IMPORT02.2DA~ ~override~\n")


def write_import_footer(import_tra_fh):
  import_tra_fh.write("  LPF renumber_2da END\n")
  import_tra_fh.write("  PRETTY_PRINT_2DA\n")
  import_tra_fh.write("BUT_ONLY\n")


def write_import_itm(import_tra_fh, prefix, suffix):
  import_tra_fh.write("  INSERT_2DA_ROW 1 2 ~1 %s%s~\n" % (prefix, suffix))


def generate_weapons(items_tpa_fh, items_tra_fh, taerom_d_fh, thalan_d_fh, halbaz_d_fh, import_tra_fh):
  item_name_idx = 1

  # Create the "masterwork" weapons that are forged by Taerom
  for i, weapon_type in enumerate(WEAPON_TYPES):
    wpm = weapon_plus_modifier(weapon_type, EMPTY_MODIFIER)
    write_taerom_dlg(taerom_d_fh, wpm["itm_file_prefix"], wpm["lc_name"], wpm["say_idx"])
    write_item_tpa(items_tpa_fh, wpm["itm_file_prefix"], "001", item_name_idx, item_name_idx + 1, wpm)
    write_item_tra(items_tra_fh, item_name_idx, item_name_idx + 1, wpm)
    item_name_idx += 2

  # Create the enchanted weapons from Thalantyr
  for i, modifier in enumerate(THALAN_MODIFIERS):
    thalan_d_fh.write("\nIF ~~ THEN BEGIN cu#tha_%s\n" % modifier["tag"])
    thalan_d_fh.write("  SAY @%d\n" % modifier["say_idx"])

    for j, weapon_type in enumerate(WEAPON_TYPES):
      wpm = weapon_plus_modifier(weapon_type, modifier)
      write_item_tpa(items_tpa_fh, wpm["itm_file_prefix"], wpm["suffix"], item_name_idx, item_name_idx + 1, wpm)
      write_item_tra(items_tra_fh, item_name_idx, item_name_idx + 1, wpm)
      write_thalan_dlg(thalan_d_fh, wpm["itm_file_prefix"], wpm["suffix"])
      item_name_idx += 2

    thalan_d_fh.write("  IF ~!PartyGoldGT(1999)~ THEN REPLY @2017 GOTO cu#tha_lack_funds\n")
    thalan_d_fh.write("  IF ~~ THEN REPLY @2005 EXIT\n")
    thalan_d_fh.write("END\n")

  # Create the enchanted weapons from Halbazzer Drin
  halbaz_d_fh.write("\nIF ~~ THEN BEGIN cu#hal_imbue\n")
  halbaz_d_fh.write("  SAY @3006\n")
  for i, modifier in enumerate(HALBAZ_MODIFIERS):
    for j, weapon_type in enumerate(WEAPON_TYPES):
      wpm = weapon_plus_modifier(weapon_type, modifier)
      write_item_tpa(items_tpa_fh, wpm["itm_file_prefix"], wpm["suffix"], item_name_idx, item_name_idx + 1, wpm)
      write_item_tra(items_tra_fh, item_name_idx, item_name_idx + 1, wpm)
      write_import_itm(import_tra_fh, wpm["itm_file_prefix"], wpm["suffix"])
      write_halbaz_dlg(halbaz_d_fh, wpm["itm_file_prefix"], wpm["prev_suffix"], wpm["suffix"])
      item_name_idx += 2
  halbaz_d_fh.write("  IF ~!PartyGoldGT(3999)~ THEN REPLY @3007 GOTO cu#hal_lack_funds\n")
  halbaz_d_fh.write("  IF ~~ THEN REPLY @3008 EXIT\n")
  halbaz_d_fh.write("  END\n")


def main():
  items_tpa_fh = open("lib/items.tpa", mode="w+")
  items_tra_fh = open("tra/English/items.tra", mode="w+")

  import_tra_fh = open("lib/imports.tpa", mode="w+")
  write_import_header(import_tra_fh)

  thalan_d_fh = open("dlg/thalan.d", mode="w+")
  write_thalan_header(thalan_d_fh)

  taerom_d_fh = open("dlg/taerom.d", mode="w+")
  write_taerom_header(taerom_d_fh)

  halbaz_d_fh = open("dlg/halbaz.d", mode="w+")
  write_halbaz_header(halbaz_d_fh)

  generate_weapons(items_tpa_fh, items_tra_fh, taerom_d_fh, thalan_d_fh, halbaz_d_fh, import_tra_fh)

  write_halbaz_footer(halbaz_d_fh)
  write_thalan_footer(thalan_d_fh)
  write_taerom_footer(taerom_d_fh)

  write_import_footer(import_tra_fh)


if __name__ == "__main__":
  main()
