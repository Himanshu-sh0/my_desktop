#!/data/data/com.termux/files/usr/bin/bash
wget https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/termux-desktop.sh
wget https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/create-macos-script.sh
wget https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/restore-default-desktop.sh

chmod +x termux-desktop.sh
chmod +x create-macos-script.sh
chmod +x restore-default-desktop.sh

./termux-desktop.sh
./create-macos-script.sh
./restore-default-desktop.sh

rm -rf desktop-setup.sh