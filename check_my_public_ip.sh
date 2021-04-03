#!/bin/bash

# OLD_IP_FILE=/home/pi/old_ip.txt
IP_FILE=/home/pi/public_ip.txt



current_ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

printf -v currentDate '%(%A, %m-%d-%Y)T' -1
printf -v currentTime '%(%H:%M)T' -1
subject="IP adress on $currentDate at $currentTime"

# calling "echo" with sigle arrow will erase the old content of the file and write the new one
# calling "echo" with double arrow (>>) will append the new content at the end of the file
if [ -f "$IP_FILE" ]; then
	DIFF=$(diff $IP_FILE <(echo "$current_ip"))

	if [ "$DIFF" != "" ]; then
		echo "$current_ip" > $IP_FILE
		echo "sending mail ..."
		mail -s "$subject" godelc7@gmail.com < $IP_FILE
	elif [ "$DIFF" = "" ]; then
		:
	else
		:
	fi
else
	echo "$current_ip" > $IP_FILE
fi

