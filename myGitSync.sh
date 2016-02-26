#!/bin/bash

if [ -n "$1" ] && [ -n "$2" ]
then
    echo "-------------------------------------------------------"
    echo "	you are using branch name : $1"
    echo "	you are using tag name : $2"
    read -s -n1 -p "	is that right?(y/n) " read_right

    if [ "$read_right" == "n" ]
    then
	echo " "
	echo "	exit!!"
	exit 0
    else
	echo " "
	echo "--------------------------"
	echo "	[f] git clean false	"
	echo "	[t] git clean true	"
	read -s -n1 -p "    choice option : " clean_option

	if [ "$clean_option" == "t" ]
	then
	    echo " "
	    echo "-=-	go git clean ..."
	    repo forall -c 'git clean -f -d'
	    repo forall -d 'git checkout -f'
	    echo "-=-	git clean Done!"
	else
	    echo " "
	    echo "---	Don't need git clean	---"
	fi

	echo " "
	echo "	start tag syncing...."
	repo sync -d -c -j4
	repo forall -c 'git reset --hard $2'
	repo start $1 --all
	repo forall -c 'git remote set-url --push lap ssh://lap.lge.com:029475/${REPO_PROJECT}'
    fi
else
    echo " "
    echo "   usage : parameter1 - branch name"
    echo "           parameter2 - tag name"
    echo " "
    exit 0
fi
