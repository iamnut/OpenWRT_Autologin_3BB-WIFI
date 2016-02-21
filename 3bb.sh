#!/bin/ash 

USERNAME=yourusername
PASSWORD=yourpassword

CHECKHOST=8.8.8.8

while true ; do

	uci show wireless | grep -q 3BB_WiFi > /dev/null2>&1
	IS3BB=$?

	ping -W 3 -c 1 $CHECKHOST > /dev/null2>&1
	RETVAL=$?

	if [[ $IS3BB -ne 1 && $RETVAL -ne 0 ]]; then
		curl --data "dst=http://status.3bbwifi.com&popup=true&username=$USERNAME&password=$PASSWORD" http://192.168.182.1/login
		sleep 5
	fi
	
	sleep 3

done
