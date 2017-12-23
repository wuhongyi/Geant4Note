#!/bin/bash

rm -r docs

gitbook build

mv _book docs

git add --all
git commit -m ""
git push -u origin master
