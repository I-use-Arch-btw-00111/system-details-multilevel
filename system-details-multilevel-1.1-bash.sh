#!/bin/bash

read -p "Enter detail level (1, 2, or 3): " detail_level

case $detail_level in
    1)
        echo "System Information:"
        uname -a
        cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available."
        log_message="System Information: $(uname -a)\n$(cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available.")"
        ;;
    2)
        echo "System Information (Detailed):"
        echo "-----------------------------"
        uname -a
        cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available."
        echo ""
        echo "Hardware Information:"
        echo "---------------------"
        lshw -short
        log_message="System Information (Detailed): $(uname -a)\n$(cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available.")\n\nHardware Information:\n$(lshw -short)"
        ;;
    3)
        echo "System Information (Advanced):"
        echo "-----------------------------"
        uname -a
        cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available."
        echo ""
        echo "Hardware Information:"
        echo "---------------------"
        lshw -short
        echo ""
        echo "Driver Information:"
        echo "-------------------"
        lspci -k
        echo ""
        echo "Firmware Information:"
        echo "---------------------"
        ls /sys/firmware
        log_message="System Information (Advanced): $(uname -a)\n$(cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available.")\n\nHardware Information:\n$(lshw -short)\n\nDriver Information:\n$(lspci -k)\n\nFirmware Information:\n$(ls /sys/firmware)"
        ;;
    *)
        echo "Invalid detail level. Please enter 1, 2, or 3."
        exit 1
        ;;
esac

read -p "Do you want to save the information to a log? (y/n): " save_log

if [ "$save_log" == "y" ]; then
    read -p "Enter the location to save the log: " log_location
    read -p "Enter the name of the log file: " log_filename
    log_filepath="$log_location/$log_filename"
    
    if [ ! -d "$log_location" ]; then
        mkdir -p "$log_location"
    fi

    echo -e "$log_message" > "$log_filepath"
    echo "Log saved to: $log_filepath"
fi
