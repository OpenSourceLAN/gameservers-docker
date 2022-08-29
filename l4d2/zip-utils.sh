#!/bin/bash

export TEMP_DIR="${LEFT4DEAD2_DIR}/tmp"
mkdir -p "${TEMP_DIR}"

function moveToDir {
    local lWorkingDir=$(pwd)

    local lSource="$1"
    local lDestination="$2"

    echo "rsync from $lSource to $lDestination"

    cd "${lSource}"
    rsync -av --stats --progress . "${lDestination}"
    cd "${lWorkingDir}"

    rm -fr "${lSource}"
}

function unzipAndMoveToDir {
    local lArchive="$1"
    local lDestination="$2"
    local lArchiveDir="$3"

    echo "Unzipping $lArchive/$lArchiveDir to $lDestination"

    if [[ -z "${lArchiveDir}" ]]; then
        unzip -o "${lArchive}" -d "${TEMP_DIR}"
        moveToDir "${TEMP_DIR}" "${lDestination}"
    else
        unzip -o "${lArchive}" "${lArchiveDir}/*" -d "${TEMP_DIR}"
        moveToDir "${TEMP_DIR}/${lArchiveDir}" "${lDestination}"
    fi
}

function un7zipAndMoveToDir {
    local lArchive="$1"
    local lDestination="$2"
    local lArchiveDir="$3"

    echo "Un7zipping $lArchive/$lArchiveDir to $lDestination"

    if [[ -z "${lArchiveDir}" ]]; then
        7za x "${lArchive}" -o"${TEMP_DIR}/"
        moveToDir "${TEMP_DIR}" "${lDestination}"
    else
        7za x "${lArchive}" -o"${TEMP_DIR}" "${lArchiveDir}"
        moveToDir "${TEMP_DIR}/${lArchiveDir}" "${lDestination}"
    fi
}

function unzipLzmaAndMoveToDir {
    local lArchive="$1"
    local lDestination="$2"
    local lArchiveDir="$3"

    echo "Unzipping LZMA $lArchive/$lArchiveDir to $lDestination"

    if [[ -z "${lArchiveDir}" ]]; then
        7za x -tzip -mm=LZMA "${lArchive}" -o"${TEMP_DIR}/"
        moveToDir "${TEMP_DIR}" "${lDestination}"
    else
        7za x -tzip -mm=LZMA "${lArchive}" -o"${TEMP_DIR}" "${lArchiveDir}"
        moveToDir "${TEMP_DIR}/${lArchiveDir}" "${lDestination}"
    fi
}
