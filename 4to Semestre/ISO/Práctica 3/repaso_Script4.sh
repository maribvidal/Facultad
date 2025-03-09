#!/bin/bash

arch="/var/log/avg-service/error.log"

if ! [[ $# -eq 1 && -d $1  ]]; then
        exit 1
fi

while ! [ -f $arch ]; do
        echo "debug"
        sleep 180
done

if [ $(cat $arch | grep -e "FATAL ERROR:" | wc -l) -le 1 ]; then
        tar -cvzf $1/compr.tar /var/log/usr-service
        echo $(cat $arch | wc -l)
        exit 0
fi

exit 1
