#!/bin/bash
set -- $(getopt -q pc:n: "$@")
#
current_branch=`git symbolic-ref --short -q HEAD`

function create_new_branch {
  new_branch="$2"
  `git checkout -b $new_branch`
}

function checkout_branch {
    target_branch="$2"
    `git checkout $target_branch; git pull origin $target_branch`
}

echo 
while [ -n "$1" ]
do
    case "$1" in
    -p) echo excute pull cmd in brach: $current_branch ;;
    -n) create_new_branch ;;
    -c) checkout_branch ;;
    esac
done
