function [intens_prob, new_X, int_param] = Gen_CV_trainset_new(cases, tt1)

%%% k=index of the test set
% tt1='data/predict_slr_5k_test';
% tt='_with_prob_feat_T2';
 tt1='model_1k_prob_feat_T2_b_c1_g0_#';

switch cases
   case 1
      opt=strcat(tt1,num2str(cases)); load (opt);
%       load data/prior_prob_test#1;
      load data/InitLabel_test#1;  
      load data/int_param_test#1;
   case 2
      opt=strcat(tt1,num2str(cases)); load (opt);
%       load data/prior_prob_test#2;
      load data/InitLabel_test#2;
      load data/int_param_test#2;
   case 3
      opt=strcat(tt1,num2str(cases)); load (opt);
%       load data/prior_prob_test#3;
      load data/InitLabel_test#3;
      load data/int_param_test#3;
   case 4
      opt=strcat(tt1,num2str(cases)); load (opt);
%       load data/prior_prob_test#4;
      load data/InitLabel_test#4;
      load data/int_param_test#4;
   case 5
      opt=strcat(tt1,num2str(cases)); load (opt);
%       load data/prior_prob_test#5;
      load data/InitLabel_test#5;
      load data/int_param_test#5;
end



% switch cases
%    case 1
%       load data\predict_slr_5k_test1_c1000_g10_b
%        load data\prior_prob_test#1;
%       load data\InitLabel_test#1;   
%    case 2
%        load data\predict_slr_5k_test2_c1000_g10_b
%       load data\prior_prob_test#2;
%       load data\InitLabel_test#2;
%    case 3
%        load data\predict_slr_5k_test3_c1000_g10_b
%       load data\prior_prob_test#3;
%       load data\InitLabel_test#3;      
%    case 4
%        load data\predict_slr_5k_test4_c1000_g10_b
%       load data\prior_prob_test#4;
%       load data\InitLabel_test#4;      
%    case 5
%        load data\predict_slr_5k_test5_c1000_g10_b
%       load data\prior_prob_test#5;
%       load data\InitLabel_test#5;             
% end

