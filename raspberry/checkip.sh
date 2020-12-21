#!/bin/sh
# myip=$(curl ifconfig.me)
myip="$(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com)" 2> /dev/null || myip="ERROR"  # get current ip
lastIp="$(cat /home/julien/myIp.txt)" # get previous ip
error="$(cat /home/julien/myIpError.txt)" # get number of errors
# echo "${myip}"
# echo "${lastIp}"


if [ "${myip}" != "ERROR" ] ; then
    # no error
    if [ "${error}" != "0" ] ; then 
        # error previously
        echo "0" > /home/julien/myIpError.txt # reset error counter
        echo "No more Errors. The new IP address is: ${myip}" | gpg --encrypt -r juliendiot@ut-biomet.org -r juliendiot42@gmail.com -a | mail -s "IP changed - no more error" juliendiot@ut-biomet.org
    fi

    if [ "${myip}" != "${lastIp}" ] ; then 
    # save new IP, send email
    echo "${myip}" > /home/julien/myIp.txt
    echo "The new IP address is: ${myip}" | gpg --encrypt -r juliendiot@ut-biomet.org -r juliendiot42@gmail.com -a | mail -s "IP changed" juliendiot@ut-biomet.org
    fi

else
    # error
    if [ "${error}" != "0" ] ; then
        # error previously, don't send mail
        error=$((error+1)) # increment error counter
        echo "${error}" > /home/julien/myIpError.txt 
    else
        # no error previously, send mail
        echo "1" > /home/julien/myIpError.txt # reset error counter
        echo "IP address not found, error happend." | gpg --encrypt -r juliendiot@ut-biomet.org -r juliendiot42@gmail.com -a | mail -s "IP changed - ERROR" juliendiot@ut-biomet.org
    fi
fi
exit