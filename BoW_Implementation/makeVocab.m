%Build vocabulary from training images

%Setup vlfeat
setup 
clear;clc;
%Remove previous vocabulary files
delete 'vocabulary.mat';
delete 'Thumbs.db'

%load training examples of cats and dogs
names{1} = getImageSet('kdoerr/catTrain') ;
names{2} = getImageSet('kdoerr/dogTrain') ;


knames=cat(1,names{1})'; 
knames2=cat(1,names{2})'; 

names=[knames;knames2];


%compute vocabulary from image list
if ~exist('vocabulary.mat')
  vocabulary = computeVocabularyFromImageList(vl_colsubset(names,5374,'uniform')) ;
  save('vocabulary.mat', '-STRUCT', 'vocabulary') ;
else
  vocabulary = load('vocabulary.mat') ;
end


%clear;clc;
delete 'Thumbs.db';
