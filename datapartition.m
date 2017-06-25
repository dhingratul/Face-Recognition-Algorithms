%% Partitions the data into training, testing data based on p-values(Splits)
%% Partitions the data into train and test sets
% Input: Features, labels, p
% Output: Train, Test, Label-tr, Label-te
function[train,test,labeltr,labelte]=datapartition(features,labels,p)
train=[];test=[];labelte=[];labeltr=[];
%% Input features, labels, per(centage) of data you want to see, and
% split betwen tr and te data; by default it is set to 0.1
if nargin<3
    p=10;
end
C=length(unique(labels));
for j=1:C
    idx=find(labels==j);
    startidx=idx(1,1);endidx=idx(end,1);
    test=[test;features(startidx:startidx+p-1,:)];
    labelte=[labelte;labels(startidx:startidx+p-1,1)];
    train=[train;features(startidx+p:endidx,:)];
    labeltr=[labeltr;labels(startidx+p:endidx,1)];
    
end
end