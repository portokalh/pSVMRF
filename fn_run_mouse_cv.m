function [TrueFalseMat2 result model dec_values predict_label intens_prob] = fn_run_mouse_cv(test, c1, g1)

%test=1;c1=0.003; g1=0; tt='Data/twu_noBl_100_with_prob#';
test
num_class=22; nsubject=5; %%% Specify the number of structures (Exclude the blank) and subjects
result=zeros(1,2);   
opt=['-c ' num2str(c1) ' -b 1 -g ' num2str(g1)];  
ss1=[];
for i=1:nsubject      
    if i~=test
        op=strcat('Data/slr', num2str(i),'_noBl_1k_with_prob'); load (op);
        %[ss] = Gen_CV_set_new(i, tt);
        ss1=vertcat(ss1,sss); clear sss op;
    end        
end
%ss1(:,24:27)=[];   %%%24th col is PD  24:27
TrainLabel=ss1(:,end); TrainMat=ss1(:,1:end-1); clear ss1;
tic;
model = svmtrain(TrainLabel, TrainMat, opt);
clear TrainLabel TrainMat; t1=toc/60

%%%% Testing
op=strcat('Data/slr', num2str(test),'_noBl_with_prob'); load (op); clear op;
TrueLabel=ss(:,end);  TestMat=ss(:,1:end-1); clear ss;
tic;
[predict_label, accuracy, dec_values] = svmpredict(TrueLabel, TestMat, model, ' -b 1'); 
% [predict_label, accuracy] = svmpredict(TrueLabel, TestMat, model, ' -b 0'); 
t2=toc/60
%save model_slr_mix9_test2_prob_feature_T2_b model dec_values predict_label;
op=['labelr' num2str(test)]; load (op); clear op;
X=s1;ind=find(s1>0);X(ind,1)=predict_label;clear ind;
[TrueFalseMat2] = eval_accuracy(s1,X); 
intens_prob=zeros(size(s1,1)*size(s1,2)*size(s1,3),num_class+1);
ind=find(s1==0); intens_prob(ind,1)=1;
ind2=find(s1~=0); intens_prob(ind2,2:end)=dec_values;
% % clear predict_label s1 a;
result(1,1:2)=[t1 t2];