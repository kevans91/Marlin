#!/usr/bin/env bash

PROGRAM_CMD=avrdude
SERIAL_PORT=/dev/cuaU0
FLASH_FILE="flash.hex"
PFLAGS="-C/usr/local/etc/avrdude.conf -v -v -v -v \
	-patmega2560 -cwiring -P${SERIAL_PORT} -b115200 -D \
	-Uflash:w:./${FLASH_FILE}:i"

echo $PFLAGS

if [ ! -f "${FLASH_FILE}" ]; then
	echo "You must place the firmware you want in at ./${FASH_FILE}"
	exit 1
fi

PROGRAM_CMD=`which $PROGRAM_CMD`

if [[ $? != 0 ]]; then
	echo "Programmer ($PROGRAM_CMD) not found"
	exit 1
fi

${PROGRAM_CMD} ${PFLAGS}
