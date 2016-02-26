#!/bin/bash
# get diff. script
#     old/new diff. dir is generated automatically based repo dir.
# youngrok.song@lge.com

reporoot()
{
   current_path=$(pwd)
   
   while [ ! -d .repo ]; do
      cd ..
      changed=$?
      #echo "searching: $(pwd)"
      if [ $changed -ne 0 -o $(pwd) = "/" ]; then
         echo "not found"
         cd $current_path
         return 1
      fi
   done
   
   return 0
}

rm -rf diff_old diff_new
if [ -d .git ]; then
	git difftool -y -x '~/oldnew.sh' $1 $2
else
	echo there is no git directory! && exit 1
fi

echo "[ $(pwd) ]"
if [ -d diff_old ] && [ -d diff_new ]; then	
	git_dir=$(pwd)
	pushd $(pwd) > /dev/null && reporoot && repo_flag=$?
	
	if [ $repo_flag -ne 0 ]; then
		echo reporoot returned $repo_flag && exit 1
	fi
	git_dir=${git_dir#"$(pwd)/"}
	diff_dir=$(pwd)/diff_"$1"_vs_"$2"
	diff_file_list="$diff_dir"/"diff_$1_vs_$2"_git_list.txt
	if [ ! -d  $diff_dir ]; then		
		mkdir -p $diff_dir && echo diff_dir is $diff_dir
	fi
	
	rm -rf $diff_dir/old/$git_dir $diff_dir/new/$git_dir
	mkdir -p $diff_dir/old/$git_dir $diff_dir/new/$git_dir	
	popd > /dev/null
	gitlog="$(git log --oneline $1..$2)"	
	echo -e "$gitlog" && echo -e "$git_dir\n""$gitlog\n" >> $diff_file_list	
	mv diff_old/* $diff_dir/old/$git_dir/ && mv diff_new/* $diff_dir/new/$git_dir/	
	rm -rf diff_old diff_new
else
	echo "  no diff."
fi
