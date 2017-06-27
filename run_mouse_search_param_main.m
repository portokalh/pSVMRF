% % % This is a interface code for run several different pSVM models with
% % % different C and gamma values
% % % The main function is 'fn_run_mouse_search_param(C, gamma)' which run a pSVM model
% % % with a C and gamma value 

clear; clc; 

[result1] = fn_run_mouse_search_param(1, 0)

[result2] = fn_run_mouse_search_param(100, 10)

[result3] = fn_run_mouse_search_param(100, 50)
 

