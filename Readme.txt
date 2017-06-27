Before running the codes, SPM and libsvm toolbox for Matlab need to be installed 
%Neuroimage. 2012 Feb 1;59(3):2298-306. doi: 10.1016/j.neuroimage.2011.09.053. Epub 2011 Oct 1.
%A prior feature SVM-MRF based method for mouse brain segmentation.
%Wu T1, Bae MH, Zhang M, Pan R, Badea A
File list:


assign_edge_nums_lattice.m ......To assign edge numbers
calc_interaction_param.m ......calculate the init parameters
eval_accuracy.m ......Evaluate Accuracy
eval_performance.m......Evaluate Performance of the model
fn_run_mouse_cv.m ...... function of run_pSVM_cv_main.m
fn_run_mouse_search_param.m ...... function of run_mouse_search_param_main.m
Gen_CV_set.m ...... no samping CV set
Gen_CV_set_1k.m ...... 1K sampling
Gen_CV_set_5k.m ...... 5k sampling
Gen_CV_trainset_2p.m ...... Train Set generation
Gen_image_matrix.m ......convert .img files to matlab data matrix
Gen_matrix_mouse.m ......generate the input data matrix
Gen_location_prior_trainset.m ...... Generate location Prior Prob mat
Gen_prior_prob_mat.m ...... Generate Prior Prob mat
ICM_pSVMRF_CV.m...... Main function of the pSVMRF model
mkInitialLabel.m
mkPriorProb.m
run_mouse_search_param_main.m
run_pSVM_cv_main.m



1. Convert Original Image files to Data Matrix:
  1.1 Run 'Gen_image_matrix.m' to convert .img files to matlab data matrix
  1.2 Run 'Gen_matrix_mouse.m' to generate the input data matrix for following procedure.

2. Run 'calc_interaction_param.m' to get the int_param which is an input for pSVM you need to change the file name of load in order to calculate all the samples(default one is load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr3')

3. Run 'Gen_prior_prob_mat.m' to get other 2 inputs for pSVM model

4. Generate location prior for each of training data (Run 'Gen_location_prior_trainset.m')

5. Run a number of different time pSVM model with different C and Gamma value ('run_mouse_search_param_main.m') to find the best parameters

5. Run 'run_pSVM_cv_main.m' to calculate the probability matrix of pSVM ('intense prob')

6. Run 'ICM_pSVMRF_CV.m'to get the result with different w1,w2 and w3 using 5-fold CV.




