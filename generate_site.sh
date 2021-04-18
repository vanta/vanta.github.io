#!/bin/bash

./pages.sh 5 | ./site.sh > ~/src/vanta.github.io/nds.html

cd ~/src/vanta.github.io

git add .
git commit -m "Update results"
git push origin master

cd -
