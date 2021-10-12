function echo_color() {
  declare -A colors=(
    [red]="\e[31m"
    [blue]="\e[34m"
    [green]="\e[32m"
    [yellow]="\e[33m"
    [purple]="\e[35m"
  )

  echo -e "${colors[$2]}$1\e[0m"
}
