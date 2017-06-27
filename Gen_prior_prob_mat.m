%%% Generate the location prior and initial label for each CV
%%% training set
clear;

test=1;
[prior_prob,new_X] = mkPriorProb(test);
save prior_prob_test#1 prior_prob;
save InitLabel_test#1 new_X;
clear;

test=2;
[prior_prob,new_X] = mkPriorProb(test);
save prior_prob_test#2 prior_prob;
save InitLabel_test#2 new_X;
clear;

test=3;
[prior_prob,new_X] = mkPriorProb(test);
save prior_prob_test#3 prior_prob;
save InitLabel_test#3 new_X;
clear;


test=4;
[prior_prob,new_X] = mkPriorProb(test);
save prior_prob_test#4 prior_prob;
save InitLabel_test#4 new_X;
clear;


test=5;
[prior_prob,new_X] = mkPriorProb(test);
save prior_prob_test#5 prior_prob;
save InitLabel_test#5 new_X;
