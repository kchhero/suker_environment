#!/bin/bash

set -e

argc=$#
START_OPENGROK=false
UPDATE_OPENGROK=false
INDEXING_OPENGROK=false
SRC_PATH=
UPDATE_SRC_REPO_SYNC=false
#Artik
#repo init -u ssh://suker@agit.artik.io:29418/scm/artik/manifest -b artik
#repoYocto
#repo init -u ssh://suker@git.nexell.co.kr:29418/nexell/yocto/manifest

OPENGROK_ORG_SOURCE_PATH="/home/suker/sukerSDB/openGrokSRC"

function parse_args()
{
    ARGS=$(getopt -o rsui: -- "$@");
    eval set -- "$ARGS";

    if [ "$1" == -r ];then
      UPDATE_SRC_REPO_SYNC=true
    elif [ "$1" == -u ];then
      UPDATE_OPENGROK=true
    elif [ "$1" == -s ];then
      START_OPENGROK=true;
    elif [ "$1" == -i ];then
      INDEXING_OPENGROK=true;
      SRC_PATH=`readlink -ev $2`
    fi 
}

function main()
{
    echo "open grok source indexing : "
    echo "      ==>   $SRC_PATH"
    if [ $START_OPENGROK == "true" ];then
	sudo /var/opengrok/bin/OpenGrok clearHistory
        sleep 1
        sudo /var/opengrok/bin/OpenGrok deploy
        sleep 1
        sudo /var/opengrok/bin/OpenGrok index $1
    elif [ $UPDATE_OPENGROK == true ];then
        sudo /var/opengrok/bin/OpenGrok update
    elif [ $INDEXING_OPENGROK == "true" ];then
        sudo /var/opengrok/bin/OpenGrok index $SRC_PATH
    elif [ $UPDATE_SRC_REPO_SYNC == "true" ]; then
        cd $OPENGROK_ORG_SOURCE_PATH/Artik7
	repo sync
	cd ..

	cd $OPENGROK_ORG_SOURCE_PATH/repoYocto
	repo sync
	cd ..
    else
	echo "check usage!!"
    fi
}

parse_args $@
main
