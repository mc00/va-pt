#Raspberry PI SVN Installer
if [ ! -d /pentest/misc/proxmark3-r651 ] ; then
echo "Installing Proxmark 3 Reader Software"
cd /pentest/misc && svn co http://proxmark3.googlecode.com/svn/trunk@r651 proxmark3-r651
cd proxmark3-r651 && make client
fi
#
if [ ! -d /pentest/scanners/nmap ] ; then
echo "Installing and compiling nmap"
cd /pentest/scanners && svn co https://svn.nmap.org/nmap nmap
cd /pentest/scanners/nmap && ./configure --without-zenmap
make && sudo make install
fi
if [ ! -d /pentest/scanners/ncrack ] ; then
echo "Installing and compiling ncrack"
cd /pentest/scanners && svn co https://svn.nmap.org/ncrack ncrack
cd /pentest/scanners/ncrack && ./configure
make && sudo make install
fi
if [ ! -d /pentest/exploits/framework3 ] ; then
echo "Installing Metasploit"
cd /pentest/exploits && git clone https://github.com/rapid7/metasploit-framework.git framework3
sudo bundle install
fi
if [ ! -d /pentest/exploits/set ] ; then
echo "Installing the Social Engineering Toolkit"
cd /pentest/exploits && git clone https://github.com/trustedsec/social-engineer-toolkit/ set
cd set && sudo python setup.py install
fi
if [ ! -d /pentest/web/w3af ] ; then
echo "Installing w3af"
cd /pentest/web && git clone https://github.com/andresriancho/w3af.git w3af 
sudo pip install PyGithub GitPython pybloomfiltermmap esmre pdfminer futures guess-language cluster msgpack-python python-ntlm clamd xdot
sudo pip install -e git+git://github.com/ramen/phply.git#egg=phply
fi
if [ ! -d /pentest/web/nikto ] ; then
echo "Installing Nikto"
cd /pentest/web && svn co http://svn2.assembla.com/svn/Nikto_2/trunk nikto
fi
if [ ! -d /pentest/web/joomscan ] ; then
echo "Instaling Joomla Scanner"
cd /pentest/web/ && svn checkout svn://svn.code.sf.net/p/joomscan/code/trunk joomscan
cd /pentest/web/joomscan/ && chmod 755 joomscan.pl
fi
if [ ! -d /pentest/database/sqlmap ] ; then
echo "Installing SQL Map"
cd /pentest/database && git clone https://github.com/sqlmapproject/sqlmap.git
fi
if [ ! -d /pentest/database/sqlninja ] ; then
echo "Installing SQL Ninja"
cd /pentest/database && svn checkout http://svn.code.sf.net/p/sqlninja/code/ sqlninja
fi
if [ ! -d /pentest/web/phpshell ] ; then
echo "Installing PHP Shell"
cd /pentest/web && svn checkout svn://svn.code.sf.net/p/phpshell/code/trunk phpshell
fi
if [ ! -d /pentest/web/htshells ] ; then
echo "Installing htshells"
cd /pentest/web && git clone git://github.com/wireghoul/htshells.git
fi
if [ ! -d /pentest/enumeration/dnsenum ] ; then
echo "Installing DNSenum"
cd /pentest/enumeration && svn checkout http://dnsenum.googlecode.com/svn/trunk/ dnsenum
fi
if [ ! -d /pentest/web/wpscan ] ; then
echo "Installing Wordpress Scanner"
cd /pentest/web && git clone https://github.com/wpscanteam/wpscan.git
sudo bundle install --without test development
fi
if [ ! -f /usr/local/bin/smbclient.py ] ; then
echo "Installing Impacket"
cd /pentest/temp && svn checkout http://impacket.googlecode.com/svn/trunk/ impacket
cd impacket && sudo python setup.py install
cd /pentest/temp && sudo rm -rf impacket
fi
if [ ! -d /pentest/passwords/ntlmsspparse ] ; then
echo "Installing NTLMS Parse"
cd /pentest/passwords && git clone https://github.com/psychomario/ntlmsspparse.git
fi
if [ ! -d /pentest/enumeration/ptscripts ] ; then
echo "Installing recon-ng"
cd /pentest/enumeration && svn checkout http://ptscripts.googlecode.com/svn/trunk/ ptscripts
fi
if [ ! -d /pentest/exploits/Responder ] ; then
echo "Installing Spiderlabs Resonder"
cd /pentest/exploits/ && git clone https://github.com/SpiderLabs/Responder.git
fi
if [ ! -d /pentest/enumeration/groupenum ] ; then
echo "Installing Spiderlabs groupenum"
cd /pentest/enumeration/ && git clone https://github.com/SpiderLabs/groupenum.git
fi
if [ ! -d /pentest/misc/netsniff-ng ] ; then
echo "Installing Netsniff-ng"
cd /pentest/misc && git clone git://github.com/borkmann/netsniff-ng.git
fi
if [ ! -d /pentest/wireless/wifite/ ] ; then
echo "Installing Wifitie"
cd /pentest/wireless && svn checkout http://wifite.googlecode.com/svn/trunk/ wifite
fi
if [ ! -d /pentest/wireless/kismet ] ; then
echo "Installing Kismet"
cd /pentest/wireless && git clone https://www.kismetwireless.net/kismet.git
cd /pentest/wireless/kismet
./configure && make dep
make && sudo make install
fi
if [ ! -d /pentest/wireless/aircrack-ng ] ; then
echo "Installing Aircrack-NG"
cd /pentest/wireless && svn co http://svn.aircrack-ng.org/trunk/ aircrack-ng
cd aircrack-ng && make
sudo make install && sudo airodump-ng-oui-update
fi
if [ ! -d /pentest/enumeration/fierce2 ] ; then
echo "Installing Fierce2"
cd /pentest/enumeration && svn co https://svn.assembla.com/svn/fierce/fierce2/trunk/ fierce2
cd fierce2 && sudo cpanm --installdeps .
perl Makefile.PL && make
sudo make install
fi
if [ ! -d /var/www/beef/.git/ ] ; then
echo "Installing Beef"
cd /var/www && sudo git clone https://github.com/beefproject/beef.git
fi
if [ ! -d /pentest/exploits/middler ] ; then
echo "Installing Middler"
cd /pentest/exploits && svn checkout http://middler.googlecode.com/svn/trunk/ middler
fi
if [ ! -d /pentest/web/sslsplit ] ; then
echo "Installing SSL Split"
cd /pentest/web && git clone https://github.com/droe/sslsplit.git
cd sslsplit && make
sudo make install
fi
cp /pentest/misc/va-pt/tools/copy-router-config.pl /pentest/cisco/
cp /pentest/misc/va-pt/tools/merge-router-config.pl /pentest/cisco/
cp /pentest/misc/va-pt/tools/dnsrecon.rb /pentest/enumeration/
