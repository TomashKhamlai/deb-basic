#!/usr/bin/env bash

function addhost() {

    local HOSTNAME;
    local HOSTS_LINE;

    if [[ -z "$1" ]]; then
        printf "Give me an argument. For example:\n    \e[44m addhost \"$VIRTUAL_HOST\"\e[0m \n";
    else
    	
        HOSTNAME="$1";
        HOSTS_LINE="$IP\t$HOSTNAME"

		if [ -n "$(grep $HOSTNAME /etc/hosts)" ]; then
            echo "$HOSTNAME already exists : $(grep $HOSTNAME $ETC_HOSTS)"
        else
            echo "Adding $HOSTNAME to your $ETC_HOSTS";
            sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";

            if [[ -n "$(grep $HOSTNAME /etc/hosts)" ]]; then
                echo "$HOSTNAME was added succesfully \n $(grep $HOSTNAME /etc/hosts)";
            else
                echo "Failed to Add $HOSTNAME, Try again!";
            fi
        fi
    fi
}