#!/bin/bash
##
## Simple script to enumerate PTR DNS records pointing to internal IPs on a LAN
##
## 192.168.x.x
for i in {1..255}
do
	for j in {1..255}
	do
		host "192.168.$i.$j"  | grep pointer | awk -v awki="$i" -v awkj="$j" -F' ' '{print "192.168."awki"."awkj" " $5}' &
	done
done
wait
## 172.16.x.x - 172.31.x.x
for h in {16..31}
do
	for i in {1..255}
	do
        	for j in {1..255}
	        do
        	        host "172.$h.$i.$j"  | grep pointer | awk -v awkh="$h" -v awki="$i" -v awkj="$j" -F' ' '{print "172."awkh"."awki"."awkj" " $5}' &
	        done
	done
	wait
done
## 10.x.x.x
for h in {1..255}
do
        for i in {1..255}
        do
                for j in {1..255}
                do
                        host "10.$h.$i.$j"  | grep pointer | awk -v awkh="$h" -v awki="$i" -v awkj="$j" -F' ' '{print "10."awkh"."awki"."awkj" " $5}' &
                done
        done
        wait
done
