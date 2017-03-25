#!/bin/sh

################################################################################
#
#    filename: rpi-obd2-continue-3.sh
# description: Script to install pyOBD on RPI2/3
#      author: Andre Mattie
#       email: devel@introsec.ca
#         GPG: 5620 A200 6534 B779 08A8  B22B 0FA6 CD54 93EA 430D
#     bitcoin: 1LHsfZrES8DksJ41JAXULimLJjUZJf7Qns
#        date: 03/24/2017
#
################################################################################

# ensure script is run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "You must be root to run this script"
    exit 1
fi

function RMCONT {
	echo -e "#!/bin/sh -e" > /etc/rc.local
	echo -e "#" >> /etc/rc.local
	echo -e "# rc.local" >> /etc/rc.local
	echo -e "#" >> /etc/rc.local
	echo -e "# This script is executed at the end of each multiuser runlevel." >> /etc/rc.local
	echo -e "# Make sure that the script will "exit 0" on success or any other" >> /etc/rc.local
	echo -e "# value on error." >> /etc/rc.local
	echo -e "#" >> /etc/rc.local
	echo -e "# In order to enable or disable this script just change the execution" >> /etc/rc.local
	echo -e "# bits." >> /etc/rc.local
	echo -e "#" >> /etc/rc.local
	echo -e "# By default this script does nothing." >> /etc/rc.local
	echo -e "exit 0" >> /etc/rc.local
}

RMCONT

# cd to home
cd ~

# clone pyobd git repo
git clone https://github.com/Pbartek/pyobd-pi.git

exit 0