#!/bin/bash

clear

node scripts/clean.js

git add .
git commit -m "step"
git push
