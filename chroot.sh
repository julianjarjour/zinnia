#!/bin/bash
set -euxo pipefail

username='toni'
hostname='alexander'
timezone='America/New_York'
locale='en_US'
cpucode='amd'
espboot='boot'
rootlabel='ARCH_LINUX'
interface='enp4s0'
kernel='linux-zen'

ln -sf "/usr/share/zoneinfo/${timezone}" "/etc/localtime"
hwclock --systohc
echo "${locale}.UTF-8 UTF-8" > "/etc/locale.gen"
locale-gen
echo "LANG=${locale}.UTF-8" > "/etc/locale.conf"
echo "${hostname}" > "/etc/hostname"
useradd -m -U "${username}"
cat > "/etc/security/access.conf" << EOF
+:root:LOCAL
+:${username}:LOCAL
-:ALL:ALL
EOF
bootctl install
cat > "/${espboot}/loader/loader.conf" << EOF
default         arch.conf
timeout         3
editor          no
EOF
cat > "/${espboot}/loader/entries/arch.conf" << EOF
title   Arch Linux
linux   /vmlinuz-${kernel}
initrd  /${cpucode}-ucode.img
initrd  /initramfs-${kernel}.img
options root="LABEL=${rootlabel}" rw quiet
EOF
cat > "/etc/systemd/network/20-wired.network" << EOF
[Match]
Name=${interface}

[Network]
DHCP=yes
EOF
cat > "/etc/systemd/timesyncd.conf.d/local.conf" << EOF
[Time]
NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
FallbackNTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org
EOF
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl enable systemd-timesyncd.service
echo "-- ALL STEPS FINISHED"
echo "-- Remember to set a PASSWORD for root and ${username}"
