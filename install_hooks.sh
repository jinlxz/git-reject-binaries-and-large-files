#!/bin/bash
script_path=$(cd $(dirname $0); pwd -P)
working_dir=$(pwd -P)
scriptname=$(basename $0)
if ! [ -d .git ];then
  1>&2 echo "Error: current directory is not a git repository, this script should be started from the root folder of a git resitory."
  exit 10
fi
for file in ${script_path}/*.sh;do
  hookname=$(basename $file)
  hook_target_path="$working_dir/.git/hooks/${hookname%.sh}"
  if [ "$hookname" = "$scriptname" ];then continue; fi
  cp ${file} ${hook_target_path}
  chmod +x ${hook_target_path}
done
echo "Hooks installed successfully."
