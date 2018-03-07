#!/usr/bin/env bash

# Fail on first exception.
set -e

PROG=$(basename ${0})

# Clean out the build folder then replace the files we need to keep.
[ -d "./build" ] && rm -rf build/* || mkdir build
cp .gitignore LICENSE README.md build

# Set up the folders we will need.
mkdir -p build/html
mkdir -p build/notebooks
mkdir -p build/solutions

# Change to the local build directory.
cd build

# All directories are relative to the build directory.
CONTENT_DIR="../course_content"
IMAGES_DIR="${CONTENT_DIR}/images"
RESOURCES_DIR="${CONTENT_DIR}/resources"
NOTEBOOKS_DIR="${CONTENT_DIR}/notebooks"

# Check required source course content directories exist.
for DIR in "${IMAGES_DIR}" "${RESOURCES_DIR}" "${NOTEBOOKS_DIR}"
do
    [ ! -d "${DIR}" ] && echo "${PROG}: Missing directory, \"${DIR}\"" && exit 1
done

# Copy required resources to the local build directory.
cp -rf ${IMAGES_DIR} images
cp -rf ${RESOURCES_DIR} resources

# Enumerate the course content notebooks.
NOTEBOOKS=$(ls -1 ${NOTEBOOKS_DIR}/*.ipynb)

# Build static (HTML) copies of the course content.
for NOTEBOOK in ${NOTEBOOKS}
do
    jupyter nbconvert --to html ${NOTEBOOK}
    echo
done

# Move built static (HTML) content to the local build directory.
mv ${NOTEBOOKS_DIR}/*.html html



