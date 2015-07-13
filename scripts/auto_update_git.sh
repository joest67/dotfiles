#!/bin/sh

# source: https://github.com/florianl/AutoUpdateGit/blob/master/AutoUpdateGit.sh

# Change here your basedirectory
# Example:
# Base="/this/is/my/basedirectory"
Base=""

if [ -z "$Base" -o "$Base" == "/this/is/my/basedirectory" ];
then
    Base=$(pwd)
fi
echo "BASE: "$Base

for Dir in $(find $Base -maxdepth 1 -type d)
do
	if [ -d $Dir/.git ];
	then
		cd $Dir
        printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
        pwd
        remote=$(grep "\[remote" $Dir/.git/config)
        if [[ $remote ]];
        then
		    git pull origin master
        fi
	fi
done
