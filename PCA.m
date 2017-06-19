%% PCA
clear all;close all;clc;
outlabel=[];
k1=4; % Without first 3 eigen vectors
k=100; % Number of principle components
load YaleB_32x32.mat;
fea=normc(fea);
p=[10,20,30,40,50];
ctr=1;
for idx=p
    count=0;
    [train,test,labeltr,labelte]=datapartition(fea,gnd,idx);
    train=train';
    test=test';
    labeltr=labeltr';
    labelte=labelte';
    %% Average Face
    avg=sum(train,2)/length(labeltr);
    %% Covariance matrix
    for i=1:length(labeltr)
        A(:,i)=train(:,i)-avg; %Mean shifted image
    end
    [evectors,score,evalues]=princomp(train');
    evectors=evectors(:,k1:k);
    features=evectors'*A;
    
    %% Recognition
    for j=1:length(labelte)
        feature_vec(:,j)=evectors'*(test(:,j)-avg);
        similarity_score = arrayfun(@(n) 1 / (1 + norm(features(:,n) - feature_vec(:,j))), 1:length(labeltr));
        [match_score, match_ix] = max(similarity_score);
        temp=labeltr(1,match_ix);
        % display the result
        outlabel=[outlabel temp];
        
    end
    %% Accuracy
    for i=1:length(labelte)
        if(labelte(1,i)==outlabel(1,i))
            count = count+1;
        end
    end
    acc(ctr,1)=count/length(labelte)
    ctr=ctr+1;
end