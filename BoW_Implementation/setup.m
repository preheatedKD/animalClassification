% SETUP  Add the required search paths to MATLAB
if exist('vl_version') ~= 3, run('vlfeat/toolbox/vl_setup') ; end
addpath('bagOfWords')
addpath(genpath('libsvm-3.14'))