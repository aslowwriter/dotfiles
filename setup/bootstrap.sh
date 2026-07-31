set -euo pipefail

timedatectl

# Format disk

# Create partition table
echo "label: gpt" | sfdisk /dev/nvme0n1

# Create EFI boot partition (1 GB)
echo ",+1G,U" | sfdisk /dev/nvme0n1

# Create EXT4 partition (rest of the drive)
echo ",," | sfdisk --append /dev/nvme0n1

# Format partitions
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2

mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot

#installing packages
#update mirror list
reflector

#update keyring in case the iso is old
pacman -Syy
pacman -Sy --needed archlinux-keyring --noconfirm

#install what we'll need for system setup after reboot
pacstrap -K /mnt amd-ucode base base-devel plasma konsole dolphin curl git linux linux-firmware mesa networkmanager openssl openssh sudo vim xorg-server-xwayland firefox

genfstab -U /mnt >>/mnt/etc/fstab

# stuff we have to do in jail
curl -L https://raw.githubusercontent.com/aslowwriter/dotfiles/main/setup/jailed.sh -o /mnt/jailed.sh
chmod +x /mnt/jailed.sh
arch-chroot /mnt
