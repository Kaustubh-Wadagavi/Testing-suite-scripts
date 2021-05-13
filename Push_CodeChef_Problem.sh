#! /bin/bash

fileName=$1
commitMessage=$2
mv /home/krishagni/Downloads/undefined.cpp /home/krishagni/Desktop/CodeChef-Design-Problem/$fileName
cd
cd Desktop/CodeChef-Design-Problem
git status
git add -A
git commit -m "$commitMessage"
git push origin master

