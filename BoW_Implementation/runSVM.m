fprintf('\nCreating SVM \n');



%Use a support vector machine - from [4]
[svmLabel, svmInst] = libsvmread('histograms.txt');

%Run SVM using parameters below with '-v 10' as 10 fold cross validation
%model= svmtrain(svmLabel,svmInst, '-c 100  -t 0 -m 500 -v 10');

%Use Grid search to find optimal meta-parameters for SVM - from [4]
bestcv =0; 
for log2c =-1:3
  for log2g =-1:4,
  cmd = ['-v 2 -m 500 -q -t 2  -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
  bestcv=-inf;
  % cmd = ['-v 10 -m 500 -c ', num2str(2^log2c)]% ' -g ', num2str(2^log2g)];
    cv = svmtrain(svmLabel, svmInst, cmd);
    if (cv >= bestcv),
      bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
       fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
    end
   
  end
  
end
