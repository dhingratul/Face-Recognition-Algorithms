%% Run Fischer Faces
p=[10,20,30,40,50];
k=100;
ctr=1;
for idx=p
    [train,test,labeltr,labelte]=datapartition(fea,gnd,idx);
    [~ , ~,acc(ctr,1)] = fisherfaces (train ,test ,k,labeltr,train,labelte,test ) ;
    ctr=ctr+1;
end
