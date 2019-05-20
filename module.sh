#!/bin/bash
# sqlme module instalation
clear
echo "mohon tunggu installasi module membutuhkan waktu yang panjang mungkin kurang lebih 15mnt"
sleep 5
clear
echo "STARTING INSTALLING MODULE PERL IN SYSTEM"
apt-get update -y
apt-get upgrade -y
if [[ -d "/usr/bin/" ]]; then
	if [[ $EUID -ne 0 ]]; then
		echo "Your must be run as root"
	else
		apt-get install perl -y
		cpan install LWP::UserAgent
		cpan install Term::ANSIColor
	fi

elif [[ -d "/data/data/com.termux/" ]]; then
		apt-get install perl -y
		apt-get install -y autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk grep gzip libtool make patch perl sed silversearcher-ag tar wget
		cpan install LWP::UserAgent
		cpan install Term::ANSIColor
else
	exit
fi
