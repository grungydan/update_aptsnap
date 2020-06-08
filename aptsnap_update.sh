#!/bin/bash

# Error checking
function check_exit() {
    if [ $? -eq 0 ]; then
        echo 
        echo "   Success   "
        echo 

    else 
        echo
        echo " ERROR: Fail, please see update.log"
        echo

        read -p "The last command exited with an error. Continue? (yes/no)"

        if [ "$answer" == "no" ]; then
            exit 1
        fi
    fi
}

# Update apt packages
update_apt () {
    sudo apt update;
    check_exit

    sudo apt upgrade -y;
    check_exit

    sudo apt dist-upgrade -y;
}

# Update snaps
update_snap() {
    sudo snap refresh;
    check_exit
}

# Cleanup
clean() {
    sudo apt autoremove -y;
    check_exit

    sudo apt autoclean -y;
    check_exit
}

# Indicate success
donezo() {
    echo
    echo "Update successful."
    exit 
}

update_apt
update_snap
clean
donezo

