function [new_X] = mkInitialLabel(trainLabels)

% nr=featureEng.nrows;
% nc=featureEng.ncols;
% nl=featureEng.nlevs;

 nstates=23; %%%Min's data
% % %nstates=34; %%%Twu's data

% load demos\data\trainLabels;
X = nstates-trainLabels;  %%%% Reversing
clear trainLabels;
new_X= mode(X,4);
new_X=nstates+1-new_X;