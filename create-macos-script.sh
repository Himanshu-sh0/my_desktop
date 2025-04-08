#!/data/data/com.termux/files/usr/bin/bash

mkdir -p ~/termux-macos-setup
cd ~/termux-macos-setup

# === Create Part 1: macOS Installation Script ===
cat > macos-install.sh <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# Update and install required packages
pkg update && pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install wget git termux-x11 termux-x11-nightly pulseaudio xfce4 xfce4-terminal plank curl unzip ncurses-utils zip -y
pkg install gtk-engine-murrine gtk-engines -y

# Install nerd fonts
curl -fsSL https://raw.githubusercontent.com/arnavgr/termux-nf/main/install.sh | bash

# Create themes and icons directories
mkdir -p ~/.themes ~/.icons

# Install macOS Big Sur GTK Theme
cd ~
wget https://github.com/vinceliuice/WhiteSur-gtk-theme/archive/refs/heads/master.zip -O whitesur-theme.zip
unzip -o whitesur-theme.zip
cd WhiteSur-gtk-theme-master
./install.sh -d ~/.themes
cd ~

# Install macOS Big Sur Icon Pack
wget https://github.com/vinceliuice/WhiteSur-icon-theme/archive/refs/heads/master.zip -O whitesur-icons.zip
unzip -o whitesur-icons.zip
cd WhiteSur-icon-theme-master
./install.sh -d ~/.icons
cd ~

echo -e "\n✅ macOS-style packages, fonts, themes, and icons installed."
EOF

# === Create Part 2: macOS Customization Script ===
cat > macos-customize.sh <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# Configure Plank dock
mkdir -p ~/.config/plank/dock1
cat > ~/.config/plank/dock1/settings <<EOL
[PlankDockPreferences]
Alignment=Center
AutoHide=true
DockItems=xfce4-terminal.dockitem;firefox.dockitem;code-oss.dockitem;
IconSize=48
ItemsAlignment=Center
Monitor=0
Offset=0
PinnedOnly=false
Position=Bottom
PressureReveal=false
ShowDockItem=false
Theme=Transparent
ZoomEnabled=true
EOL

# Transparent terminal with blur
mkdir -p ~/.config/xfce4/terminal
cat > ~/.config/xfce4/terminal/terminalrc <<EOL
[Configuration]
MiscAlwaysShowTabs=FALSE
MiscDefaultGeometry=80x24
MiscUseShiftArrows=FALSE
ScrollingUnlimited=TRUE
BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
Transparency=0.8
ColorForeground=#FFFFFF
ColorBackground=#000000
FontName=Fira Code 10
EOL

# Whisker menu config
mkdir -p ~/.config/xfce4/panel
cat > ~/.config/xfce4/panel/whiskermenu-1.rc <<EOL
button-title=Applications
button-icon=distributor-logo
favorites=/usr/bin/firefox;/usr/bin/code-oss;/usr/bin/xfce4-terminal;
show-button-title=true
EOL

# Set theme and icon via xfconf
xfconf-query -c xsettings -p /Net/ThemeName -s "WhiteSur-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "WhiteSur"

# Enable compositor and shadow
xfconf-query -c xfwm4 -p /general/use_compositing -s true
xfconf-query -c xfwm4 -p /general/show_frame_shadow -s true

# Autostart Plank dock
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/plank.desktop <<EOL
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
X-GNOME-Autostart-enabled=true
Name=Plank
EOL

echo -e "\n🎨 macOS-style customization applied successfully!"
echo "👉 Launch your desktop with: start-termux-desktop"
EOF

# Make both scripts executable
chmod +x macos-install.sh macos-customize.sh

# Move to $PREFIX/bin for global use
mv macos-install.sh $PREFIX/bin/macos-install
mv macos-customize.sh $PREFIX/bin/macos-customize

echo -e "\n✅ macOS-style scripts installed successfully!"
echo "➡ Run \`macos-install\` to install packages, themes, and icons."
echo "➡ Run \`macos-customize\` to apply desktop and dock settings."
cd ..
rm -rf termux-macos-setup
rm -rf create-macos-script.sh
