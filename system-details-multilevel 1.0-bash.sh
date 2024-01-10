#!/bin/bash

read -p "Enter detail level (1, 2, or 3): " detail_level

case $detail_level in
    1)
        echo "System Information:"
        uname -a
        cat /etc/*-release 2>/dev/null | grep -E "DISTRIB_ID|DISTRIB_RELEASE|DISTRIB_DESCRIPTION" || echo "Distribution information not available."
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
        ;;
    *)
        echo "Invalid detail level. Please enter 1, 2, or 3."
        ;;
esac
