#!/bin/bash

LOG_FILE=/home/pi/update_log.txt


# --- update OS ---
sudo apt update
sudo apt upgrade -y

# --- update pi hole and gravity database ---
echo "Updating pi hole ..."
/usr/local/bin/pihole -up
echo "Updating gravity data base ..."
/usr/local/bin/pihole -g

# --- log to file ---
printf -v currentDate '%(%A, %m-%d-%Y)T' -1
printf -v currentTime '%(%H:%M)T' -1
log_text="Update successfully executed on $currentDate  at  $currentTime"


# calling "echo" with single arrow (>)  will erase the old content of the file and write the new one in the file
# calling "echo" with double arrow (>>) will append the new content at the end of the file
echo "$log_text" > $LOG_FILE
