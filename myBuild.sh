#! /bin/bash

BUILD_TARGET="f6_tmo_us"
LOCKSCREEN_PATH="./vendor/lge/apps/LockScreen3/"
REPLACE_STR="Swipe in any direction"
IS_NEED_ENVSETUP=$1
BUILD_MODULE=$2
TAG_STR=$3
J_BUILD_OPTION='-j4'

#choosecombo
function step1() {
	echo "start envsetup and choosecombo..."
	source build/envsetup.sh
	choosecombo 1 $BUILD_TARGET 2
	echo "=========================================================================="
	echo " step1 was Done!! "
	echo "=========================================================================="
}

#LockScreen build
function step2() {
	echo "start replace tagging on the LockScreen3 display and LockScreen3 making..."
	cd $LOCKSCREEN_PATH
	~/replace.sh "$REPLACE_STR" "$TAG_STR"
	echo "======================================================================================================"
	echo " step2 - TAG STRING was changed is complete!! "
	echo "======================================================================================================"
	mm
	echo "======================================================================================================"
	echo " step2 - LockScreen3 was Compiled, It was Done!! "
	echo "======================================================================================================"
	T=$(gettop)
	if [ ! "$T" ]; then
        echo "Couldn't locate the top of the tree.  Try setting TOP." >&2
	    return
	else
		cd $T
	fi
}
function step3() {
	echo "start build module " $BUILD_MODULE "is building..."
	make $BUILD_MODULE $J_BUILD_OPTION
	echo "========================================================================================="
	echo " step3 - module build complete!! "
	echo "========================================================================================="
}

function help_message() {
	echo "-------------------------------------------- Help Page --------------------------------------------"
	echo "usage : myBuild.sh <IS_NEED_ENVSETUP> <BUILD_MODULE> <TAR_STR> "
	echo "		ex) ~/myBuild.sh t aboot QE1_GPIO50_Strength_8mA"
	echo "		ex) ~/myBuild.sh t kernel TOUCH_FIRMWARE_VER2 test "
	echo "		ex) ~/myBuild.sh f kernel "
	echo "		ex) ~/myBuild.sh f kernel TOUCH_FIRMWARE_VER3 test "
	echo ""
	echo " First parameter description"
	echo "     t : source build/envsetup.sh; choosecombo 1 f6_tmo_us 2 "
	echo "     f : envsetup step is skip "
	echo " Second parameter description"
	echo "     module name : kernel or aboot or etc... building. "
	echo " Third parameter description"
	echo "     If anything exist third option, It was working changed for LockScreen displayed your tag strings. "
	echo "---------------------------------------------------------------------------------------------------"
}

#function _RUN_()	{
	if [ $# -eq 3 ];then
		echo "------------------------------------------- build start -------------------------------------------"
		echo "  You are selected the TAGGING"
		echo "  Now Start!!!"
		echo "---------------------------------------------------------------------------------------------------"
		if [ $IS_NEED_ENVSETUP == 't' ];then
			echo " You are selected envsetup.sh and choosecombo "
			echo "---------------------------------------------------------------------------------------------------"
			step1	#envsetup, choosecombo
			step2	#tagging
			step3	#module build
		elif [ $IS_NEED_ENVSETUP == 'f' ];then
			echo " You are not selected envsetup.sh and choosecombo "
			echo "---------------------------------------------------------------------------------------------------"
			step2	#tagging
			step3   #module build
		else
			echo "----------"
			echo " error1 !! "
			echo "---------"
			help_message
		fi
	elif [ $# -eq 2 ];then
		echo "------------------------------------------ build start --------------------------------------------"
		echo "  You are selected just module build"
		echo "  Now start!!!!"
		echo "---------------------------------------------------------------------------------------------------"
		if [ $IS_NEED_ENVSETUP == 't' ];then
			echo " You are selected envsetup.sh and choosecombo "
			echo "---------------------------------------------------------------------------------------------------"
			step1	#envsetup, choosecombo
			step3	#module build
		elif [ $IS_NEED_ENVSETUP == 'f' ];then
			echo " You are not selected envsetup.sh and choosecombo "
			echo "---------------------------------------------------------------------------------------------------"
			step3   #module build
		else
			echo "---------"
			echo " error2 !! "
			echo "---------"
			help_message
		fi
	else
		echo "---------------------------------------------error!!-----------------------------------------------"
		echo "	 			        Check parameters!!!    							             "
		echo "---------------------------------------------------------------------------------------------------"
		help_message
	fi
#}

#_RUN_
