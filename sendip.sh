#!/bin/zsh

oldip=''
touch myips

while true; do
    newip=`lynx --dump http://ipecho.net/plain | grep .`
    if [[ $newip != $oldip ]]; then
        echo `date`":$newip" >> myips
        rsync -z myips mi:~/piip.txt
        echo `date`" sended new IP: $newip"
        oldip=$newip
    fi
    sleep 5m
done
