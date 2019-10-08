#!/bin/bash

git clone https://bitbucket.org/yasinovskyy/dt-proficiency-todo/src/master/

git branch dirty
git checkout dirty

find . -type f -iname "*.pyc" -execdir rm {} \;
find . -type d -iname "__pycache__" -execdir rm -rf {} \;

find . -type f -iname "*.class" -execdir rm {} \;
find . -type f -iname "*.out" -execdir rm {} \;

find . -type f -iname "*.txt" -execdir rm {} \;

git add *

git commit -m "Clean the repository"

git checkout master

git merge master dirty

git push oriin --delete dirty
