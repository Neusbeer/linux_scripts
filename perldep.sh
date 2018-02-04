#!/bin/bash
if [ -z "$1" ]; then
    echo -e "No file given.\ne.g $0 <filename>\nto auto install:\n$0 <filename> install\n"
    exit 1
fi
dependencies=$(scandeps.pl "$1" -B | grep -o "[a-zA-Z0-9: ']*\=>" | grep -o "[a-zA-Z0-9:]*")
dependenciesArray=( $dependencies )
#for i in "${dependenciesArray[@]}"; do echo $i; done

function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
       if [ "${!i}" == "${value}" ]; then
         echo "y"
         return 0
       fi
    }
    echo "n"
    return 1
}

not_installed=0
p="$2"
if [ "${p,,}" == "install" ]; then
    echo -e "\nInstallation of modules starting...\n"
    echo -e "Getting CPAN installed list\n"
    installed=$(cpan -l | grep -o '^[a-zA-Z0-9:]*')
    installedArray=( $installed )
    for i in "${dependenciesArray[@]}"; do echo $i; done
    echo "dependend libs:  ${#dependenciesArray[*]}"
    echo "installed: ${#installedArray[*]}"
    for lib in "${dependenciesArray[@]}"
    do
        if [ $(contains "${installedArray[@]}" "$lib") == "y" ]; then
            echo "$lib already installed.. skipping.."
            not_installed=$((not_installed+1))
        else
            cpan -i "$lib"
        fi
    done
    echo $to_install
fi
echo "dependend libs:  ${#dependenciesArray[*]}"
echo "already installed: ${#installedArray[*]}"
echo "skipping: $not_installed"
echo
