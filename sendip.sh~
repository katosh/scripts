#!/bin/zsh

oldip=''
touch myips
touch mylastip

while true; do
    newip=`lynx --dump http://ipecho.net/plain | xargs`
    if [[ $newip != $oldip ]]; then
        echo `date`": $newip" >> myips
        rsync -z myips mi:~/piip.txt
        rsync -z myips zedat:~/piip.txt
        # when it really is an IP
        if echo $newip | grep '^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$' &>/dev/null; then
            echo $newip > mylastip
            rsync -z mylastip zedat:~/public_html/piip.txt
        fi
        #echo `date`" sended new IP: $newip"
        oldip=$newip
    fi
    sleep 10m
done
