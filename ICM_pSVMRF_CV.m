clear;clc;tic;
nstates=23; nr=111; nc=94; nl=199; overlap=[]; diff=[]; ii=1;avg=[]; prog=[];a_prog=[];

%%%%% 'tr' is the name of file which incldes SVM output (the probability
%%%%% matrix of pSVM)
tr='model_1k_prob_feat_T2_b_c1_g0_#';

for w1=[.89 ] %%% Specify w1 here
    w2=1-w1    
    overlap(ii,:)=horzcat([w1 w2],zeros(1,21));
    diff(ii,:)=horzcat([w1 w2 ],zeros(1,21));ii=ii+1;    
    for cases=1:5  %%% Specify the testing mice
        cases
        [intens_prob, X, int_param] = Gen_CV_trainset_2p(cases, tr);
        %%%%%%%%%%%%%% Calculate initial probability
        prob=zeros(nr,nc,nl);
        for i=1:nr*nc*nl    
            [r c l]=ind2sub([nr nc nl], i);
            [edgeEnds,nedge]=assign_edge_nums_lattice(r, c, l, nr,nc,nl);
            for ed=1:nedge
                  r2 = edgeEnds(ed,4); c2 = edgeEnds(ed,5); l2 = edgeEnds(ed,6);                    
                  Xj(ed)=X(r2,c2,l2);                
            end        
            xi=X(r,c,l); 
            prob(r,c,l)=w1*intens_prob(i,xi)+w2*length(find(Xj==xi))/nedge;                        
        end  %%% l   

        %%%%%%%%%%%%%% Calculate new probability & Update
        chg=1000;iter=1; 
        while iter <2 %chg>100 
            chg=0;
            e=1;
            for i=1:nr*nc*nl    
                [r c l]=ind2sub([nr nc nl], i);     
                [edgeEnds,nedge]=assign_edge_nums_lattice(r, c, l, nr,nc,nl);
                for ed=1:nedge
                      r2 = edgeEnds(ed,4); c2 = edgeEnds(ed,5); l2 = edgeEnds(ed,6);                    
                      Xj(ed)=X(r2,c2,l2);                
                end

                prob_possible=zeros(nstates,1);
                for xi=1:nstates   
                      prob_possible(xi,1)=w1*intens_prob(i,xi)+w2*length(find(Xj==xi))/nedge;  
                end
                max_prob=max(prob_possible);            
                if prob(r,c,l)< max_prob
                    ind=find(prob_possible==max_prob);
                    X(r,c,l)=ind(1);  
                    prob(r,c,l)= max_prob;     
                    chg=chg+1;
                end
                          
            end  %%% i   
            if mod(iter,10)==0
                label=X-1;            
            end
            t1=toc/60;
%             disp('ICM iteration='); disp(iter); iter=iter+1;
%             disp('Number of changes='); disp(chg);
            [AVOP AVDP]=eval_performance(cases, X);
            prog(iter,:)=[iter t1 chg AVOP AVDP]
%             disp('AVOP='); disp(AVOP);disp('AVDP='); disp(AVDP);
            iter=iter+1;
            
        end  %%% while
        a_prog=vertcat(a_prog,prog);
        prog=[];
        [s1] = Gen_CV_test(cases);
        [TrueFalseMat] = eval_accuracy(s1,X-1);
        overlap(ii,:)=TrueFalseMat(5,:);
        diff(ii,:)=TrueFalseMat(6,:);ii=ii+1;
        t1=toc/60
        
    end %% cases
%     avg=vertcat(avg, horzcat([w1 w2],zeros(1,21)), mean(overlap(ii-5:ii-1,:)), mean(diff(ii-5:ii-1,:)))
    
    
end %%w1
X=X-1;
% aaa=vertcat(avg, overlap, diff);

save pSVMRF_label_c0029_g0_w1_089_4 X;



    
