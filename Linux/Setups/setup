#!/bin/bash

# This is a general-purpose function to ask Yes/No questions in Bash, either
# with or without a default answer. It keeps repeating the question until it
# gets a valid answer.
ask() {
    # https://djm.me/ask
    local prompt default reply
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi
        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "
        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty
        # Default?
        if [ -z "$reply" ]; then
            reply=$default
        fi
        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

show_main_menu() {
tput setaf 38
    clear
    echo ""
    echo "       Arch Setup Script"
    echo "        [KillerDroid96]"
    echo ""
    echo "=============================="
    echo "|          Main Menu         |"
    echo "=============================="
    echo "|  [1] Update System         |"
    echo "|  [2] Setup Github          |"
    echo "|  [3] Install Packages      |"
    echo "|  [4] Install Android       |"
    echo "|  [5] Setup Android         |"
    echo "|  [6] Add .bashrc Changes   |"
    echo "|  [7] Add SSH Changes       |"
    echo "|  [8] Add Neofetch Changes  |"
    echo "|  [a] About                 |"
    echo "|  [h] Help                  |"
    echo "|  [e] Exit                  |"
    echo "=============================="
read menu
case $menu in
1|update_system)
clear
tput setaf 29
if ask "Update System?"; then
    tput setaf 5; echo "Updating System"
    sudo pacman -Syyu --quiet --noconfirm
    tput setaf 2; echo "Installing AUR Package Manager" 
    cd && git clone https://aur.archlinux.org/trizen-git.git 
    cd trizen-git && makepkg -si && cd
    sudo rm -r trizen-git
    clear
    tput setaf 2
    echo ""
    echo "System Update Complete"
    echo ""
    pause 
else
    echo "No"
fi
;;
2|setup_gitconfig)
tput setaf 30
if ask "Setup Github Login?"; then
    sudo pacman -Syyu git xclip
    ssh-keygen -t rsa -b 4096 -C "mkeller96@gmail.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo "Login to Github & Add SSH Key"
    git config --global user.name "KillerDroid96"
    git config --global user.email "mkeller96@gmail.com"
    git config --global credential.helper "cache --timeout=7200"
    tput setaf 2
    echo ""
    echo "Github Setup Complete"
    echo "" 
else
    echo "No"
fi
;;
3|install_packages)
tput setaf 31
    echo "===================================================="
    echo "|                     Programs                     |"
    echo "===================================================="
    echo "| acpi            # Displays Battery Percent       |"
    echo "| apg             # Generates Random Password      |"
    echo "| alsi            # System Info Like Neofetch      |"
    echo "| baobab          # Storage Analyzer               |"
    echo "| bcompare        # Compares Files & Folders       |"
    echo "| cava            # Console Audio Visualizer       |"
    echo "| chromium        # Web Browser                    |"
    echo "| clex            # Console File Manager           |"
    echo "| climate         # Command Line Tools             |"
    echo "| cmatrix         # Displays Matrix Effect         |"
    echo "| cylon           # Arch Maintenance Program       |"
    echo "| elinks          # Console Web Browser            |"
    echo "| figlet          # Outputs Text in ASCII Art      |"
    echo "| glances         # System Overview                |"
    echo "| hollywood       # Hacker Movie Scene             |"
    echo "| htop            # System Status Overview         |"
    echo "| jp2a            # Converts JPG to ASCII Art      |"
    echo "| neofetch        # System Information Overview    |"
    echo "| qdirstat-git    # Sorts Files by Size            |"
    echo "| rig             # Random ID Generator            |"
    echo "| yakuake         # Drop Down Terminal             |"
    echo "===================================================="   
if ask "Install My Additional Packages?"; then  
    tput setaf 31; echo "Installing Addition Packages"
    trizen -S --needed --quiet --noedit --noconfirm acpi apg alsi baobab bc bcompare cava chromium clex climate cmatrix cylon elinks figlet glances hollywood htop jp2a neofetch qdirstat-git rar rig screenfetch spotify telegram-desktop w3m yakuake
    clear
    figlet KillerDroid96
    tput setaf 2
    echo ""
    echo "Additional Packages Install Complete"
    echo "" 
    pause
else
    echo "No"
fi
;;

