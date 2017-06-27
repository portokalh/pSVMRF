% % % This codes create trainig set which are randomly sampled k data points
% % % from each classes
% % % The training set has 27 featres 
% % % From the first column T2, PD, location x, y, z, and 22 location prior
% % % vector. The last column is the label
% % % when tst=1, it creates a training set from mouse #2,3,4,5
% % % When num_row=1000, it samples 1000(=k) data from each class

clear; clc;
nstate=22;
%% Min's data
tst=1; 
opt=['labelr' num2str(tst) '.mat']; load (opt);
ind=find(s1>0); clear s1;
opt=['slr' num2str(tst) '_noBl.mat']; load (opt);
ss6=ss6(:,[1 2 6 7 8 9]);
opt=['C:\SVRF\data\prior_prob_test#' num2str(tst) '.mat']; load (opt);
ss6=horzcat(prior_prob(ind,2:end), ss6); clear prior_prob ind;
save slr1_noBl_with_prob ss6;

% %%%%% Twu's data
% clear; clc;
% nstate=33; tst=1; 
% opt=['twu_label' num2str(tst) '.mat']; load (opt);
% ind=find(s1>0); ss=zeros(size(ind,1), 35);
% ss(:,end)=s1(ind,:); clear s1;
% opt=['twu_mouse' num2str(tst) '.mat']; load (opt);
% ss(:,end-1)=ss6(ind,:); clear ss6;
% opt=['/home/rpan/SVRF/twu_prior_prob_test#' num2str(tst) '.mat']; load (opt);
% ss(:,1:end-2)=prior_prob(ind,2:end); clear prior_prob ind;
% save twu_noBl_with_prob#1 ss;
%%%%%%%%%%%%%%%% R-k sampling
num_row=1000; sss=[];
for i=1:nstate        
    rows=find(ss(:,end)==i);
    [leng bb]=size(rows);     
    rand_rows = ceil(leng.*rand(num_row,1));    
    sss=vertcat(sss,ss(rows(rand_rows),:));    
end

save slr1_noBl_1k_with_prob sss;

%% Min's data
tst=2; 
opt=['labelr' num2str(tst) '.mat']; load (opt);
ind=find(s1>0); clear s1;
opt=['slr' num2str(tst) '_noBl.mat']; load (opt);
ss6=ss6(:,[1 2 6 7 8 9]);
opt=['C:\SVRF\data\prior_prob_test#' num2str(tst) '.mat']; load (opt);
ss6=horzcat(prior_prob(ind,2:end), ss6); clear prior_prob ind;
save slr2_noBl_with_prob ss6;

% %%%%% Twu's data
% clear; clc;
% nstate=33; tst=1; 
% opt=['twu_label' num2str(tst) '.mat']; load (opt);
% ind=find(s1>0); ss=zeros(size(ind,1), 35);
% ss(:,end)=s1(ind,:); clear s1;
% opt=['twu_mouse' num2str(tst) '.mat']; load (opt);
% ss(:,end-1)=ss6(ind,:); clear ss6;
% opt=['/home/rpan/SVRF/twu_prior_prob_test#' num2str(tst) '.mat']; load (opt);
% ss(:,1:end-2)=prior_prob(ind,2:end); clear prior_prob ind;
% save twu_noBl_with_prob#1 ss;
%%%%%%%%%%%%%%%% R-k sampling
num_row=1000; sss=[];
for i=1:nstate        
    rows=find(ss(:,end)==i);
    [leng bb]=size(rows);     
    rand_rows = ceil(leng.*rand(num_row,1));    
    sss=vertcat(sss,ss(rows(rand_rows),:));    
end

save slr2_noBl_1k_with_prob sss;

%% Min's data
tst=3; 
opt=['labelr' num2str(tst) '.mat']; load (opt);
ind=find(s1>0); clear s1;
opt=['slr' num2str(tst) '_noBl.mat']; load (opt);
ss6=ss6(:,[1 2 6 7 8 9]);
opt=['C:\SVRF\data\prior_prob_test#' num2str(tst) '.mat']; load (opt);
ss6=horzcat(prior_prob(ind,2:end), ss6); clear prior_prob ind;
save slr3_noBl_with_prob ss6;

