#!/bin/sh
# Weather tool for conky
#USAGE: get_weather.sh <field>
#(c) Calvin Lobo 2015

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
ICAO=CYYZ
URL=http://weather.noaa.gov/pub/data/observations/metar/decoded/$ICAO.TXT
TMP_FILE=/tmp/local_weather.txt
curl -s $URL  > $TMP_FILE


if [ "$1" = "temp" ]; then
	echo `grep "^Temperature" $TMP_FILE | grep "[0-9]* C" -o`
elif [ "$1" = "weather" ]; then
	echo `grep "^Weather" $TMP_FILE | cut -c 10-` `grep "^Sky conditions:" $TMP_FILE | cut -c 17-`
elif [ "$1" = "all" ]; then
	echo `cat $TMP_FILE`
fi


