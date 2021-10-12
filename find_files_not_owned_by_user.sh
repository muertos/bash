# this reports back if any files or folders found are not owned by owner/group of $1
function find_files() {
  cur_user=$(stat -c "%U" "$1")
  cur_group=$(stat -c "%G" "$1")
  findings=$(find "$1" -not -user $cur_user -not -group $cur_group)
  if [[ "$findings" == "" ]]; then
    echo "looks like all files and folders in $1 are owned and grouped by $cur_user:$cur_group"
  else
    echo "found files and folders not owned by $cur_user:$cur_group ->"
    find "$1" -not -user $cur_user -not -group $cur_group
  fi
}
