#!/usr/bin/env bash

set -e

OPERATION="packer build"

# set options
if [ -x "${INPUT_OPTIONS}" ]; then
  OPERATION="${OPERATIONS} ${INPUT_OPTIONS}"
fi

# set var file
if [ -z "${INPUT_VARFILE}" ]; then
  OPERATION="${OPERATION} --var-file=${INPUT_VARFILE}"
fi

# switch directory
if [ -z "${INPUT_WORKINGDIRECTORY}"]; then
  echo "::debug:: Switching working directory: ${INPUT_WORKINGDIRECTORY}"
  cd ${INPUT_WORKINGDIRECTORY}
fi

# execute packer build
echo "::debug:: Executing command: ${OPERATION}"

# shellcheck disable=SC2086
${OPERATION} "${INPUT_TEMPLATEFILE}"