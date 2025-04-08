#!/data/data/com.termux/files/usr/bin/bash
curl -O https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/termux-desktop.sh
curl -O https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/create-macos-script.sh
curl -O https://raw.githubusercontent.com/Himanshu-sh0/my_desktop/refs/heads/main/restore-default-desktop.sh

chmod +x termux-desktop.sh
#!/bin/bash

# Define colors
GREEN='\033[0;32m'    # Green
BLUE='\033[0;34m'     # Blue
CYAN='\033[0;36m'     # Cyan

# Font weights
BOLD='\033[1m'
FAINT='\033[2m'
NORMAL='\033[22m'  

log(){
    local command=$1
    local message=$2
    printf "${CYAN}${FAINT}Run ➡ ${NC}${GREEN}${BOLD}%s${NC}\n ${BLUE}${NORMAL}%s${NC}\n${GREEN}${BOLD}--------------------------------${NC}\n" "$command" "$message"
}
size_log(){
    local size=$1
    printf "${CYAN}${FAINT}Size :-${NC} ${GREEN}${BOLD}%s${NC}\n${BLUE}${BOLD}--------------------------------${NC}\n\n" "$size"
}

log "install-termux-desktop" "to install the desktop."
size_log "2.5-GB"
log "start-termux-desktop" "to start the desktop."
echo ""
log "macos-install" "to intall macos customization files."
size_log "0.7-GB"
log "macos-customize" "to customize the desktop"
echo "➡-------------------------------\n"
rm -rf desktop-setup.sh

