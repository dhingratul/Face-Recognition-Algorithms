function [W , mu,acc ] = fisherfaces (X ,y ,k,labeltr,train,labelte,test )
% number of samples
N = size(X,1);
% number of classes
labels = unique (y) ;
c = length ( labels );
if( nargin < 3)
k = c -1;
end
k = min (k ,(c -1) );
% get (N-c) principal components
[ Wpca , mu ] = pca2(X , y , 50) ;
[ Wlda , mu_lda ] = lda2( project ( Wpca , X , mu ) , y , k);
W = Wpca * Wlda ;
[outlabel] = outputlabel(W,mu,labeltr,train,labelte,test,k);
%% Accuracy
for i=1:length(labelte)
    if(labelte(i,1)==outlabel(i,1))
      count = count+1;
    end
end
acc=count/length(labelte)
% err=1-acc
end
