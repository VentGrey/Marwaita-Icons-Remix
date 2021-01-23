#! /usr/bin/bash

USR_DIR="/usr/share/icons/"
HM_DIR="$HOME/.icons/"
USERD=$(id -u)

# Installation Function

installation() {
    if [[ "$USERD" -ne 0 ]]; then
        echo "This will install Marwaita in $HM_DIR"
        echo "Do you want to proceed? Y/n:"
        read  -r ans

        case $ans in
            [Yy]* )
                rm -rf ~/.icons/Marwaita*;
                mv Marwaita* ~/.icons;
                echo -e "[\e[32mOK\e[39m] Icons installed in \e[33m$HM_DIR/.icons/\e[39m";
                exit 0
                ;;

            [Nn]* )
                echo "Installation cancelled";
                exit 0
                ;;

            *)
                echo "Invalid answer!";
                exit 1
                ;;
        esac
    else
        echo "This will install Marwaita in $USR_DIR"
        read -pr "Do you want to proceed? Y/n" ans

        case $ans in
            y|Y )
                rm -rf /usr/share/icons/Marwaita*;
                mv Marwaita* $USR_DIR;
                echo -e "[\e[32mOK\e[39m] Icons installed \e[33m$USR_DIR\e[39m";
                exit 0
                ;;

            n|N )
                echo "Installation cancelled";
                exit 0;;

            *)
                echo "Invalid answer!";
                exit 1;;
        esac
    fi
}

help() {
    echo "Marwaita Installation script
    USAGE:
    --help | -h:    Show this screen
    --install | -i: Install wizard for Marwaita Icons
    --gui | -g:     Install using a GUI (requires yad)"
}

install_gui() {
    # Check if yad is installed
    if ! [ -x "$(command -v yad)" ]; then
        echo 'Error: yad is required for GUI installation.' >&2
        exit 1
    fi


}

# Argument handling

if [[ $# -ne 1 ]]; then
    echo -e "No command line arguments supplied!"
    help
    exit 127
fi


case "$1" in
    "--help" | "-h") help;;
    "--install" | "-i") installation;;
    "--gui" | "-g") install_gui;;
    *) help;;
esac
