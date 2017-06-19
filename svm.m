%% SVM Function
addpath('/home/labuser/Dropbox/Academics/Spring2016/ECE-539/Project/Mid-Term/Code/References/libsvm-3.21/matlab');
load YaleB_32x32.mat;
out=[];
% fea=normc(fea);
% for i=1:size(fea,1)
% features(i,:)=extractLBPFeatures(reshape(fea(i,:),[32,32]));
% end
% features=double(features);
param=0.001:0.001:0.2;
for i=param
    [train,test,labeltr,labelte]=datapartition(fea,gnd,param);
    c=1e9;
    params=[' -t ' int2str(0) ];
    model = svmtrain(labeltr, train, params);
    [predicted_label, accuracy, decision_v] = svmpredict(labelte, test ,model);
    out=[out;accuracy];
end

