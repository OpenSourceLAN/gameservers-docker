#!/bin/bash

set -e

source zip-utils.sh

# [L4D(2)] MultiSlots Improved Version 4.0 (2021/8/25)
# https://forums.alliedmods.net/showpost.php?p=2715546&postcount=249
curl -o l4dmultislots.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=194715&d=1650125518'
unzipAndMoveToDir l4dmultislots.zip "${SOURCEMOD_DIR}/" "l4dmultislots"

# Left 4 DHooks Direct
# https://forums.alliedmods.net/showthread.php?t=321696
curl -o l4dhooks.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=195507&d=1660658623'
unzipAndMoveToDir l4dhooks.zip "${ADDONS_DIR}/"

# L4DToolZ Metamod plugin (l4d1 & l4d2)
# https://forums.alliedmods.net/showpost.php?p=2761018&postcount=1502
curl -o l4dtoolz.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=191943&d=1634657491'
unzipAndMoveToDir l4dtoolz.zip "${LEFT4DEAD2_DIR}/"

# Left 4 Dead 2 - CreateSurvivorBot
# https://forums.alliedmods.net/showthread.php?p=2729883
curl -o CreateSurvivorBot.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=185769&d=1608745336'
unzipAndMoveToDir CreateSurvivorBot.zip "${SOURCEMOD_DIR}/"

# [INC] Multi Colors
# https://forums.alliedmods.net/showthread.php?t=247770
curl -L 'https://github.com/Bara/Multi-Colors/archive/refs/heads/master.zip' > multicolors.zip
unzipAndMoveToDir multicolors.zip "${ADDONS_DIR}/" "Multi-Colors-master/addons"


# Various fixes for 8 player Coop
# Following guide at https://forums.alliedmods.net/showpost.php?p=2756041&postcount=220

# LEFT 4 FIX

# [L4D2]Defib_Fix[Left 4 Fix][11/05/2021]
# https://forums.alliedmods.net/showthread.php?p=2647018
curl -o Defib_Fix.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=189234&d=1620748700'
unzipLzmaAndMoveToDir Defib_Fix.zip "${LEFT4DEAD2_DIR}/"

# [L4D2]Charger_Collision_patch[Left 4 Fix][06/04/2022]
# https://forums.alliedmods.net/showthread.php?t=315482
curl -o Charger_Collision_patch.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=194569&d=1649300386'
unzipLzmaAndMoveToDir Charger_Collision_patch.zip "${ADDONS_DIR}/"

# [L4D & L4D2]Witch fixes[Left 4 Fix]
# https://forums.alliedmods.net/showthread.php?p=2647014
curl -o witchfixes.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=193451&d=1643848983'
unzipLzmaAndMoveToDir witchfixes.zip "${SOURCEMOD_DIR}/" "witch/witch_allow_in_safezone"
unzipLzmaAndMoveToDir witchfixes.zip "${SOURCEMOD_DIR}/" "witch/Witch_Double_Startle_Fix"
unzipLzmaAndMoveToDir witchfixes.zip "${SOURCEMOD_DIR}/" "witch/witch_prevent_target_loss"
unzipLzmaAndMoveToDir witchfixes.zip "${SOURCEMOD_DIR}/" "witch/witch_target_patch"

# [L4D & L4D2]Physics Object Pushfix[Left 4 Fix]
# https://forums.alliedmods.net/showthread.php?p=2705656#post2705656
curl -o physics_object_pushfix.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=183790&d=1600989720'
unzipLzmaAndMoveToDir physics_object_pushfix.zip "${LEFT4DEAD2_DIR}/"

# [L4D1 & L4D2]Survivor_AFK_Fix[Left 4 Fix][25/09/2020]
# https://forums.alliedmods.net/showthread.php?p=2714236
curl -o survivor_afk_fix.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=189803&d=1623834645'
unzipLzmaAndMoveToDir survivor_afk_fix.zip "${LEFT4DEAD2_DIR}/"

# [L4D2] Proper Changelevel [Left 4 Fix] [17/11/2019]
# https://forums.alliedmods.net/showthread.php?p=2669850
curl -o l4d2_levelchanging.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=178784&d=1576565208'
unzipLzmaAndMoveToDir l4d2_levelchanging.zip "${LEFT4DEAD2_DIR}/"

# OTHER FIXES

