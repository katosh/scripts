#!/bin/zsh

oldip=''
touch myips

while true; do
    newip=`lynx --dump http://ipecho.net/plain | xargs`
    if [[ $newip != $oldip ]]; then
        echo `date`": $newip" >> myips
        rsync -z myips mi:~/piip.txt
        rsync -z myips zedat:~/public_html/piip.txt
        echo `date`" sended new IP: $newip"
        oldip=$newip
    fi
    sleep 5m
done
