#!/usr/bin/env bash
#
# ROM compilation script
#
# Copyright (C) 2018-2020 KillerDroid96 
#
# Copyright (C) 2016-2018 Nathan Chancellor
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>

###############
#             #
#  FUNCTIONS  #
#             #
###############

# Source our universal functions script and macOS check
#source $HOME/Github/nathan_scripts/common
source $HOME/Github/Scripts/Linux/Shells/shell_functions


################
#              #
#  PARAMETERS  #
#              #
################

ROM=DU
DEVICE=dumpling
VARIANT=userdebug
ROM_FOLDER=${HOME}/Github
WEB_FOLDER=${HOME}/Github/Uploads
TG=true
TG_MSG_FILE=/tmp/tg-msg.build-rom
SYNC=true
MAKE_TARGET=bacon 
CLEAN_TARGET=true
MERGE=true
#REPOPICK=${1}

function make_command() {
    m "${JOBS_FLAG}" "$@"
}

if [[ ${TG} ]]; then
    {
        echo "\`\`\`"
        echo "Currently Executing..."
        echo "$(basename "${0}") ${PARAMS}"
        echo "\`\`\`"
    } > ${TG_MSG_FILE}
    notify "$(cat ${TG_MSG_FILE})"
fi

###############
#             #
#  VARIABLES  #
#             #
###############

# OUT_FOLDER: Directory that holds the compiled ROM files
# SOURCE_FOLDER: Directory that holds the ROM source
# ZIP_MOVE: Directory to hold completed ROM zips
ZIP_MOVE_PARENT=${WEB_FOLDER} #/Github/Uploads

# Otherwise, define them for our various ROMs
case "${ROM}" in
    "DU"|"aosp"|"du-o8x-caf"|"lineage-15.1|")
        SOURCE_FOLDER=${ROM_FOLDER}/${ROM}
        ZIP_MOVE=${ZIP_MOVE_PARENT}/${ROM}/${DEVICE} ;;
    *)
        die "Unknown ROM \"${1}\" passed!" ;;
esac

OUT_FOLDER=${SOURCE_FOLDER}/out/target/product/${DEVICE}


###########################
# MOVE INTO SOURCE FOLDER #
# AND START TRACKING TIME #
###########################

START=$(date +%s)
clear
cd "${SOURCE_FOLDER}" || die "Source folder does not exist!"

###########################
# SETUP BUILD ENVIRONMENT #
###########################

header "SETTING UP BUILD ENVIRONMENT"

# Check and see if we are on Arch
# If so, activare a virtual environment for proper Python support
[[ -f /etc/arch-release ]] && mkavenv
source build/envsetup.sh
        
#############
# REPO SYNC #
#############

# If the sync is requested, do so
if [[ ${SYNC} ]]; then
    header "SYNCING LATEST SOURCES"; echo
    repo sync "${JOBS_FLAG}" --force-sync -c --no-clone-bundle --no-tags --optimized-fetch --prune
fi

#############
# REPO MERGE #
#############

if [[ ${MERGE} ]]; then
    header "RUNNING MERGE"; echo
    merge_repos
    cd "${SOURCE_FOLDER}" || die "Source folder does not exist!"
fi

##################
# PREPARE DEVICE #
##################

header "PREPARING $(echo ${DEVICE} | awk '{print toupper($0)}')"

# Not all roms use breakfast
case ${ROM} in
    "aosp")
        lunch ${ROM}_${DEVICE}-${VARIANT} ;;
    *)
        breakfast ${DEVICE} ${VARIANT} ;;
esac


############
# REPOPICK #
############

if [[ ${REPOPICK} ]]; then
    header "RUNNING REPOPICK"
    # Execute in a subshell otherwise everything is fubared
    (
    while [[ ${YN} != "n" ]]; do
        read -r -p "Do you have changes to pick? (y/n) " YN
        case ${YN} in
            y|Y)
                read -r -p "Please enter the change number or topic: " PARAMS
                if [[ -n ${PARAMS//[0-9]/} ]]; then
                    repopick -i --topic "${PARAMS}"
                else
                    repopick -i "${PARAMS}"
                fi ;;
            n|N)
                break ;;
        esac
    done
    )
fi

############
# CLEAN UP #
############

header "CLEANING UP OUT DIRECTORY"

case ${CLEAN_TARGET} in
    "true")
        echo "Clean Target" 
        make_command clobber ;;
    "false")
        echo "Dirty Target" 
        make_command "${CLEAN_TARGET}" ;;
    *)
        die "Invalid Parameter" ;;
esac

############
# BUILDING #
############

header "MAKING FILES"; echo

if [[ ${TG} ]]; then
    {
        echo "\`\`\`"
        echo "Build Starting... "
        echo "ROM: ${ROM}"
        echo "Device: ${DEVICE}"
        echo "\`\`\`"
    } > ${TG_MSG_FILE}
    notify "$(cat ${TG_MSG_FILE})"
fi

# Set make_target if unset (not all roms use bacon)
make_command "${MAKE_TARGET}"

# There will be a zip in the out folder if successful
FILES=$(find "${OUT_FOLDER}" -maxdepth 1 -name '*.zip' 2>/dev/null)
if [[ -n ${FILES} ]]; then
    # Make build result string reflect successful compilation
    BUILD_RESULT_STRING="Build Successful"
    SUCCESS=true

    # Make ZIP_MOVE if it doesn't exist or clean it if it does
    if [[ ! -d "${ZIP_MOVE}" ]]; then
        mkdir -p "${ZIP_MOVE}"
    else
        rm -rf "${ZIP_MOVE:?}"/*
    fi

    if [[ $(echo "${FILES}" | wc -l) -eq 1 ]]; then
        mv "${OUT_FOLDER}"/*.zip* "${ZIP_MOVE}"
    else
        for FILE in ${FILES}; do
            if echo "${FILE}" | grep -v -q ota; then
                mv "${FILE}"* "${ZIP_MOVE}"
            fi
        done
    fi
else
    BUILD_RESULT_STRING="BUILD FAILED"
    SUCCESS=false
fi


######################
# ENDING INFORMATION #
######################

# Deactivate virtualenv if we are on arch
[[ -f /etc/arch-release ]] && rmvenv

# Stop tracking time
END=$(date +%s)
TIME_STRING="$(format_time "${START}" "${END}")"

header "${BUILD_RESULT_STRING}!"

# If the build was successful, print file location, and size
if [[ ${SUCCESS} ]]; then
    echo "${GRN}FILE LOCATION: $(web_link "${ZIP_MOVE}")"
    echo "SIZE: $(du -h "${ZIP_MOVE}"/*.zip | awk '{print $1}')${RST}"
fi

# Print the time the script finished
# and how long it took regardless of success
echo "${GRN}TIME: $(date +%D\ %r | awk '{print toupper($0)}')"
echo "${GRN}DURATION: ${TIME_STRING}${RST}"

if [[ ${TG} ]]; then
    {
        echo "\`\`\`"
        echo " ROM: ${BUILD_RESULT_STRING}!" 
        if [[ ${SUCCESS} ]]; then
        echo "LINK: $(web_link "${ZIP_MOVE}") "
        fi
        echo "SIZE: $(du -h "${ZIP_MOVE}"/*.zip | awk '{print $1}')"
        echo "DATE: $(date +%D\ %r | awk '{print toupper($0)}')"
        echo "TIME: ${TIME_STRING,}   "
        echo "\`\`\`"
    } > ${TG_MSG_FILE}
    notify "$(cat ${TG_MSG_FILE})"
fi

echo "\a"