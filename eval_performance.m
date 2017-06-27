function [AVOP AVDP] = eval_performance(cases, X);

[s1] = Gen_CV_test(cases);
[TrueFalseMat] = eval_accuracy(s1,X-1);
AVOP=mean(TrueFalseMat(5,2:end-1));
AVDP=mean(TrueFalseMat(6,2:end-1));