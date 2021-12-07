# Obtains list of all Docker volumes and sorts by size, descending
function sort-docker-volumes() {
  while read volume; do
    docker volume inspect $volume | jq -r .[].Mountpoint
  done <<< \
    $(docker volume ls | awk '{print $2}' | grep -v VOLUME) | \
    xargs du -sh | sort -rh
}
