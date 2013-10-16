mkdir -p build
cd build
cp -rf ../course_content/images images

for name in "numpy_intro" "matplotlib_intro" "cartopy_intro" "iris_intro"
do
    ipython nbconvert --to slides ../course_content/${name}.ipynb
    ipython nbconvert --to html ../course_content/${name}.ipynb
done


#ipython nbconvert --to slides 05_NumpyIntro.ipynb
#ipython nbconvert 05_NumpyIntro.ipynb --to html


# Add a title to the theme css
# Add the following line afterwards to allow the "print" preview to be seen: <link rel="alternate stylesheet" href="reveal.js/css/print/paper.css" type="text/css" title="print">

#.reveal aside.notes {
#   visibility: inline;
#}



