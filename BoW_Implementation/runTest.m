%Remove all previous histogram files and histograms that have been computed
%earlier - building on work from [2]

delete 'histograms.txt';
delete kdoerr/dogTest/*.mat
delete kdoerr/dogTest/Thumbs.db
delete kdoerr/catTest/*.mat
delete kdoerr/catTest/Thumbs.db
delete 'Thumbs.db'


%Load vocabulary that was computed from training images
vocabulary = load('vocabulary.mat') ;

%Compute positive (cats) histograms  
pos.names = getImageSet('kdoerr/catTest') ;
pos.histograms = computeHistogramsFromImageList(vocabulary, pos.names, 'kdoerr/catTest') ;

%Compute negative (dogs) histograms
neg.names = getImageSet('kdoerr/dogTest') ;
neg.histograms = computeHistogramsFromImageList(vocabulary, neg.names, 'kdoerr/dogTest') ;

%Concatenate the two histrograms
testNames = {pos.names{:}, neg.names{:}};
testHistograms = [pos.histograms, neg.histograms] ;

%Label examples as positive (+1) or negative (-1)
testLabels = [ones(1,numel(pos.names)), - ones(1,numel(neg.names))] ;

%Delete variables no longer needed
clear pos neg;

%l1norm
%testHistograms=testHistograms./(ones(size(testHistograms))*diag(sum(abs(testHistograms))));

%L2 normalize the histograms
% testHistograms = bsxfun(@times, testHistograms, 1./sqrt(sum(testHistograms.^2,1)));

%Scale the histograms from [0,1]
a=testHistograms';
minimumA=min(a);
range(a);

for x=1:length(testHistograms)
    a2(:,x)=a(:,x)-minimumA(x);
end

maA=max(a2);

for x=1:length(testHistograms)
    if maA(x)>0
      newMat(:,x)=a2(:,x)/maA(x) ;        
    else
        newMat(:,x)=0;
    end
end

values=[testLabels',newMat];

%values=[testLabels',testHistograms'];

fprintf('\nWriting histograms to text file \n');


%Write out the labels and histograms into a format that can be processed by
%LIBSVM
fileID=fopen('histograms.txt','w');
for r=1:length(testLabels)
 fprintf(fileID,'%d ',values(r,1));
for z=2:length(values)
fprintf(fileID,'%d:%d ',z-1,values(r,z));
end
fprintf(fileID,'\n');
end
fclose(fileID);
type 'histograms.txt'


fileID=fopen('histogramsWeka.arff','w');

fprintf(fileID,'@relation imageClassification\n');
for r=1:length(values)-1
fprintf(fileID,'@attribute %d numeric \n',r);
end
fprintf(fileID,'@attribute animal {1,-1}\n');
fprintf(fileID,'@data\n');

for r=1:length(testLabels)
 
for z=2:length(values)
fprintf(fileID,'%d,',values(r,z));
end
fprintf(fileID,'%d',values(r,1));
fprintf(fileID,'\n');
end
fclose(fileID);

%After writing to file, close it
fclose all;

%Delete histogram files as they are written to a text file
delete kdoerr/dogTest/*.mat;
delete kdoerr/catTest/*.mat;





