if [ ! -d /pentest/cisco/torch ] ; then
echo "Installing Cisco Torch"
cd /pentest/temp && wget http://www.hackingciscoexposed.com/tools/cisco-torch-0.4b.tar.gz
tar zxvf cisco-torch-0.4b.tar.gz && rm -rf cisco-torch-0.4b.tar.gz
mv cisco-torch-0.4b /pentest/cisco/torch
fi
if [ ! -d /pentest/scanners/snmpenum ] ; then
echo "Installing SNMPenum"
cd /pentest/scanners/ && mkdir snmpenum
cd snmpenum && wget http://dl.packetstormsecurity.net/UNIX/scanners/snmpenum.zip
unzip snmpenum.zip && rm -rf snmpenum.zip
chmod 700 snmpenum.pl
fi
if [ ! -d /pentest/web/xsser ] ; then
echo "Installing XSSer"
cd /pentest/temp && wget http://dl.packetstormsecurity.net/UNIX/scanners/xsser_1.5-1.tar.gz
tar zxvf xsser_1.5-1.tar.gz && rm -rf xsser_1.5-1.tar.gz
mv xsser-public/ /pentest/web/xsser && cd /pentest/web/xsser
sudo python setup.py install
fi
if [ ! -d /pentest/web/skipfish ] ; then
echo "Installing skipfish"
cd /pentest/web/ && wget http://skipfish.googlecode.com/files/skipfish-2.10b.tgz
tar zxvf skipfish-2.10b.tgz && rm -rf skipfish-2.10b.tgz
mv skipfish-2.10b skipfish
cd skipfish && make
cp /pentest/web/skipfish/dictionaries/complete.wl /pentest/web/skipfish/dictionaries/skipfish.wl
fi
if [ ! -d /pentest/exploits/windows-tools ] ; then
echo "Installing Windows Tools"
cd /pentest/exploits && mkdir windows-tools
cd windows-tools && wget http://download.sysinternals.com/files/PSTools.zip
unzip PSTools.zip && rm -rf PSTools.zip
wget http://dl.packetstormsecurity.net/groups/checksum/nc.exe
cd /pentest/temp && wget http://www.foofus.net/fizzgig/fgdump/fgdump-2.1.0-exeonly.tar.bz2
bunzip2 fgdump-2.1.0-exeonly.tar.bz2 && rm -rf fgdump-2.1.0-exeonly.tar.bz2
tar xvf fgdump-2.1.0-exeonly.tar && rm -rf fgdump-2.1.0-exeonly.tar
mv Release/fgdump.exe /pentest/exploits/windows-tools/ && rm -rf Release/
wget http://www.tarasco.org/security/dnsfun/dnsfun.zip && unzip dnsfun.zip
rm dnsfun.c dnsfun.zip
fi
if [ ! -f /pentest/enumeration/mdns.py ] ; then
echo "Installing mDNS Scanner"
cd /pentest/enumeration && wget http://www.gnucitizen.org/static/blog/2008/01/mdns.py
cd /pentest/temp && wget http://pybonjour.googlecode.com/files/pybonjour-1.1.1.tar.gz
tar xvf pybonjour-1.1.1.tar.gz && rm -rf pybonjour-1.1.1.tar.gz
cd pybonjour-1.1.1/ && sudo python setup.py install
cd /pentest/temp && sudo rm -rf pybonjour-1.1.1
fi
if [ ! -d /pentest/enumeration/win-enum ] ; then
echo "Installing Windows Enum Tools"
cd /pentest/temp && wget http://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz --no-check-certificate
tar xvf enum4linux-0.8.9.tar.gz && rm -rf enum4linux-0.8.9.tar.gz
mv enum4linux-0.8.9 /pentest/enumeration/win-enum
cd /pentest/temp && wget http://labs.portcullis.co.uk/download/polenum-0.2.tar.bz2 --no-check-certificate
bunzip2 polenum-0.2.tar.bz2 && tar xvf polenum-0.2.tar
rm -rf polenum-0.2.tar && sudo mv polenum-0.2/polenum.py /usr/local/bin/
sudo chmod 755 /usr/local/bin/polenum.py && rm -rf rm -rf polenum-0.2/
fi
if [ ! -d /pentest/database/bsqlbf/ ] ; then
echo "Installing Blind SQL Brute Forcer"
cd /pentest/temp && wget http://dl.packetstormsecurity.net/UNIX/scanners/bsqlbf-v2.1.zip
unzip bsqlbf-v2.1.zip && bsqlbf-v2.1.zip
mv bsqlbf-v2.1/ /pentest/database/bsqlbf
fi
if [ ! -d /pentest/enumeration/thc-ipv6 ] ; then
echo "Installing THC IPv6"
cd /pentest/temp && wget http://dl.packetstormsecurity.net/groups/thc/thc-ipv6-2.7.tar.gz
tar zxvf thc-ipv6-2.7.tar.gz && rm -rf thc-ipv6-2.7.tar.gz
mv thc-ipv6-2.7 /pentest/enumeration/thc-ipv6 && cd /pentest/enumeration/thc-ipv6
make all
fi
if [ ! -d /pentest/database/tnspoison ] ; then
echo "Installing TNS Poison"
cd /pentest/database && mkdir tnspoison
cd tnspoison/ && wget http://www.joxeankoret.com/download/tnspoison.zip
unzip tnspoison.zip && rm -rf tnspoison.zip
fi
if [ ! -d /pentest/enumeration/dnsenum ] ; then
echo "Installing DNSEnum"
mkdir /pentest/enumeration/dnsenum && cd /pentest/enumeration/dnsenum
wget http://dl.packetstormsecurity.net/UNIX/scanners/dnsenum-1.2.3.tar.gz && tar xvf dnsenum-1.2.3.tar.gz
rm -rf dnsenum-1.2.3.tar.gz && rm -rf ._*
fi
if [ ! -d /pentest/web/svn-extractor ] ; then
cd /pentest/temp && wget http://dl.packetstormsecurity.net/UNIX/scanners/svn-extractor-master.zip
unzip svn-extractor-master.zip && mv svn-extractor-master/ /pentest/web/svn-extractor
rm -rf svn-extractor-master*
fi
if [ ! -d /pentest/wireless/fruitywifi ] ; then
cd /pentest/temp && wget https://github.com/xtr4nge/FruityWifi/archive/master.zip
unzip master.zip  && rm -rf unzip master.zip
mv FruityWifi-master/ /pentest/wireless/fruitywifi && cd /pentest/wireless/fruitywifi
sudo ./install-FruityWifi.sh
fi
if [ ! -d /pentest/wireless/freeradius-wpe ] ; then
echo "Installing FreeRADIUS WPE"
cd /pentest/temp && wget ftp://ftp.freeradius.org/pub/radius/old/freeradius-server-2.1.12.tar.bz2
bunzip2 freeradius-server-2.1.12.tar.bz2 && tar xvf freeradius-server-2.1.12.tar
rm -rf tar xvf freeradius-server-2.1.12.tar && mv freeradius-server-2.1.12/ /pentest/wireless/freeradius-wpe
cd freeradius-wpe/ && wget https://raw.github.com/brad-anton/freeradius-wpe/master/freeradius-wpe.patch
patch -p1 < freeradius-wpe.patch && ./configure
make && sudo make install
sudo ldconfig && sudo /usr/local/etc/raddb/certs/bootstrap
fi
if [ ! -f /pentest/enumeration/shodan.pl ] ; then
cd /pentest/enumeration && wget http://dl.packetstormsecurity.net/UNIX/scanners/Shodan_Tool.zip
unzip Shodan_Tool.zip && rm -rf Shodan_Tool.zip
fi
