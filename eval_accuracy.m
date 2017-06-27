function [TrueFalseMat] = eval_accuracy(TrueLabel,predict_label_corrected);

predict_label=reshape(predict_label_corrected,111,94,199);%111	94	199

[predict_label_corrected]=neighbor_correct(predict_label);
predict_label_corrected=reshape(predict_label_corrected,111*94*199,1);
num_class=23;
TrueFalseMat=zeros(6,num_class);

for l=1:1:size(TrueLabel,1)
    if TrueLabel(l,1)==predict_label_corrected(l,1)
        TrueFalseMat(1,TrueLabel(l,1)+1)=TrueFalseMat(1,TrueLabel(l,1)+1)+1;
    end            
    TrueFalseMat(2,predict_label_corrected(l,1)+1)=TrueFalseMat(2,predict_label_corrected(l,1)+1)+1;
    TrueFalseMat(3,TrueLabel(l,1)+1)=TrueFalseMat(3,TrueLabel(l,1)+1)+1;%         
end %l
        
for ii=1:1:num_class
    TrueFalseMat(4,ii)=100*(TrueFalseMat(1,ii)/TrueFalseMat(3,ii));
    TrueFalseMat(5,ii)=100*(TrueFalseMat(1,ii)/((TrueFalseMat(2,ii)+TrueFalseMat(3,ii))/2));
    TrueFalseMat(6,ii)=100*(abs(TrueFalseMat(2,ii)-TrueFalseMat(3,ii))/((TrueFalseMat(2,ii)+TrueFalseMat(3,ii))/2));
end

format short g;     

TrueFalseMat=TrueFalseMat(:,[1 2 18 7 8 19 16 15 13 9 5 4 20 3 12 22 21 23 6 17 14 10 11]);

% tot=vertcat(tot, result, TrueFalseMat);
% %         result{i,:}={c1 g1 w1 accuracy(1) t1 TrueFalseMat};
% %         i=i+1;
% clear t1;
      