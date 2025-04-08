#!/data/data/com.termux/files/usr/bin/bash

# Create bin directory if it doesn't exist
mkdir -p $PREFIX/bin

# === Install Script ===
cat > $PREFIX/bin/install-termux-desktop << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# Update and install required packages
pkg update && pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install wget termux-x11 termux-x11-nightly pulseaudio xfce4 firefox code-oss curl ncurses-utils zip -y

# Install Nerd Fonts
curl -fsSL https://raw.githubusercontent.com/arnavgr/termux-nf/main/install.sh | bash

echo -e "\n✅ Termux desktop packages installed."
EOF

# === Start Script ===
cat > $PREFIX/bin/start-termux-desktop << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# Kill any running termux-x11 processes
pkill -f "termux.x11" 2>/dev/null

# Start PulseAudio with network access
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Set runtime directory for X11
export XDG_RUNTIME_DIR=${TMPDIR}

# Start X11 server
termux-x11 :0 >/dev/null 2>&1 &
sleep 3

# Launch the X11 Android Activity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity >/dev/null 2>&1
sleep 1

# Set audio server environment
export PULSE_SERVER=127.0.0.1

# Start XFCE4 desktop session
env DISPLAY=:0 dbus-launch --exit-with-session xfce4-session >/dev/null 2>&1 &
EOF

# === Make both scripts executable ===
chmod +x $PREFIX/bin/install-termux-desktop
chmod +x $PREFIX/bin/start-termux-desktop

# Reload shell hash table
hash -r


echo -e "\n✅ Commands installed: install-termux-desktop & start-termux-desktop"
echo "➡ Run: install-termux-desktop"
echo "➡ Then: start-termux-desktop"

# Clean up (if this script was saved as termux-desktop.sh)
rm -f termux-desktop.sh

exit 0
