#!/usr/bin/env bash

# Fail on first exception.
set -e

# Clean out the build folder then replace the files we need to keep.
rm -rf build/*
cp .gitignore LICENSE README.md build

# Set up the folders we will need.
mkdir -p build/html
mkdir -p build/notebooks
mkdir -p build/solutions

cd build
cp -rf ../course_content/images images
cp -rf ../course_content/resources resources

for name in "numpy_intro" "matplotlib_intro" "cartopy_intro" "iris_intro"
do
    #ipython nbconvert --to slides ../../course_content/${name}.ipynb
    # Build static (html) copies of the course content.
    jupyter nbconvert --to html ../course_content/notebooks/${name}.ipynb
    mv ../course_content/notebooks/*.html ./html/
    # Make IPython notebooks of the course content with cell output cleared.
    python ../utils/nbutil.py ../course_content/notebooks/${name}.ipynb ./notebooks/${name}.ipynb --clear-output
done

for name in "numpy_exercise_1.ipynb" "numpy_exercise_2.ipynb" "matplotlib_exercise_2.ipynb" "matplotlib_exercise_3.ipynb" "cartopy_exercise_1.ipynb" "iris_exercise_1.ipynb" "iris_exercise_2.ipynb" "iris_exercise_3.ipynb" "iris_exercise_4.ipynb" "iris_exercise_5.ipynb" "iris_exercise_6.ipynb" "iris_exercise_7.ipynb"
do
    python ../utils/nbutil.py ../course_content/solutions/${name} ./solutions/${name}
done


#.reveal aside.notes {
#   visibility: inline;
#}



