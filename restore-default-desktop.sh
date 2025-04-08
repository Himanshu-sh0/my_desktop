#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 Restoring XFCE desktop to default settings..."

# 1. Kill running desktop environment
pkill xfce4-session 2>/dev/null
pkill plank 2>/dev/null

# 2. Remove installed themes and icons
rm -rf ~/.themes
rm -rf ~/.icons
rm -rf ~/WhiteSur-gtk-theme-master whitesur-theme.zip
rm -rf ~/WhiteSur-icon-theme-master whitesur-icons.zip

# 3. Remove nerd fonts
rm -rf ~/.local/share/fonts/NF*
fc-cache -f

# 4. Delete custom configs
rm -rf ~/.config/plank
rm -rf ~/.config/autostart/plank.desktop
rm -rf ~/.config/xfce4/terminal/terminalrc
rm -rf ~/.config/xfce4/panel/whiskermenu-1.rc

# 5. Reset xfconf settings to default
xfconf-query -c xsettings -p /Net/ThemeName -r
xfconf-query -c xsettings -p /Net/IconThemeName -r
xfconf-query -c xfwm4 -p /general/use_compositing -r
xfconf-query -c xfwm4 -p /general/show_frame_shadow -r

# 6. Optional: Reset panel and session settings completely
rm -rf ~/.config/xfce4/panel
rm -rf ~/.cache/sessions

# 7. Optional: Clear termux-x11 if needed
# rm -rf ~/.termux-x11

echo -e "\n✅ XFCE desktop has been restored to default!"
echo "ℹ️ You can start it again using: start-termux-desktop"

exit 0
