#!/bin/bash
echo `date`
mem_threshold='10'
mem_usage () {

 #MB units
#mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
mem_usage=`free -m | awk 'NR==2 {printf $3*100/$2}' | cut -f 1 -d "."`
if [ $mem_usage -gt $mem_threshold ]
    then
        
        echo "mem warning!!!"
        echo "memory usages high :$mem_usage%"
        echo "Sending mail to Master Node "
        echo "Memory usages is high $mem_usage%" | mail -s "Memory Usages Alert" root@server.example.com
    else
        echo "memory usages :$mem_usage%"      
       echo "mem ok!!!"
fi
}
mem_usage
