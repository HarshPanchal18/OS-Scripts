#!/bin/bash

# Checkout all remote branches
for remote in `git branch -r | cut -f1 | grep -Ev '(HEAD|master)'`;do
    git checkout -b "${remote#origin/}" "${remote}"
done

git fetch --all
git pull --all
