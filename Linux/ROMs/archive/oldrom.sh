#!/bin/bash
#
# Copyright (C) 2017-2018 Matthew Keller
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#

# Source our universal functions script and macOS check
#source $HOME/Github/nathan_scripts/common
source $HOME/Github/Scripts/Linux/Shells/shell_functions
source $HOME/Github/Scripts/Linux/Shells/shell_sources
source $HOME/Github/Scripts/Linux/Shells/shell_colors

echo -e ${CL_RED}""
echo -e "============================================="
echo -e "               ____  _      __               "
echo -e "              / __ \(_)____/ /___  __        "
echo -e "             / / / / / ___/ __/ / / /        "
echo -e "            / /_/ / / /  / /_/ /_/ /         "
echo -e "           /_____/_/_/   \__/\__, /          "
echo -e "    __  __      _           /____/           "
echo -e "   / / / /___  (_)________  _________  _____ "
echo -e "  / / / / __ \/ / ___/ __ \/ ___/ __ \/ ___/ "
echo -e " / /_/ / / / / / /__/ /_/ / /  / / / (__  )  "
echo -e " \____/_/ /_/_/\___/\____/_/  /_/ /_/____/   "
echo -e "                                             "
echo -e "============================================="
echo -e ${CL_RST}""

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

pause0(){
    read -p "                        Press [Enter] key to continue..." fackEnterKey
}

# function to display menus
function show_menus() {
    clear
    echo ""
    tput setaf 1
    echo "Lets Get ROM'd Up!" && sleep 2
    tput setaf 2
    clear
    echo "   ROM Builder  "
    echo " [KillerDroid96]"
    echo ""
    echo "================="
    echo "|   Main Menu   |"
    echo "================="
    echo "| [1] Setup     |"
    echo "| [2] Build     |"
    echo "| [e] Exit      |"
    echo "================="
    echo ""
}
read_options(){
    local choice
    read -p "Enter choice:" choice
    case $choice in
        1) Setup ;;
        2) Build ;;
        e) exit 0;; 
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}
Build(){
    show_menus(){
    clear
    echo "============="
    echo "|   Build   |"
    echo "============="
    echo "| [1] Clean |"
    echo "| [2] Dirty |"
    echo "| [e] Exit  |"
    echo "============="
}
read_options(){
    local choice
    tput setaf 7; read -p "Enter choice [ 1 - 3] " choice
    case $choice in
        1) Clean ;;
        2) Dirty ;;
        e) exit 0 ;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}
Clean(){
        echo ""
        echo "${green}Clean Build${white}"
        CLEAN_TARGET=clobber
        pause
        return
}
Dirty(){
        echo ""
        clear
        echo "${red}Dirty Build${white}"
        CLEAN_TARGET=
        pause
        return
}
}
Setup(){
    show_menus() {
    clear
    tput setaf 2
    echo "============================"    
    echo "|          Setup           |"
    echo "============================"
    echo "| [1] Install Dependencies |"
    echo "| [2] Setup Google Source  |"
    echo "| [3] Create ROM Directory |" 
    echo "| [4] Initialize Repo      |"
    echo "| [5] Setup CCache         |"
    echo "| [e] Exit                 |"
    echo "============================"
}
read_options(){
    local choice
    tput setaf 7; read -p "Enter choice [ 1 - 6] " choice
    case $choice in
        1) Install_Dependencies ;;
        2) Setup_Google_Source ;;
        3) Create_ROM_Directory ;;
        4) Initialize_Repo ;;
        5) Setup_CCache ;;
        e) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}
Install_Dependencies(){
    show_menus(){
    clear
    tput setaf 2
    echo "=================="
    echo "|  Dependencies  |"
    echo "=================="
    echo "| [1] Arch       |"
    echo "| [2] Ubuntu     |"
    echo "| [e] Exit       |" 
    echo "=================="
}
read_options(){
    local choice
    tput setaf 7; read -p "Enter choice [ 1 - 3] " choice
    case $choice in
        1) Arch ;;
        2) Ubuntu ;;
        e) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}
Arch(){
        tput setaf 1; echo "Installing Dependencies for Arch"
        tput setaf 3; echo "Gettings Things Ready"
        tput setaf 2; sudo yay -Syyu
        tput setaf 3; echo "Installing Android Dependencies" && sleep 3
        tput setaf 2; sudo yay -S  git gnupg flex bison gperf sdl wxgtk2 bash-completion \
        squashfs-tools curl ncurses zlib schedtool perl-switch zip \
        unzip libxslt python2-virtualenv bc rsync  \
        xml2 lzop pngcrush imagemagick 6jdk8-openjdk  jdk9-openjdk repo android-tools python-networkx 
        tput setaf 3; echo "Installing 64 bit Dependencies" && sleep 3
        tput setaf 2; sudo yay -S ncurses5-compat-libs lib32-ncurses5-compat-libs lib32-zlib lib32-ncurses lib32-readline
        tput setaf 3; echo "Installing Extra Dependencies" && sleep 3
        tput setaf 2; sudo yay -S ca-certificates-mozilla fakeroot make pkg-config maven tmux screen w3m ncftp yaourt
        tput setaf 2; yaourt -S neofetch aur/tilix 
        tput setaf 3; echo "Check & Reinstall Dependencies " && sleep 3
        tput setaf 2; sudo yay -S base-devel
        tput setaf 3; echo "Disable PGP checking from AUR" && sleep 3
        export MAKEPKG="makepkg --skippgpcheck"
        tput setaf 2;
        pacaur -S libtinfo --noconfirm
        pacaur -S lib32-ncurses5-compat-libs --noconfirm
        pacaur -S ncurses5-compat-libs --noconfirm
        pause
        return
}
Ubuntu(){
         echo "Installing Dependencies for Ubuntu"
         sudo apt install neofetch tilix
         pause
         return
}
}
Setup_Google_Source(){
    echo "Setting up Google Source"
    mkdir ~/bin
    PATH=~/bin:$PATH
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
    pause
    return
}
Create_ROM_Directory(){
    echo "Creating ROM Directory:"
    echo "mkdir ~/ROM-Directory"
    pause
    mkdir ~/ROM-Directory
    pause
    return
}
Initialize_Repo(){
    echo "Initialize Repo:"
    echo "cd ~/ROM-Directory"
    pause
    cd ~/ROM-Directory
    echo "Example: repo init -u https://github.com/username/platform_manifest.git -b branch"
    pause
    echo "Initializing DirtyUnicorns"
    pause
    repo init -u https://github.com/DirtyUnicorns/android_manifest -b o8x-caf
    return
}
Setup_CCache(){
    echo "export USE_CCACHE=1" >> ~/.bashrc
    echo "~/ROM-Directory/prebuilts/misc/linux-x86/ccache/ccache -M 60G"
    pause
    return
}
}

while true
do
    show_menus
    read_options 
done