4|install_android)
tput setaf 32
if ask "Install Android Build Dependencies?"; then
    echo "Installing Android Dependencies" && sleep 3
    trizen -S make fakeroot --noconfirm
    trizen -Syyu --needed --quiet --noedit --noconfirm aosp-devel base-devel lineageos-devel
    echo "Disable PGP checking from AUR" && sleep 3
    export MAKEPKG="makepkg --skippgpcheck"
    tput setaf 2;
    trizen -S --needed --quiet libtinfo --skipinteg --noconfirm 
    trizen -S --needed --quiet lib32-ncurses5-compat-libs --skipinteg --noconfirm 
    trizen -S --needed --quiet ncurses5-compat-libs --skipinteg --noconfirm
    tput setaf 2
    echo ""
    echo "Android Setup Complete"
    echo "" 
else
    echo "No"
fi
;;

5|setup_du)
tput setaf 33
if ask "Setup Build for Dirty Unicorns?"; then
    mkdir ~/Github/DU
    cd ~/Github/DU
    virtualenv2 venv
    source venv/bin/activate
    repo init -u http://github.com/DirtyUnicorns/android_manifest.git -b o8x-caf
    mkdir ~/Github/DU/.repo/local_manifests
    cp ~/Github/Scripts/Linux/Files/du_manifest.xml ~/Github/DU/local_manifests/du_manifest.xml
    repo sync --force-sync -j$( nproc --all )
    ccache -M 50G
    echo "Enter du_rom in a Terminal to Start Build"
else
    echo "No"
fi
;;

6|add_bashrc)
tput setaf 34
if ask "Add .bashrc Changes?"; then
    cp -b $HOME/Github/Scripts/Linux/Bash/.bashrc $HOME && source ~/.bashrc
    tput setaf 2
    echo ""
    echo ".bashrc Changes Complete"
    echo "" 
else
    echo "No"
fi
;;

7|add_sshd)
tput setaf 35
# Default to Yes if the user presses enter without giving an answer:
if ask "Add sshd_config Changes?" Y; then
    sudo cp ~/Github/Scripts/Linux/Files/sshd_config /etc/ssh/sshd_config
    tput setaf 2
    echo ""
    echo "SSHD Configuration Complete"
    echo "" 
else
    echo "No"
fi
;;

8|add_neofetch)
tput setaf 36
if ask "Add Neofetch Config?" Y; then
    cp Github/Scripts/Files/neofetch ~/.config/neofetch/config
    tput setaf 2
    echo ""
    echo "Neofech Changes Complete"
    echo "" 
else
    echo "No"
fi
;;

9|what_dm)
tput setaf 37
if ask "Show Display Manager?" Y; then
file /etc/systemd/system/display-manager.service &> $HOME/Github/arch_setup.log 
ps auxf | awk '{print$11}' | \grep -e "^/.*dm$" -e "/.*slim$" # Prints Display Manager
echo -n "What Is your Display Manager?"
read display
case $display in
GDM|gdm|gdm.service)
echo "Disabling GDM"
sudo systemctl disable gdm.service
;;
LightDM|lightdm|lightdm.service)
echo "Disabling LightDM"
sudo systemctl disable lightdm.service
;;
LXDM)
echo "Disabling LXDM"
sudo systemctl disable lxdm.service
;;
SDDM|sddm)
echo "Disabling SDDM"
sudo systemctl disable sddm.service
;;
XDM)
echo "Disabling XDM"
sudo systemctl disable xdm.service
;;
*)
echo don\'t know
;;
esac
else
    echo "No"
fi
;;

a|A|about)
    clear
    tput setaf 1
    echo ""
    echo " This is a Script Made to Customize Arch Linux"
    echo "   Written by Matthew Keller [KillerDroid96]"
    echo ""
    tput setaf 36
    pause
    clear
    show_main_menu
;;

Help|help|h|H)
    clear
    tput setaf 1
    echo ""
    echo "To Use Menu Enter the Number or Letter"
    echo ""
    tput setaf 36
    pause
    clear
    show_main_menu
;;
Exit|e|E|exit)
    clear
    exit 0
;;
*)
echo don\'t know
;;
esac

}

while true
do
    show_main_menu
    
done 