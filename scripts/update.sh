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

# Pulled from https://github.com/itzg/docker-minecraft-server/blob/master/files/cf-exclude-include.json
packwiz remove carry-on
packwiz remove defensive-measures
packwiz remove dynamiclights-reforged
packwiz remove entity-texture-features-fabric
packwiz remove entityculling
packwiz remove extreme-sound-muffler
packwiz remove ignitioncoil
packwiz remove irisshaders
packwiz remove legendary-tooltips
packwiz remove neat
packwiz remove nekos-enchanted-books
packwiz remove not-enough-animations
packwiz remove oculus
packwiz remove rubidium
packwiz remove rubidium-extra
packwiz remove magnesium-extras
packwiz remove skin-layers-3d
packwiz remove textrues-rubidium-options
packwiz remove torohealth-damage-indicators

packwiz refresh
