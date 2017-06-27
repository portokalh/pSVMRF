%%%%% This is a interface for training various SVM models which have
%%%%% different parameters.
%%%%% The main code for training a SVM model is 'fn_run_mouse_cv' which 
%%%%% is used as a function in this code.

%%%%% c1 is cost parameter of SVM and g1 is gamma value of RBF function
%%%%% tr is the part of name of training data
clear; clc; 
c1=.03; g1=0;
% tt1='model_100_prob_feat_T2_NOxyz_b_c003_g0_#';


%%%%% The function 'fn_run_mouse_cv' gives SVM model, predicted label and
%%%%% probaility matrix of pSVM
tic;
[TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(1, c1, g1);
save model_1k_prob_feat_T2_b_c1_g0_#1 TrueFalseMat2 result model dec_values predict_label intens_prob;
toc

tic;
[TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(2, c1, g1);
save model_1k_prob_feat_T2_b_c1_g0_#2 TrueFalseMat2 result model dec_values predict_label intens_prob;
toc

tic;
[TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(3, c1, g1);
save model_1k_prob_feat_T2_b_c1_g0_#3 TrueFalseMat2 result model dec_values predict_label intens_prob;
toc

tic;
[TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(4, c1, g1);
save model_1k_prob_feat_T2_b_c1_g0_#4 TrueFalseMat2 result model dec_values predict_label intens_prob;
toc

tic;
[TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(5, c1, g1);
save model_1k_prob_feat_T2_b_c1_g0_#5 TrueFalseMat2 result model dec_values predict_label intens_prob;
toc

% tic;
% [TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(3, c1, g1, tt);
% save model_twu_100_c003_g0_#3 TrueFalseMat2 result model dec_values predict_label intens_prob;
% toc
% 
% tic;
% [TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(4, c1, g1, tt);
% save model_twu_100_c003_g0_#4 TrueFalseMat2 result model dec_values predict_label intens_prob;
% toc
% 
% tic;
% [TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(5, c1, g1, tt);
% save model_twu_100_c003_g0_#5 TrueFalseMat2 result model dec_values predict_label intens_prob;
% toc
% 
% tic;
% [TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(6, c1, g1, tt);
% save model_twu_100_c003_g0_#6 TrueFalseMat2 result model dec_values predict_label intens_prob;
% toc
% 
% [result]=Get_result(tt1);