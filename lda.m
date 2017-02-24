clear all;close all;clc;
load YaleB_32x32.mat;
[train,test,labeltr,labelte]=datapartition(fea,gnd,0.1);
train=train';
test=test';
labeltr=labeltr';
labelte=labelte';
function [W , mu ] = lda (X ,y , k)
% dimension of observation
[n , d] = size (X );
% number of classes
labels = unique (y) ;
C = length ( labels );
% allocate scatter matrices
Sw = zeros (d , d);
Sb = zeros (d , d);
% total mean
mu = mean (X);
% calculate scatter matrices
for i = 1: C
Xi = X( find (y == labels ( i)) ,:) ; % samples for current class
n = rows ( Xi );
mu_i = mean ( Xi ); % mean vector for current class
Xi = Xi - repmat ( mu_i , n , 1) ;
Sw = Sw + Xi ’* Xi ;
Sb = Sb + n * ( mu_i - mu ) ’*( mu_i - mu );
end
% solve general eigenvalue problem
[W , D] = eig( Sb , Sw );
% sort eigenvectors
[D , i] = sort ( diag (D) , ’descend ’);
W = W (: , i );
% keep at most (c -1) eigenvectors
W = W (: ,1: k);
end