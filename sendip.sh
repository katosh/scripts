#!/bin/zsh

oldip=''
touch myips
touch mylastip

while true; do
    newip=`lynx --dump http://ipecho.net/plain | xargs`
    if [[ $newip != $oldip ]]; then
        echo `date`": $newip" >> myips
        echo $newip > mylastip
        rsync -z myips mi:~/piip.txt
        rsync -z myips zedat:~/piip.txt
        rsync -z mylastip zedat:~/public_html/piip.txt
        echo `date`" sended new IP: $newip"
        oldip=$newip
    fi
    sleep 5m
done