# [L4D1?/2] 5+ Survivor Friendly Fire Quote Fix
# https://forums.alliedmods.net/showthread.php?t=321127
curl -o SceneAdjustments.smx 'https://www.sourcemod.net/vbcompiler.php?file_id=179550'
mv SceneAdjustments.smx "${SOURCEMOD_PLUGINS_DIR}/"

# [L4D2] Upgrade Pack Fixes
# https://forums.alliedmods.net/showthread.php?t=322824
curl -o lfd_both_fixUpgradePack.smx 'https://www.sourcemod.net/vbcompiler.php?file_id=190948'
mv lfd_both_fixUpgradePack.smx "${SOURCEMOD_PLUGINS_DIR}/"
curl -o upgradepackfix.txt 'https://forums.alliedmods.net/attachment.php?attachmentid=180585&d=1586095821'
mv upgradepackfix.txt "${SOURCEMOD_DIR}/gamedata/"

# Pre-Update Talker
# https://steamcommunity.com/sharedfiles/filedetails/?id=2247536739
curl -o 'myl4d2addons_original_talker.vpk' https://steamusercontent-a.akamaihd.net/ugc/1713043370483788074/0976B1E654208FA422B6B99A4AD1FA23764071FC/
mv myl4d2addons_original_talker.vpk "${ADDONS_DIR}/"

# L4D2-PLUGINS

# https://github.com/fbef0102/L4D2-Plugins
git clone 'https://github.com/fbef0102/L4D2-Plugins'
# L4D2 coop save weapon
# https://github.com/fbef0102/L4D2-Plugins/tree/master/l4d2_ty_saveweapons
moveToDir "L4D2-Plugins/l4d2_ty_saveweapons" "${SOURCEMOD_DIR}"

# [L4D2]Character_manager (1.4.1 - 22/09/2019 )
# https://forums.alliedmods.net/showthread.php?t=309601
curl -o l4d2_character_manager.smx 'https://forums.alliedmods.net/attachment.php?attachmentid=177489&d=1569152696'
mv l4d2_character_manager.smx "${SOURCEMOD_PLUGINS_DIR}/"
curl -o l4d2_character_manager.txt 'https://forums.alliedmods.net/attachment.php?attachmentid=171266&d=1536205521'
mv l4d2_character_manager.txt "${SOURCEMOD_DIR}/gamedata"
curl -o Stripper_passingfix.7z 'https://forums.alliedmods.net/attachment.php?attachmentid=171117&d=1535074649'
un7zipAndMoveToDir Stripper_passingfix.7z "${SOURCEMOD_DIR}/"

# 8 survivors in the rescue vehicle 
# https://forums.alliedmods.net/showpost.php?p=2726779&postcount=38
curl -o 8_survivors_stripper.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=185247&d=1606736574'
unzipAndMoveToDir 8_survivors_stripper.zip "${ADDONS_DIR}/stripper/maps"

# [L4D2] Team Kill Reactions Vocalize Fix
# https://forums.alliedmods.net/showthread.php?p=2273230
curl -o TeamkillReactionsFix.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=143150&d=1426251346'
unzipAndMoveToDir TeamkillReactionsFix.zip "${LEFT4DEAD2_DIR}/"

# [L4D2] Survivor Clones Hunter Pounced Warning Fix
# https://forums.alliedmods.net/showthread.php?p=2202855
curl -o survivor_hunter_pounced_clones_fix.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=138291&d=1411731048'
unzipAndMoveToDir survivor_hunter_pounced_clones_fix.zip "${LEFT4DEAD2_DIR}/"

# [L4D1 & L4D2] HP Laser [v1.0.9 | 14-November-2021]
# https://forums.alliedmods.net/showthread.php?p=2736513
curl -o l4d_hp_laser.smx 'https://www.sourcemod.net/vbcompiler.php?file_id=189361'
mv l4d_hp_laser.smx "${SOURCEMOD_PLUGINS_DIR}/"

# Infected Bots Control Improved Version 2.7.3 (2022/8/18 )
# https://forums.alliedmods.net/showthread.php?p=2699220#post2699220
curl -o l4dinfectedbots.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=196355&d=1660780819'
unzipAndMoveToDir l4dinfectedbots.zip "${SOURCEMOD_DIR}/" "l4dinfectedbots"
