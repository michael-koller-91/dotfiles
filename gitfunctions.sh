#!/usr/bin/env bash

GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)

basediff() {
  if [ "$1" == "-h" ]; then
    echo "Example usage: basediff main dev file.txt"
    echo "Find the merge base (= fork point) between main and dev. Show the diff of file.txt between dev and the merge base."
    exit 0
  fi

  git diff $(git merge-base $1 --fork-point $2) $2 $3
}

diff() {
  if [ "$1" == "-h" ]; then
    echo "Example usage: diff 1"
    echo "Show the diff of the first file that git status lists."
    exit 0
  fi

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
  local idx=$2

  # select file, resulting in a string like:
  #  M example.sh
  # or:
  # ?? another_example.sh
  file=${array[--idx]}

  # split selected file string at whitespace, resulting in a string like:
  # example.sh
  # or:
  # another_example.sh
  file=${file##*[[:space:]]}

  echo "$file"
}

stage() {
  if [ "$1" == "-h" ]; then
    echo "Example usage: stage 1"
    echo "Stage the first file that git status lists."
    exit 0
  fi

  local git_status_array
  get_status_files git_status_array

  local file=$(select_file git_status_array $1)

  git add $file
}

status() {
  if [ "$1" == "-h" ]; then
    echo "Example usage: status"
    echo "Show the branch and tracking info in short-format."
    exit 0
  fi

  local git_status_array
  get_status_files git_status_array

  local s sub
  local first second
  for i in "${!git_status_array[@]}"; do
    s=${git_status_array[$i]}
    sub=${s:2}
    first=${s:0:1}
    second=${s:1:1}
    printf "%3i: ${GREEN}$first${RED}$second${NORMAL}$sub\n" $((i+1))
  done
}

summary() {
  if [ "$1" == "-h" ]; then
    echo "Example usage: summary"
    echo "Output a condensed summary of extended header information."
    exit 0
  fi

  git diff --compact-summary
}

unstage() {
  if [ "$1" == "-h" ]; then
    echo "Example usage: unstage 1"
    echo "Unstage the first file that git status lists."
    exit 0
  fi

  local git_status_array
  get_status_files git_status_array

  local file=$(select_file git_status_array $1)

  git restore --staged $file
}

"$@"

