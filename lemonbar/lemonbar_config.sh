#!/usr/bin/bash

Clock(){
	TIME=$(date "+%H:%M")
	echo -e -n " \uf017 ${TIME}"
}

Cal() {
    DATE=$(date "+%a, %Y-%m-%d")
    echo -e -n "\uf073 ${DATE}"
}

Battery() {
	BATPERC=$(acpi --battery | cut -d, -f2 | tr '\n' ' ')

	echo -e "\uf240 $BATPERC"
}

Wifi(){
	WIFISTR=$( iwconfig wlan0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlan0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo -e "\uf1eb ${ESSID}"
		fi
	fi
}

Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "\uf028 ${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "\uf027 ${VOL}%"
		else
			echo -e "\uf026 ${VOL}%"
		fi
	else
		echo -e "\uf026 M"
	fi
}

while true; do
	echo -e "%{r}$(Wifi)  $(Battery)  $(Sound)  $(Clock) $(Cal)"
	sleep 1s
done
