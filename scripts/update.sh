#!/bin/bash

curl -s https://api.github.com/repos/Fabulously-Optimized/fabulously-optimized/releases |
        grep -m 1 "browser_download_url.*zip" |
        cut -d : -f 2,3 |
        tr -d \" |
        wget -O FO.zip -qi -

rm -r mods/

packwiz cf import FO.zip

rm FO.zip
rm -r resourcepacks/

packwiz remove entityculling
packwiz remove irisshaders

packwiz refresh
