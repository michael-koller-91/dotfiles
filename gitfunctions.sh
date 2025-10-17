#!/usr/bin/env bash

add() {
  local git_status_array
  get_status_files git_status_array

  local file=$(select_file git_status_array $1)

  git add $file
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

  for i in "${!git_status_array[@]}"; do
    printf "%3i: ${git_status_array[$i]}\n" $i
  done
}

"$@"
