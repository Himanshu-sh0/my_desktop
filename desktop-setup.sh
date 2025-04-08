#!/data/data/com.termux/files/usr/bin/bash
curl -O https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/termux-desktop.sh
curl -O https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/create-macos-script.sh
curl -O https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/restore-default-desktop.sh

chmod +x termux-desktop.sh
chmod +x create-macos-script.sh
chmod +x restore-default-desktop.sh

./termux-desktop.sh
./create-macos-script.sh

echo "➡-------------------------------"
echo -e "\n✅ Commands added successfully!"
echo "➡ Run \`install-termux-desktop\` to install the desktop."
echo "➡ Run \`start-termux-desktop\` to start the desktop."
echo "➡-------------------------------"
echo "➡ Install Size:- 2.5-GB."
echo "➡-------------------------------"
echo "➡ Run \`macos-install\` to install macos customization files."
echo "➡ Run \`macos-customize\` to customize the desktop."
echo "➡-------------------------------"
echo "➡ Total Install Size :- 3.5-GB."
echo "➡-------------------------------"
rm -rf desktop-setup.sh
