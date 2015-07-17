function histograms = computeHistogramsFromImageList(vocabulary, names, cache)
% COMPUTEHISGORAMSFROMIMAGELIST  Compute historams for multiple images
%   HISTOGRAMS = COMPUTEHISTOGRAMSFROMIMAGELIST(VOCABULARY, NAMES)
%   computes the histograms of visual words for the list of image
%   paths NAMES by applying iteratively
%   COMPUTEHISTOGRAMFROMIMAGE().
%
%   COMPUTEHISTOGRAMSFROMIMAGELIST(VOCABULARY, NAMES, CACHE) caches
%   the results to the CACHE directory.

% Author: Andrea Vedaldi

start = tic ;
parfor i = 1:length(names)%*2%add *2 later
  if exist(names{i}, 'file')
    fullPath = names{i} ;
  else
    fullPath = fullfile('Test',[names{i}]) ;
  end
  fprintf('Extracting histogram from %s (time remaining %.2fs)\n', fullPath, ...
          (length(names)-i) * toc(start)/i) ;
  histograms{i} = computeHistogramFromImage(vocabulary, fullPath) ;
end
histograms = [histograms{:}] ;

