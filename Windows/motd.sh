#!/bin/bash
#
# MOTD for a server
#
# Copyright (C) 2017 Nathan Chancellor
#
# CPU and memory usage functions taken from Screenfetch
# Copyright (c) 2010-2016 Brett Bohnenkamper <kittykatt@kittykatt.us>
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


function memUsage() {
    MEM_INFO=$( < /proc/meminfo )
    MEM_INFO=$( echo $( echo $( MEM_INFO=${MEM_INFO// /}; echo ${MEM_INFO//kB/}) ) )
    for M in $MEM_INFO; do
        case ${M//:*} in
            "MemTotal") MEM_USED=$((MEM_USED+=${M//*:})); MEM_TOTAL=${M//*:} ;;
            "ShMem") MEM_USED=$((MEM_USED+=${M//*:})) ;;
            "MemFree"|"Buffers"|"Cached"|"SReclaimable") MEM_USED=$((MEM_USED-=${M//*:})) ;;
        esac
    done
    MEM_USED=$((MEM_USED / 1024))
    MEM_TOTAL=$((MEM_TOTAL / 1024))
    PERCENT=$( echo $( echo "scale = 2; (${MEM_USED} / ${MEM_TOTAL})" | bc -l | awk -F '.' '{print $2}' ) | sed s/^0*//g )
    if [[ -z ${PERCENT} ]]; then
        PERCENT=0
    fi

    echo "${MEM_USED} MB out of ${MEM_TOTAL} MB (${PERCENT}%)"
}

function cpu() {
    CPU=$( awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | awk 'BEGIN{FS="@"; OFS="\n"} { print $1; exit }' )
    CPUN=$( grep -c '^processor' /proc/cpuinfo )

    LOC="/sys/devices/system/cpu/cpu0/cpufreq"
    BL="${LOC}/bios_limit"
    SMF="${LOC}/scaling_max_freq"
    if [ -f "${BL}" ] && [ -r "${BL}" ]; then
        CPU_MHZ=$( awk '{print $1/1000}' "${BL}" )
    elif [ -f "${SMF}" ] && [ -r "${SMF}" ]; then
        CPU_MHZ=$( awk '{print $1/1000}' "${SMF}" )
    else
        CPU_MHZ=$( awk -F':' '/cpu MHz/{ print int($2+.5) }' /proc/cpuinfo | head -n 1 )
    fi
    if [ -n "${CPU_MHZ}" ]; then
        if [ $( echo ${CPU_MHZ} | cut -d . -f 1 ) -gt 999 ]; then
            CPU_GHZ=$( awk '{print $1/1000}' <<< "${CPU_MHZ}" )
            CPUFREQ="${CPU_GHZ}GHz"
        else
            CPUFREQ="${CPU_MHZ}MHz"
        fi
    fi

    if [[ "${CPUN}" -gt "1" ]]; then
        CPUN="${CPUN}x "
    else
        CPUN=""
    fi
    if [ -z "${CPUFREQ}" ]; then
        CPU="${CPUN}${CPU}"
    else
        CPU="${CPU} ${CPUN} ${CPUFREQ}"
    fi

    echo $( sed -r 's/\([tT][mM]\)|\([Rr]\)|[pP]rocessor|CPU//g' <<< "${CPU}" | xargs )
}

function cpuUsage() {
        echo $( grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.2g%\n", usage}' )
}

function diskUsage() {
    USED=$( df -h | grep -m 1 /dev/sda | awk '{print $3}' )
    ALL=$( df -h | grep -m 1 /dev/sda | awk '{print $2}' )
    PERCENT=$( df -h | grep -m 1 /dev/sda | awk '{print $5}' )

    echo "${USED} out of ${ALL} (${PERCENT})"
}

function rootUsage() {
    USED=$( df -h | grep -m 1 /c | awk '{print $3}' )
    ALL=$( df -h | grep -m 1 /c | awk '{print $2}' )
    PERCENT=$( df -h | grep -m 1 /c | awk '{print $5}' )

    echo "${USED} out of ${ALL} (${PERCENT})"
}

clear


echo -e "\033[1m"

source banner
#source C:/Users/mkell/Documents/Scripts/Linux/banner

echo ""
echo ""
echo "    Today's Date      :  $( echo $( LC_ALL=C date "+%B %d, %Y (%A)" ) )"
echo "    Current Time      :  $( echo $( LC_ALL=C date "+%I:%M %p %Z" ) )"
echo "    Operating System  :  $( source /etc/os-release; echo -e "${PRETTY_NAME} \c"; uname -m )"
echo "    Operating System  :  Windows10 x86_64"
echo "    Kernel Version    :  $( uname -r )"
echo "    Processor         :  $( cpu )"
echo "    CPU Usage         :  $( cpuUsage )"
echo "    Memory Usage      :  $( memUsage )"
echo "    Disk Usage        :  $( rootUsage )"
echo ""
echo -e "\033[0m"
