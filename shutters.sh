#!/bin/bash
#This script will compile shutters proof of concept v1.1
echo "6/11/19 Build script for Shutters v1.0.3, Jack Berry"
cd ~
mkdir spacman && cd spacman
git clone https://github.com/Debian/apt.git
wget https://github.com/Kitware/CMake/releases/download/v3.15.0-rc1/cmake-3.15.0-rc1-Linux-x86_64.tar.gz
git clone https://git.dpkg.org/git/dpkg/dpkg.git 
git clone https://github.com/Perl/perl5.git
tar -xvf cmake-3.15.0-rc1-Linux-x86_64.tar.gz
cd cmake-3.15.0-rc1-Linux-x86_64/
export CMAKE_ROOT=~/cmake-3.15.0-rc1-Linux-x86_64/share/cmake-3.15
cd ../perl5
y | ./Configure -des -Dprefix=$HOME/localperl
make test 
sudo make install
cd ../dpkg
./autogen
./configure
make && sudo make install
cmake ../apt
