#!/bin/sh
# Check if firewall is active, blocking all incoming connections and in stealth mode

FW_CLI="/usr/libexec/ApplicationFirewall/socketfilterfw"

EXPECTED_STEALTH="Firewall stealth mode is on"
EXPECTED_BLOCKALL="Firewall is blocking all non-essential incoming connections."
EXPECTED_STATE="Firewall is blocking all non-essential incoming connections. (State = 2)"

ACTUAL_STATE=$($FW_CLI --getglobalstate)
ACTUAL_BLOCKALL=$($FW_CLI --getblockall)
ACTUAL_STEALTH=$($FW_CLI --getstealthmode)

if [ "$1" = "-u" ]; then
    $FW_CLI --setglobalstate on
    $FW_CLI --setblockall on
    $FW_CLI --setstealthmode on
fi

if [ "$ACTUAL_STEALTH" != "$EXPECTED_STEALTH" ] || \
   [ "$ACTUAL_BLOCKALL" != "$EXPECTED_BLOCKALL" ] || \
   [ "$ACTUAL_STATE" != "$EXPECTED_STATE" ] || \
   [ "$1" = "-t" ]; then

    printf "\033[01;33m[\xE2\x86\x92] "
    printf "\033[1;35mCheck firewall settings\033[0m\n"
    echo "Stealth Mode: $ACTUAL_STEALTH"
    echo "Block All:    $ACTUAL_BLOCKALL"
    echo "Global State: $ACTUAL_STATE"
else
    printf "\033[01;32m \xE2\x86\x92 "
    printf "\033[1;32mFirewall settings are ok\033[0m\n"
fi
