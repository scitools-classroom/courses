#!/usr/bin/env bash

# Fail on first exception.
set -e

# Clean out the build folder then replace the files we need to keep.
mkdir -p build
rm -rf build/*
cp .gitignore LICENSE README.md build

# Set up the folders we will need.
mkdir -p build/html
mkdir -p build/notebooks
mkdir -p build/solutions

cd build
cp -Rf ../course_content/images images
cp -Rf ../course_content/resources resources

for name in "numpy_intro" "matplotlib_intro" "cartopy_intro" "iris_intro"
do
    #ipython nbconvert --to slides ../../course_content/${name}.ipynb
    #jupyter nbconvert --to notebook ../course_content/notebooks/${name}.ipynb --execute --allow-errors
    
    # Build static (html) copies of the course content.
    jupyter nbconvert --to html ../course_content/notebooks/${name}.ipynb --output-dir ./html/
done

