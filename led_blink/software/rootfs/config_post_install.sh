#!/bin/bash -x

# apt sources
# uncomment the "deb" lines (no need to uncomment "deb src" lines)

# Edit the "/etc/apt/sources.list" file to configure the package manager. This
# file contains a list of mirrors that the package manager queries. By default,
# this file has all fields commented out, so the package manager will not have
# access to any mirrors. The following command uncomments all commented out
# lines starting with "deb". This contain the mirrors we are interested in.
sudo perl -pi -e 's/^#+\x+\s+(deb\s+http)/$1/g' "/etc/apt/sources.list"

# When writing our linux applications, we want to use ARM DS-5's remote
# debugging feature to automatically transfer our binaries to the target device
# and to start a debugging session. The remote debugging feature requires an SSH
# server and a remote dgb server to be available on the target. These are easy
# to install as we havea package manager available
sudo apt update
sudo apt -y install ssh gdbserver

# Allow root SSH login with passowrd (needed so we can use ARM DS-5 for remote
# debugging)
sudo perl -pi -e 's/^(PermitRootLogin) with-password$/$1 yes/g' "/etc/ssh/sshd_config"

