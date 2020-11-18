#!/bin/bash


#ping_targets="server1 server2 server3 server4 server5"
#ping_targets="ESP-FreezeDryer 10.0.0.214 10.0.0.5"
#failed_hosts=""

#for i in $ping_targets
#do
#   ping -c 1 $i > /dev/null
#   if [ $? -ne 0 ]; then
#      if [ "$failed_hosts" == "" ]; then
#         failed_hosts="$i"
#      else
#         failed_hosts="$failed_hosts, $i"
#      fi
#   fi
#done

#if [ "$failed_hosts" != "" ]; then
#   echo $failed_hosts
#/usr/bin/printf "Hosts: $failed_hosts are down!" | /usr/local/bin/telegram-send --stdin --config /home/tivo/.config/telegram-ESPbot.conf
#fi


#ping_targets="server1 server2 server3 server4 server5"
ping_targets="ESP-FreezeDryer"
failed_hosts=""

for i in $ping_targets
do
   ping -c 1 $i > /dev/null
   if [ $? -ne 0 ]; then
      current=`cat /home/tivo/pingAlerter/id.dat`
      if      [ "$ping_targets" != "$current" ]
         then
 	    /usr/bin/printf "Host: $ping_targets is down!" | /usr/local/bin/telegram-send --stdin --config /home/tivo/.config/telegram-ESPbot.conf
	
      fi
   fi
echo "${ping_targets}" > /home/tivo/kslscrapers/id.dat
done
