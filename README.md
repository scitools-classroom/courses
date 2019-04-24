# Python Courses for the Scientific Researcher

This repository contains courses on several Python software packages
for the benefit of scientific researchers,
particularly in the fields of oceanography and meteorology.  
All the content is fully open-source and freely downloadable.

These courses are presented as interactive self-learning tutorials,
contained in ["Jupyter notebooks"](https://jupyter.org/index.html).
The user will run the notebook interactively, and will also edit it and run
their own code, particularly to complete the set learning exercises.

## Download and Run Courses

The most flexible learning method is to download this repository and run it in a
Python environment with the correct dependencies.  

A suitable environment can be produced with
[conda](https://docs.conda.io/en/latest/miniconda.html")
(only 'miniconda' is needed).  
To create the environment, use the command: 
`conda create -n testenv iris iris-sample-data jupyter`.  

To run the courses, navigate to the repository 'course_content' folder
and run: `jupyter notebook`.

## Run Courses in Binder

It is also possible to run any of these courses in a cloud instance
with [Binder](https://mybinder.org/),
simply by following the links provided below.  

This is quick to try, and highly convenient,
**however** you must be aware that this runs in a transient session,
so all your edits will be lost when that expires
(usually some 10s of minutes after the last interaction).  

It is possible to download your modified notebook before the session times out,
but not (easily) to re-upload and run it again in Binder.

## Principal Courses
There are two main courses provided :

### A First Look at Cartopy (for Iris)
0.5 hours &mdash; depends on basic knowledge of matplotlib
(see options below):  
  * in `course_content/cartopy_course/cartopy_intro.ipynb`
  * launch in binder [here](https://mybinder.org/v2/gh/SciTools/courses/master?filepath=course_content%2Fcartopy_course%2Fcartopy_intro.ipynb)

### An Introduction to Iris
6 hours &mdash; depends on the "Cartopy in a nutshell" course:  
  * start from `course_content/iris_course/0.Iris_Course_Intro.ipynb`
  * launch in binder [here](https://mybinder.org/v2/gh/SciTools/courses/master?filepath=course_content%2Firis_course)

_Note: to run this course fully, you need to have installed_
_not only iris and its dependencies,_
_but also [iris-sample-data](https://github.com/SciTools/iris-sample-data)_
_(it requires to be importable as a package)._

----

## Additional Learning Resources

There are also two older courses included here,
covering numpy and matplotlib at an entry level.

However, these sources are no longer actively maintained.  
As a similar fast introduction to numpy and matplotlib,
we can recommend the sections on those topics
in [the Scipy lectures](http://scipy-lectures.org/index.html).  
For more detail, in time, you should also refer to the standard tutorials
for those projects.

The older Scitools course contents are here :

#### An Introduction to Numpy
3.5 hours &mdash; depends on a basic Python background
  * in `course_content/extra_courses/numpy_intro.ipynb`
  * launch in Binder [here](https://mybinder.org/v2/gh/SciTools/courses/master?filepath=course_content%2Fextra_courses%2Fnumpy_intro.ipynb)

#### An Introduction to Matplotlib
3 hours &mdash; depends on a knowledge of numpy
  * in `course_content/extra_courses/matplotlib_intro.ipynb`
  * launch in binder [here](https://mybinder.org/v2/gh/SciTools/courses/master?filepath=course_content%2Fextra_courses%2Fmatplotlib_intro.ipynb)
