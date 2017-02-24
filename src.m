%% SRC
clear all; close all;
load YaleB_32x32.mat
addpath /home/labuser/Dropbox/Academics/Spring2016/ECE-539/Project/Mid-Term/Code/References/spgl1-1.9;
outlabel=[];r=[];count=0;train=[];test=[];labeltr=[];labelte=[];x=[];
fea=normc(fea);
[train,test,labeltr,labelte]=datapartition(fea,gnd,50);
C=length(unique(labeltr));
% Basis pursuit denoising
sigma = 0;       % Desired ||Ax - b||_2
opts = spgSetParms('verbosity',1);
for i=1:size(test,1)
    x(:,i) = spg_bpdn(train', test(i,:)', sigma, opts);
    for j=1:C
        idx=find(labeltr==j);
        startidx=idx(1,1);endidx=idx(end,1);
        r(j)=norm(test(i,:)'-(train(startidx:endidx,:)'*x(startidx:endidx,i)));
    end
 [~,index]=min(r);
 outlabel=[outlabel;index];
end
%% Accuracy
for i=1:length(labelte)
    if(labelte(i)==outlabel(i))
      count = count+1;
    end
end
acc=count/length(labelte)
