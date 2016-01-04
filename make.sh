#!/usr/bin/env bash

# Fail on first exception.
set -e

mkdir -p build
cd build
cp -rf ../course_content/images images

for name in "numpy_intro" "matplotlib_intro" "cartopy_intro" "iris_intro"
do
    #ipython nbconvert --to slides ../course_content/${name}.ipynb
    jupyter nbconvert --to html ../course_content/${name}.ipynb
    python ../utils/nbutil.py ../course_content/${name}.ipynb ${name}.ipynb --clear-output
done


for name in "numpy_exercise_1.ipynb" "numpy_exercise_2.ipynb" "matplotlib_exercise_2.ipynb" "matplotlib_exercise_3.ipynb" "cartopy_exercise_1.ipynb" "iris_exercise_1.ipynb" "iris_exercise_2.ipynb" "iris_exercise_3.ipynb" "iris_exercise_4.ipynb" "iris_exercise_5.ipynb" "iris_exercise_6.ipynb" "iris_exercise_7.ipynb"
do
    python ../utils/nbutil.py ../course_content/solutions/${name} ${name} --clear-code --clear-output
done


#.reveal aside.notes {
#   visibility: inline;
#}



