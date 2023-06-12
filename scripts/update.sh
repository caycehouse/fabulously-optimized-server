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

curl --silent https://raw.githubusercontent.com/itzg/docker-minecraft-server/master/files/cf-exclude-include.json | jq -r '.globalExcludes[]' | while read -r mod; do
        packwiz remove "$mod"
done

packwiz refresh
