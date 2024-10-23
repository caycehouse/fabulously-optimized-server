#!/bin/bash

curl -s https://api.github.com/repos/Fabulously-Optimized/fabulously-optimized/releases |
        grep -m 1 "browser_download_url.*zip" |
        cut -d : -f 2,3 |
        tr -d \" |
        wget -O FO.zip -qi -

rm -r mods/
rm -r config/
rm index.toml
rm pack.toml

packwiz cf import FO.zip

rm FO.zip
rm -r resourcepacks/

curl --silent https://raw.githubusercontent.com/itzg/docker-minecraft-server/master/files/cf-exclude-include.json | jq -r '.globalExcludes[]' | while read -r mod; do
        echo "Removing $mod if exists..."
        packwiz remove "$mod" 1>/dev/null
done

packwiz refresh
