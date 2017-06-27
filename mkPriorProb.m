
function [prior_prob,new_X] = mkPriorProb(test)

%%% Specify the number of structures and resolution
 nstates=23; nsubjects=5; nr=111; nc=94;nl=199; X=[]; %%% Min's data
% % %nstates=34; nsubjects=6; nr=512; nc=256; nl=256; X=[];   %%%twu's data

for i=1:nsubjects       
    if i~=test
        [ss] = Gen_CV_test(i);
        X=horzcat(X,ss);   %%%%% X=2milion*4
    end        
end

% X1=reshape(X, nr,nc,nl,4);
[new_X] = mkInitialLabel(reshape(X, nr,nc,nl,nsubjects-1));

X=X+1;
prior_prob=zeros(nr*nc*nl,nstates);

for e=1:nr*nc*nl
    for i=1:nstates
        prior_prob(e,i)=length(find(X(e,:)==i))/size(X,2);
    end
end





              
% load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr1';
% load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr4';
% load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr6';
% X=horzcat(s1,s4,s6);
% X=X+1;
% prior_prob=zeros(nr*nc*nl,nstates);
% 
% for e=1:nr*nc*nl
%     for i=1:nstates
%         prior_prob(e,i)=length(find(X(e,:)==i))/size(X,2);
%     end
% end
