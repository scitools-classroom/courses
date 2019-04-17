#!/usr/bin/env bash

# Fail on first exception.
set -e

# Clean out the build folder then replace the files we need to keep.
mkdir -p build
rm -rf build/*
cp .gitignore LICENSE README.md build


cd build

# Set up the folders we will need.
mkdir -p html
for dirname in extra_courses cartopy_course iris_course
    do
        mkdir -p extra
    done

cp -Rf ../course_content/extra_courses/images extra_courses/images
cp -Rf ../course_content/iris_course/images iris_course/images
cp -Rf ../course_content/iris_course/resources iris_course/resources


process_notebooks () {
    notebook_file=$1
    dirname=$2

    echo "Executing $notebook_file"

    jupyter nbconvert --to notebook \
        $dirname/$notebook_file \
        --ExecutePreprocessor.kernel_name=python3 \
        --ExecutePreprocessor.timeout=180 \
        --execute --allow-errors \
        --output-dir $dirname \
        --output $notebook_file
}


for dirname in extra_courses cartopy_course iris_course
    for notebook_file in $(ls ../course_content/$dirname/*.ipynb)
        do
            process_notebooks $dirname $notebook_file
        done

    for notebook_file in $(ls $dirname/solutions/*.ipynb)
        do
            process_notebooks $dirname/solutions $notebook_file
        done
      

ls -l */*
