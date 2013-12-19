#!/bin/sh
echo 'copying files into abelsonlive.github.com/ ...'
cd ../abelsonlive.github.com
ls | xargs rm -rf
cd ../_site_
cp -r _site/* ../abelsonlive.github.com/
cd ../abelsonlive.github.com
echo 'pushing to git...'
git add .
git commit -m'$1'
git push origin master