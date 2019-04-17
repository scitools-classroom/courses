#!/usr/bin/env bash

# Fail on first exception.
set -e

process_notebooks () {
    notebook_file=$1
    dirname=$2

    echo "Executing $notebook_file"

    jupyter nbconvert --to notebook \
        $dirname/$notebook_file \
        --ExecutePreprocessor.kernel_name=python3 \
        --ExecutePreprocessor.timeout=180 \
        --execute --allow-errors \
}


for dirname in extra_courses cartopy_course iris_course
    for notebook_file in $(ls course_content/$dirname/*.ipynb)
        do
            process_notebooks $dirname $notebook_file
        done

    for notebook_file in $(ls $dirname/solutions/*.ipynb)
        do
            process_notebooks $dirname/solutions $notebook_file
        done
      

ls -l */*
