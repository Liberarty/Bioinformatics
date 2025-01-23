#!/bin/bash

#Variables
greeting="Hey Hey Hey"
yourname=Liberty 

#Echo name and learning bash
echo "$greeting $yourname"
echo "This script is helping you learn bash" 

#make bioinformatics directory and bash script subdirectory
mkdir -p /root/bioinformatics/bash_scripts

#moving and renaming the .txt to a.sh
mv bash_template.txt /root/bioinformatics/bash_scripts
cd /root/bioinformatics/bash_scripts
mv bash_template.txt bash_template.sh
