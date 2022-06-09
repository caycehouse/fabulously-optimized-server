#!/bin/bash

curl -s https://api.github.com/repos/Fabulously-Optimized/fabulously-optimized/releases \
| grep -m 1 "browser_download_url.*zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -O FO.zip -qi - \

packwiz cf import FO.zip

for mod in $(grep -rlw mods -e 'optional'); do
        rm ${mod}
done

rm FO.zip

packwiz remove entityculling

packwiz refresh
