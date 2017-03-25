#!/bin/sh

################################################################################
#
#    filename: rpi-obd2-continue-2.sh
# description: Script to install pyOBD on RPI2/3
#      author: Andre Mattie
#       email: devel@introsec.ca
#         GPG: 5620 A200 6534 B779 08A8  B22B 0FA6 CD54 93EA 430D
#     bitcoin: 1LHsfZrES8DksJ41JAXULimLJjUZJf7Qns
#        date: 03/24/2017
#
################################################################################

# variables
PYSERIAL="python-serial"
BLUETOOTH="bluetooth bluez-utils blueman"
PYDEPS="python-wxgtk2.8 python-wxtools wx2.8-i18n libwxgtk2.8-dev"
GITCORE="git-core"
DIR="`pwd`"

# ensure script is run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "You must be root to run this script"
    exit 1
fi

# Install python-serial
function PYSERIAL {
	apt-get install -y $PYSERIAL
	exit 1
}

# install bluetooth dependencies
function BLUETOOTH {
	apt-get install -y $BLUETOOTH
	exit 1
}

# install extra python packages
function PYDEPS {
	apt-get install -y $PYDEPS
	exit 1
}

# install git
function GITCORE {
	apt-get install -y $GITCORE
	exit 1
}

function CONT2 {
	# add continuation to rc.local
	echo -e "#!/bin/sh -e" > /etc/rc.local
	echo -e "if [ -x $DIR/rpi-obd2-continue-3.sh ]" >> /etc/rc.local
	echo -e "then" >> /etc/rc.local
	echo -e "    sudo xterm -e $DIR/rpi-obd2-continue-3.sh" >> /etc/rc.local
	echo -e "fi" >> /etc/rc.local
	echo -e "exit 0" >> /etc/rc.local
}

# install needed packages
PYSERIAL
BLUETOOTH
PYDEPS
GITCORE

# wait 10sec
wait 10

# run install continuation 2
CONT2

# reboot system
reboot

exit 0