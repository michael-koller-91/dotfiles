#!/usr/bin/env bash

GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)

add() {
  local git_status_array
  get_status_files git_status_array

  local file=$(select_file git_status_array $1)

  git add $file
}

diff() {
  local git_status_array
  get_status_files git_status_array

  local file=$(select_file git_status_array $1)

  git diff HEAD $file
}

get_status_files() {
  # split git status at newlines into an array
  local git_status=$(git status --porcelain)
  local -n array=$1
  IFS=$'\n' read -ra array -d "\r\n" <<< "$git_status"
}

select_file() {
  local -n array=$1
  local file

  # select file, resulting in a string like:
  #  M example.sh
  # or:
  # ?? another_example.sh
  file=${array[$2]}

  # split selected file string at whitespace, resulting in a string like:
  # example.sh
  # or:
  # another_example.sh
  file=${file##*[[:space:]]}

  echo "$file"
}

subtract() {
  local git_status_array
  get_status_files git_status_array

  local file=$(select_file git_status_array $1)

  git restore --staged $file
}

status() {
  local git_status_array
  get_status_files git_status_array

  local s sub
  local first second
  for i in "${!git_status_array[@]}"; do
    s=${git_status_array[$i]}
    sub=${s:2}
    first=${s:0:1}
    second=${s:1:1}
    printf "%3i: ${GREEN}$first${RED}$second${NORMAL}$sub\n" $i
  done
}

"$@"
