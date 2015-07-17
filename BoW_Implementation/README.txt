1. type 'setup' with the vlfeat library in the same directory as these files
2. type 'makeVocab' to make the vocabulary from visual words
3. type 'runTest' to create the histograms - creates a Weka.arff file as well
4. gridSearch can be used to find optiomal parameters of SVM

Or just run the 'auto' script.
--
Some of the for loops were done using parfor command so the runtime can be decreased by using the command 'matlabpool open local X' where X is the number of processor cores
SVM type can be modified in runTest.m file 


    

[1] O. M. Parkhi, A. Vedaldi, A. Zisserman and C. V. Jawahar. Cats and dogs. Presented at IEEE Conference on Computer Vision and Pattern Recognition. 2012, . 
http://www.robots.ox.ac.uk/~vgg/data/pets/

[2] A. Vedaldi and A. Zisserman, "Image Classification Practical, 2011," vol. 2013, 2011. 
http://www.robots.ox.ac.uk/~vgg/share/practical-image-classification.htm

VLFeat library - Version 0.9.13 used:
[3] A. Vedaldi and B. Fulkerson. VLFeat - an open and portable library of computer vision algorithms. Presented at ACM International Conference on Multimedia. 2010, . 
http://www.vlfeat.org/download.html

LIBSVM:
[4] C. Chang and C. Lin. LIBSVM: A library for support vector machines. ACM Transactions on Intelligent Systems and Technology 2(3), pp. 27:1-27:27. 2011. 
http://www.csie.ntu.edu.tw/~cjlin/libsvm/#download

xml2Struct:
[5] W. Falkena (under BSD License)
http://www.mathworks.com/matlabcentral/fileexchange/28518-xml2struct