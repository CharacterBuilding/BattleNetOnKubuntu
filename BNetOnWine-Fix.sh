#!/usr/bin/bash
## Ensure that the Script EXITS abruptly on ANY Error
set -e

## Expected Defaults
BNET_INST_LOC=~/.wine/drive_c/Program\ Files\ \(x86\)/Battle.net/
BNET_INST_FOLDER_PREF="Battle.net.*"
BNET_NON_VER_IGNORE="Battle.net.exe"
BNET_PLATFORM_DIR="platforms"
BNET_BROKEN_DLL="qwindows.dll"

## Get the latest BattleNet Platform Version Directory
cd "${BNET_INST_LOC}"

BNET_LATEST_DIR=`ls -d Battle.net.* | grep -v -e "Battle.net.exe" | awk 'END { print; }'`
BNET_DLL_FP="${BNET_INST_LOC}${BNET_LATEST_DIR}/${BNET_PLATFORM_DIR}/${BNET_BROKEN_DLL}"

## Run 'setattr' on the Broken DLL File
`setfattr -x user.DOSATTRIB "${BNET_DLL_FP}"`

## If we got here we did it, Shout it out!
echo "Successfully Updated the {{${BNET_BROKEN_DLL}}}! Attempt to launch BattleNet again."
