# Introduction #

This project aims to offer a portable set of tools used during the course of vulnerability assessment and penetration tests. The tool set and vulnerability database are based on the Ubuntu Linux distribution. This will create a Backtrack/Samurai WTF type environment on your Ubuntu 10/11 system.

Included in the SVN checkout is the PHP based vulnerability search portal which will allow you to search for vulnerabilities through common databases such as NVD and OSVDB, as well as available exploits from exploitdb. All of the noted databases are loaded into the local database during kit installation.

# Details #

Run the install.sh script first. This will create the needed directories for the package.

Run the "Install Dependencies" option. Depending on whether you are running this on a fresh install or not, some portions may need some manual assistance for the install to complete such as Math-Pari perl (this will be corrected soon).

After the dependencies have been installed, run the remaining SVN/Static options to install the remainder of the code.

My recommended firefox plugins can be installed using the "Install Firefox Extensions" option.