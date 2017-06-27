clear;clc;tic
nstates=23; nr=111; nc=94; nl=199; 
load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr3'; 
X=reshape(s1, nr, nc, nl); X=X+1;clear s1;
int_param=zeros(nstates,nstates);
for l=1:nl    
    for r=1:nr
      for c=1:nc
        i = sub2ind([nr nc nl], r, c,l); 
        xi=X(r,c,l);
        [edgeEnds,nedge]=assign_edge_nums_lattice(r, c, l, nr,nc,nl);
%             [edgeEnds,nedge]=assign_edge_nums_lattice(4,5,6, nr,nc,nl);
        for ed=1:nedge
              r2 = edgeEnds(ed,4); c2 = edgeEnds(ed,5); l2 = edgeEnds(ed,6); 
              xj=X(r2,c2,l2);
              int_param(xi,xj)=int_param(xi,xj)+1;                          
        end     
                        
      end  %%% c      
    end %%%c         
end  %%% l   

for i=1:nstates
    int_param(i,:)=int_param(i,:)/sum(int_param(i,:));
end
save int_param_#3 int_param;
toc



% clear
% 
% load int_param_#1; a1=int_param;
% load int_param_#2; a2=int_param;
% load int_param_#3; a3=int_param;
% load int_param_#4; a4=int_param;
% load int_param_#5; a5=int_param;
% 
% xx=a1+a2+a3+a4;
% for i=1:23
%     xx(i,:)=xx(i,:)/sum(xx(i,:));
% end
% int_param=xx;
% save int_param_test#5 int_param;



