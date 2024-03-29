echo "Beginning package updates"
echo "Updating SET"
cd /pentest/exploits/set && git pull
echo "Updating Metasploit"
cd /pentest/exploits/framework3 && git remote prune origin
git pull && bundle install
echo "Updating Wapiti"
cd /pentest/web/wapiti && svn up
echo "Updating w3af"
cd /pentest/web/w3af && git pull 
echo "Updating Nikto"
cd /pentest/web/nikto && svn up
echo "updating htshells"
cd /pentest/web/htshells && git pull
echo "Updating WPScanner"
cd /pentest/web/wpscan && git pull
echo "Updating Beef"
cd /var/www/beef && sudo git pull
echo "Updating Fierce2"
cd /pentest/enumeration/fierce2 && svn up
echo "Updating Kismet"
cd /pentest/wireless/kismet && git pull
echo "Updating Aircrack Tools"
cd /pentest/wireless/aircrack-ng && svn up
echo "Updating SQL Map"
cd /pentest/database/sqlmap && git pull
echo "Updating DNSMap"
cd /pentest/enumeration/dnsmap && svn up
echo "Updating SQLNinja"
cd /pentest/database/sqlninja && svn up
echo "Updating PHP Shell"
cd /pentest/web/phpshell && svn up
#echo "Updating DNS Enum"
#cd /pentest/enumeration/dnsenum && svn up
echo "Updating Middler"
cd /pentest/exploits/middler && svn up
echo "Updating SIPVicious"
cd /pentest/voip/sipvicious/ && svn up
echo "Updating Wifite"
cd /pentest/wireless/wifite && svn up
echo "Updating nmap - you will need to recompile if needed"
cd /pentest/scanners/nmap && svn up
sudo nmap --script-updatedb
echo "Updating ncat - you will need to recompile if needed"
cd /pentest/scanners/nmap/ncat && svn up
echo "Updating ncrack - you will need to recompile if needed"
cd /pentest/scanners/ncrack && svn up
echo "Updating VA-PT"
cd /pentest/misc/va-pt && svn up
echo "Updating Responder"
cd /pentest/exploits/Responder && git pull
echo "Updating SSL Split"
cd /pentest/web/sslsplit && git pull
echo "Updating netsniff-ng"
cd /pentest/misc/netsniff-ng && git pull
echo "Updating Jboss Autopwn"
cd /pentest/web/jboss-autopwn && git pull
echo "Updating Weape"
cd /pentest/wireless/weape && git pull
echo "Updating smbexec"
cd /pentest/exploits/smbexec && git pull
echo "Updating Veil Catapult"
cd /pentest/exploits/Veil-Catapult && git pull
echo "Updating Veil Evasion"
cd /pentest/exploits/Veil-Evasion && git pull
echo "Updating Veil PowerView"
cd /pentest/exploits/Veil-PowerView && git pull
echo "Updating FruitWifi"
cd /pentest/wireless/fruitwifi && git pull
echo "Updating PCredz"
cd /pentest/passwords/PCredz && git pull
echo "Updating Viproxy"
cd /pentest/voip/viproy && git pull
#
/usr/local/bin/hydra | grep "v7.6"
if [ $? -eq 0 ] ; then
echo "THC Hydra is up to date"
else
echo "THC Hydra is not up to date, updating now."
rm -rf /pentest/enumeration/hydra && /pentest/misc/va-pt/scripts/static.sh
fi
/pentest/enumeration/thc-ipv6/thcping6 | grep "v2.3"
if [ $? -eq 0 ] ; then
echo "THC IPv6 Attack Suite is up to date"
else
echo "THC IPv6 Attack Suite is not up to date, updating now"
rm -rf /pentest/enumeration/thc-ipv6 && /pentest/misc/va-pt/scripts/static.sh
fi
