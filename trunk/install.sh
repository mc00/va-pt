!/bin/bash
if [[ $EUID -eq 0 ]]; then
echo "This script must not be run as root.." 1>&2
exit 1
fi
if [ ! -f /etc/network/if-up.d/ntpdate ] ; then
sudo ntpdate time.nist.gov
fi
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
clear
if [ ! -d /pentest ] ; then
sudo mkdir /pentest
sudo chown -R $USER /pentest && chgrp -R $USER /pentest
fi
#[ ! -d /pentest ] && mkdir /pentest
[ ! -d /pentest/temp ] && mkdir /pentest/temp
[ ! -d /pentest/wireless ] && mkdir /pentest/wireless
[ ! -d /pentest/exploits ] && mkdir /pentest/exploits
[ ! -d /pentest/exploits/exploitdb ] && mkdir /pentest/exploits/exploitdb
[ ! -d /pentest/web ] && mkdir /pentest/web
[ ! -d /pentest/scanners ] && mkdir /pentest/scanners
[ ! -d /pentest/misc ] && mkdir /pentest/misc
[ ! -d /pentest/enumeration ] && mkdir /pentest/enumeration
[ ! -d /pentest/voip ] && mkdir /pentest/voip
[ ! -d /pentest/database ] && mkdir /pentest/database
[ ! -d /pentest/passwords ] && mkdir /pentest/passwords
# moved to enum [ ! -d /pentest/dns ] && mkdir /pentest/dns
[ ! -d /pentest/fuzzers ] && mkdir /pentest/fuzzers
[ ! -d /pentest/spoofing ] && mkdir /pentest/spoofing
[ ! -d /pentest/cisco ] && mkdir /pentest/cisco
[ ! -d /pentest/tunneling ] && mkdir /pentest/tunneling
[ ! -d /pentest/audit ] && mkdir /pentest/audit
[ ! -d /pentest/misc/vapt ] && mkdir /pentest/misc/vapt
[ ! -d /pentest/misc/vapt/scripts ] && mkdir /pentest/misc/vapt/scripts

cp -uRf * /pentest/misc/vapt/

selection=
until [ "$selection" = "0" ]; do
     echo ""
     echo "|\     /|(  ___  )       (  ____ )\__   __/"
     echo "| )   ( || (   ) |       | (    )|   ) (   "
     echo "| |   | || (___) | _____ | (____)|   | |   "
     echo "( (   ) )|  ___  |(_____)|  _____)   | |   "
     echo " \ \_/ / | (   ) |       | (         | |   "
     echo "  \   /  | )   ( |       | )         | |   "
     echo "   \_/   |/     \|       |/          )_(   "
     echo ""
     echo "The Vulnerability Assessment and Penetration Testing Toolkit"
     echo ""
     echo "VA/PT PROGRAM MENU"
     echo "1 - Install Dependencies"
     echo "2 - Install SVN Toolkits"
     echo "3 - Install Static Code Software"
     echo "4 - Install/Update Exploit Code Repositories"
     echo "5 - Install/Update wordlist Repositories"
     echo "6 - Install/Update Vulnerability/Exploit Databases"
     echo "7 - Update all tool packages"
     echo "8 - Start all services"
     echo "9 - Install Firefox Extensions"
     echo ""
     echo "0 - Exit program"
     echo ""
     echo -n "Enter Selection:"
     read selection
     echo ""
     case $selection in
         1 ) /pentest/misc/vapt/scripts/deps.sh;;
         2 ) /pentest/misc/vapt/scripts/svn.sh;;
         3 ) /pentest/misc/vapt/scripts/static.sh;;
         4 ) /pentest/misc/vapt/scripts/exploits.sh;;
         5 ) /pentest/misc/vapt/scripts/wordlists.sh;;
         6 ) /pentest/misc/vapt/scripts/db-update.sh;;
         7 ) /pentest/misc/vapt/scripts/update-tools.sh;;
         8 ) /pentest/misc/vapt/scripts/services.sh;;
         9 ) /pentest/misc/vapt/scripts/firefox-extensions.sh;;
         0 ) exit;;
         * ) echo "Please enter your selection"
     esac
done