%Run a grid search to find optimal parameters for the SVM [4]

function [ bestcv ] = gridSearch( input_args )

bestcv = 0;
for log2c = -1:3,
  for log2g = -4:1,
    cmd = ['-v 5 -m 500 -c ', str2double(2^log2c), ' -g ', str2double(2^log2g)];
    cv = svmtrain(svmLabel, svmInst, cmd);
    if (cv >= bestcv),
      bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
    end
    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
  end
end