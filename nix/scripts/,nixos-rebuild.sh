#!/usr/bin/env bash

MSG = "nixos-gen ${date +%R_%D}"

is_git_clean() {
    local is_clean
    is_clean=$(git status --procelain >/dev/null)
    if [ -z "$is_clean" ]; then
        return 0
    else
        return 1
    fi
}

rebuild_nixos {

}



echo commit message is $MSG

if is_git_clean; then
    echo repo clean
else
    echo repo has changes
fi




