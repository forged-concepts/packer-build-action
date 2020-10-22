#!/usr/bin/env bash

set -e

# switch directory
cd "${INPUT_WORKINGDIRECTORY:-.}"

OPERATION="packer build"

# set options
if [ -n "${INPUT_OPTIONS}" ]; then
  OPERATION="${OPERATIONS} ${INPUT_OPTIONS}"
fi

# set var file
if [ -n "${INPUT_VARFILE}" ]; then
  OPERATION="${OPERATION} -var-file=${INPUT_VARFILE}"
fi

# execute packer build
echo "::debug:: Executing command: ${OPERATION} ${INPUT_TEMPLATEFILE}"

# shellcheck disable=SC2086
${OPERATION} "${INPUT_TEMPLATEFILE}"