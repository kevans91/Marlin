#!/usr/bin/env bash

set -xe

SKETCH_PATH="Marlin/Marlin.ino"
OUTPUT_BINARY=flash.hex
BUILD_OPTIONS=/usr/local/arduino/arduino-builder.options
BUILD_PATH=build

BUILD_PATH=$(realpath "${BUILD_PATH}")
SKETCH_NAME=$(basename "${SKETCH_PATH}")
SKETCH_BINARY=${BUILD_PATH}/${SKETCH_NAME}.hex

if [ ! -d ${BUILD_PATH} ]; then
	mkdir -p ${BUILD_PATH}
fi

arduino-builder -verbose -fqbn arduino:avr:mega:cpu=atmega2560 -build-path ${BUILD_PATH}  -build-options-file ${BUILD_OPTIONS} -libraries /usr/local/arduino/libraries ${SKETCH_PATH}

mv ${SKETCH_BINARY} ${OUTPUT_BINARY}
