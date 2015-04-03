#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <locationcode>
#
#(c) Michael Seiler 2007

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
ICAO=CYYZ
URL=http://weather.noaa.gov/pub/data/observations/metar/decoded/$ICAO.TXT
TMP_FILE=/tmp/local_weather.txt
#if [ -z $1 ]; then
#    echo
#    echo "USAGE: weather.sh <locationcode>"
#    echo
#    exit 0;
#fi


curl -s $URL  > $TMP_FILE


if [ "$1" = "temp" ]; then
	echo `grep "^Temperature" $TMP_FILE | grep "[0-9]\{2\} C" -o`
elif [ "$1" = "weather" ]; then
	echo `grep "^Weather" $TMP_FILE | cut -c 10-`
fi