% %%%%% Twu's data
% clear; clc;
% nstate=33; tst=1; 
% opt=['twu_label' num2str(tst) '.mat']; load (opt);
% ind=find(s1>0); ss=zeros(size(ind,1), 35);
% ss(:,end)=s1(ind,:); clear s1;
% opt=['twu_mouse' num2str(tst) '.mat']; load (opt);
% ss(:,end-1)=ss6(ind,:); clear ss6;
% opt=['/home/rpan/SVRF/twu_prior_prob_test#' num2str(tst) '.mat']; load (opt);
% ss(:,1:end-2)=prior_prob(ind,2:end); clear prior_prob ind;
% save twu_noBl_with_prob#1 ss;
%%%%%%%%%%%%%%%% R-k sampling
num_row=1000; sss=[];
for i=1:nstate        
    rows=find(ss(:,end)==i);
    [leng bb]=size(rows);     
    rand_rows = ceil(leng.*rand(num_row,1));    
    sss=vertcat(sss,ss(rows(rand_rows),:));    
end

save slr3_noBl_1k_with_prob sss;

%% Min's data
tst=4; 
opt=['labelr' num2str(tst) '.mat']; load (opt);
ind=find(s1>0); clear s1;
opt=['slr' num2str(tst) '_noBl.mat']; load (opt);
ss6=ss6(:,[1 2 6 7 8 9]);
opt=['C:\SVRF\data\prior_prob_test#' num2str(tst) '.mat']; load (opt);
ss6=horzcat(prior_prob(ind,2:end), ss6); clear prior_prob ind;
save slr4_noBl_with_prob ss6;

% %%%%% Twu's data
% clear; clc;
% nstate=33; tst=1; 
% opt=['twu_label' num2str(tst) '.mat']; load (opt);
% ind=find(s1>0); ss=zeros(size(ind,1), 35);
% ss(:,end)=s1(ind,:); clear s1;
% opt=['twu_mouse' num2str(tst) '.mat']; load (opt);
% ss(:,end-1)=ss6(ind,:); clear ss6;
% opt=['/home/rpan/SVRF/twu_prior_prob_test#' num2str(tst) '.mat']; load (opt);
% ss(:,1:end-2)=prior_prob(ind,2:end); clear prior_prob ind;
% save twu_noBl_with_prob#1 ss;
%%%%%%%%%%%%%%%% R-k sampling
num_row=1000; sss=[];
for i=1:nstate        
    rows=find(ss(:,end)==i);
    [leng bb]=size(rows);     
    rand_rows = ceil(leng.*rand(num_row,1));    
    sss=vertcat(sss,ss(rows(rand_rows),:));    
end

save slr4_noBl_1k_with_prob sss;

%% Min's data
tst=5; 
opt=['labelr' num2str(tst) '.mat']; load (opt);
ind=find(s1>0); clear s1;
opt=['slr' num2str(tst) '_noBl.mat']; load (opt);
ss6=ss6(:,[1 2 6 7 8 9]);
opt=['C:\SVRF\data\prior_prob_test#' num2str(tst) '.mat']; load (opt);
ss6=horzcat(prior_prob(ind,2:end), ss6); clear prior_prob ind;
save slr5_noBl_with_prob ss6;

% %%%%% Twu's data
% clear; clc;
% nstate=33; tst=1; 
% opt=['twu_label' num2str(tst) '.mat']; load (opt);
% ind=find(s1>0); ss=zeros(size(ind,1), 35);
% ss(:,end)=s1(ind,:); clear s1;
% opt=['twu_mouse' num2str(tst) '.mat']; load (opt);
% ss(:,end-1)=ss6(ind,:); clear ss6;
% opt=['/home/rpan/SVRF/twu_prior_prob_test#' num2str(tst) '.mat']; load (opt);
% ss(:,1:end-2)=prior_prob(ind,2:end); clear prior_prob ind;
% save twu_noBl_with_prob#1 ss;
%%%%%%%%%%%%%%%% R-k sampling
num_row=1000; sss=[];
for i=1:nstate        
    rows=find(ss(:,end)==i);
    [leng bb]=size(rows);     
    rand_rows = ceil(leng.*rand(num_row,1));    
    sss=vertcat(sss,ss(rows(rand_rows),:));    
end

save slr5_noBl_1k_with_prob sss;

