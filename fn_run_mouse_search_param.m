function [result] = fn_run_mouse_search_param(c1, g1)
ii=1; result=[]; result(ii,1:2)=[c1 g1];

for test=[1 3 5]     
    opt=['-c ' num2str(c1) ' -b 1 -g ' num2str(g1)];  
    ss1=[];
    for i=1:5       
        if i~=test
            [ss] = Gen_CV_set_1k(i); % for 1000 sampling 
            ss1=vertcat(ss1,ss); 
        end        
    end
    ss1(:,24)=[];   %%%24th col is PD
    TrainLabel=ss1(:,end); TrainMat=ss1(:,1:end-1); clear ss1 ss;
    tic;
    model = svmtrain(TrainLabel, TrainMat, opt);
    clear TrainLabel TrainMat;

    t1=toc/60

    [ss6, s1] = Gen_CV_test_set(test); ss6(:,24)=[]; 
    TrueLabel=ss6(:,end);  TestMat=ss6(:,1:end-1); clear ss6;
    tic;
    [predict_label, accuracy, dec_values] = svmpredict(TrueLabel, TestMat, model, ' -b 1'); 
    % [predict_label, accuracy] = svmpredict(TrueLabel, TestMat, model, ' -b 0'); 
    t2=toc/60
    %save model_slr_mix9_test2_prob_feature_T2_b model dec_values predict_label;
    X=s1;ind=find(s1>0);X(ind)=predict_label;clear ind;
    [TrueFalseMat2] = eval_accuracy(s1,X);    
    % % clear predict_label s1 a;
    result(ii+1,1:2)=[mean(TrueFalseMat2(5, 2:22)) mean(TrueFalseMat2(6, 2:22))];
    ii=ii+1;
end %%%test
result(ii+1,1:2)=[mean(result(2:end,1)) mean(result(2:end,2))];