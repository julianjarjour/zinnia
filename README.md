### Dotfiles Installation

Delete hidden files in the home directory, then clone.

```
rm ~/.bash*
su -c 'pacman -S git'
git clone --depth 1 https://git.sr.ht/~tonijarjour/dotfiles ~/.fn
```

`cd` is required. Edit `install.sh` as needed.

```
cd ~/.fn
bash install.sh
```

### Arch Linux Installation Steps

Format partitions then mount. Use `fdisk` if not already partitioned.

```
mkfs.fat -F32 /dev/sdA
mkfs.ext4 -L "ARCH_LINUX" /dev/sdbB

mount /dev/sdbB /mnt
mkdir /mnt/boot
mount /dev/sdbA /mnt/boot
```

Run `reflector` to get a list of decent mirrors.

```
reflector --latest 10 --sort rate --country "United States" --save /etc/pacman.d/mirrorlist
```

Choose the proper ucode package for the system's CPU.

```
pacstrap /mnt base linux-zen linux-firmware amd-ucode
```

Mount any additional partitions then generate mounting instructions.

```
genfstab -U /mnt >> /mnt/etc/fstab
```

Remember to edit `chroot.sh` as needed.

```
curl -O https://git.sr.ht/~tonijarjour/dotfiles/blob/master/chroot.sh
cp chroot.sh /mnt
arch-chroot /mnt
bash chroot.sh
```

### Fast Arch Mirror

```
https://arch.mirror.constant.com/$repo/os/$arch
```
