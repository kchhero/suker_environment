#!/bin/sh
# suker : 2012.11.29
# choonghyun.jeon@lge.com

# Local Variable Define
TARGET_NAME=$1

PROJECT_ROOT=msm8930
PROJECT_NAME=fx3
NON_HLOS_ROOT=non_HLOS
ANDROID_ROOT=android

BASE_DIR_ANDROID=${PROJECT_ROOT}/${PROJECT_NAME}/${ANDROID_ROOT}
BASE_DIR_MODEM=${PROJECT_ROOT}/${PROJECT_NAME}/${NON_HLOS_ROOT}

ANDROID_CTAGS_LIST1=bionic
ANDROID_CTAGS_LIST2=bootable
ANDROID_CTAGS_LIST3=device
ANDROID_CTAGS_LIST4=external
ANDROID_CTAGS_LIST5=frameworks
ANDROID_CTAGS_LIST6=kernel
ANDROID_CTAGS_LIST7=ndk
ANDROID_CTAGS_LIST8=system
ANDROID_CTAGS_LIST9=vendor

if [ "$TARGET_NAME" = "reuse" ]; then
	# make cscope
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST1}
	echo "working path ===>" 
	pwd
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST2}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST3}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST4}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST5}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST6}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST7}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST8}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST9}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh . -reuse
else
	# make cscope
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST1}
	echo "working path ===>" 
	pwd
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST2}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST3}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST4}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST5}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST6}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST7}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST8}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
	cd ~/${BASE_DIR_ANDROID}/${ANDROID_CTAGS_LIST9}
	echo "working path ===>" 
	pwd	
	~/mkcscope.sh .
fi
