# Install RPMFusion and upgrade
sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade --refresh -y

# Nvidia drivers
sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power nvidia-settings -y
sudo dnf install xorg-x11-drv-nvidia-libs.i686 -y
echo  "Waiting for 10 second...."
sleep 10
sudo akmods --force
sudo dracut --force
sudo systemctl enable nvidia-{suspend,resume,hibernate}
# CUDA drivers
sudo dnf install xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs -y
sudo dnf install xorg-x11-drv-nvidia-cuda-libs.i686 -y

# Install Telegram Desktop
sudo dnf install telegram-desktop -y

# Install codecs
sudo dnf install ffmpeg-libs --allowerasing -y

# Install Podman
sudo dnf install podman -y

# Install VirtualBox
sudo dnf install gcc kernel-devel kernel-headers akmod-VirtualBox VirtualBox -y
sudo usermod -a -G vboxusers $(whoami)
sudo usermod -a -G vboxsf $(whoami)

echo "Script completed successfully! Reboot in 5 seconds..."
sleep 5

# Reboot
sudo systemctl reboot
