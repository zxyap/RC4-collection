#!/bin/bash

#parameters
n="$1" #number of the times a website needs to be captured
TIMEOUT="$2" #capture for $TIMEOUT seconds
SLEEP=$(($2+10))
TOTAL=$(wc -l < ip.txt) #insert text file with all ip.addrs
BROWSERPATH=/root/Desktop/firefox-35.0b8/firefox/firefox

#kill the processes if alive
ps -ef | grep capture | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep firefox | grep -v grep | awk '{print $2}' | xargs kill -9	

for ((i=1; i<=$TOTAL; i++))
do
	for((j=1; j<=n; j++))
	do
		url=$(sed -n ${i}p domain.txt) #domain.txt contains all the urls 
		ip=$(sed -n ${i}p ip.txt) #ip.txt contains all the corresponding ip addresses
		sed -i "/var url/ c\var url = '$url'" request.js
		python3 capture.py $ip $i $j $TIMEOUT&
		#ensures that the python capture starts first
		sleep 5 
		$BROWSERPATH rc4.html&
		#let it capture for $SLEEP seconds before forcefully killing it
		sleep $SLEEP
		ps -ef | grep capture | grep -v grep | awk '{print $2}' | xargs kill -9
		ps -ef | grep firefox | grep -v grep | awk '{print $2}' | xargs kill -9
	done
done