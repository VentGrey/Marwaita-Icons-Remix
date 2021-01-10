#! /usr/bin/bash

USR_DIR="/usr/share/icons/"
USERD=$(id -u)

# Check who is running this script

if [[ "$USERD" -ne 0 ]]; then
    echo "This will install Marwaita in $HOME/.icons/"
    echo "Do you want to proceed? Y/n:"
    read  -r ans

    case $ans in
        [Yy]* )
            rm -rf ~/.icons/Marwaita*;
            mv Marwaita* ~/.icons;
            echo -e "[\e[32mOK\e[39m] Icons installed in \e[33m$HOME/.icons/\e[39m";
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
    echo "This will install Marwaita in /usr/share/icons"
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
