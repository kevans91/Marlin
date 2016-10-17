#!/bin/sh

arduino-builder -verbose -fqbn arduino:avr:mega:cpu=atmega2560 -hardware /usr/local/arduino/hardware  -tools /usr/local/arduino/tools-builder -core-api-version 10612 -libraries /usr/local/arduino/libraries Marlin/Marlin.ino
