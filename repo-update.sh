#!/bin/bash
#
# Copyright (c) 2015 Igor Pecovnik, igor.pecovnik@gma**.com
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.
#
# This file is a part of tool chain https://github.com/igorpecovnik/lib
#

# This script recreates deb repository from files in directory POT
#
# each file is added 2 times! jessie-xenial
#
# We are using this only for kernel, firmware, root changes, headers


[[ -f "../userpatches/lib.config" ]] && source "../userpatches/lib.config"

POT="../output/debs/"

# load functions
source general.sh

# run repository update
addtorepo

# add a key to repo
cp bin/armbian.key ../output/repository/public
cd ../output/repository/public

# add SSH key to root
mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5ghcl4qRClulj3KM4pZfKrUfB0m1DB5XVwRNbQARYEs5aAMJ/zrS1MF0lvEmcd614mq/qtp4xagAyVwg2FaqifaNlxdw1cMjfbhjLr2hHUvk8uRjQRb2mhq1/Xls3XcQGC7XNQ0+63gir44TPghtvHb84Tjh2Lh3jhjP/z9kcBa6EN8lrg0DYp36+wrV2OTj+kWOxiKK33gzD5TCtkjbcBrLq5bZmfA7vniDT7Adpw5RhRBqomynbC5CuJYUThg/m44bq0FB6gIV5pagARJLE/F6Eht1M+K/Cl38XYip8YUL3zQ3P0BVydxO/F1z5S2qnwgAS4pYtaYJGpDFETEAF allen@ubuntu-builder' | cat >> /root/.ssh/authorized_keys

echo "done."
