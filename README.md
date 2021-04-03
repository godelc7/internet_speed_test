# Various scripts
This repo contains different scripts I use for automating various tasks on my raspberry pi.

### Internet speed test
A python script to measure the internet speed using the speedtest.net API and save the results in a .csv file in the home folder
This script works in Windows and Linux.

1. Usage
    ```bash
    $ python internetSpeedtest.py
    ```

### Update pi OS(raspbian) and pihole
A small bash script for automating the update of the OS and pihole
1. Usage
    ```bash
    $ bash update_OS_and_pihole.sh
    ```

### Check public IP address
Since the public IP is always changing, I implemented a small bash script to check the actual public ip address and
email me the actual one if it has changed since the last check.
1. Usage
    ```bash
    $ bash check_my_public_ip.sh
    ```


### Automating
The task can be easily automated using cron jobs:
1. Open crontab with
    ```bash
    $ crontab -e
    ```
Insert the following text at the end of the opening file:

0   *       *       *       *       bash internetSpeedtest.py    > /dev/null 2>&1

0   *       *       *       *       bash update_OS_and_pihole.sh > /dev/null 2>&1

0   *       *       *       *       bash check_my_public_ip.sh   > /dev/null 2>&1


Here by the script will be started every day each hour.
