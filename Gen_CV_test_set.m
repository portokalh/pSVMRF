function [ss, s1] = Gen_CV_test_set(cases)

 tt='_noBl_with_prob';
% op1=['Data/twu_label' num2str(cases)]; load (op1); 
% op2=['Data/twu_mouse_noBl#' num2str(cases)];load (op2);   
switch cases
   case 1
      load Data\labelr1.mat; 
      op=['Data\slr' num2str(cases)]; opt=strcat(op, tt);
      load (opt); cases         
   case 2
      op=['Data\slr' num2str(cases)]; opt=strcat(op, tt);
      load (opt);
      load Data\labelr2.mat;
      cases
   case 3
      op=['Data\slr' num2str(cases)]; opt=strcat(op, tt);
      load (opt);
      load Data\labelr3.mat;
      cases
   case 4
      op=['Data\slr' num2str(cases)]; opt=strcat(op, tt);
      load (opt);
      load Data\labelr4.mat;
      cases
   case 5
      op=['Data\slr' num2str(cases)]; opt=strcat(op, tt);
      load (opt);
      load Data\labelr5.mat;
      cases
end
