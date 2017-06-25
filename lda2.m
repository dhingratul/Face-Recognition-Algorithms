%% LDA (version 2)
% Input: X, y, k
% Output: W, mu
function [W , mu ] = lda2 (X ,y , k)
% dimension of observation
[n , d] = size (X);
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
    temp=find (y == labels (i)) ; % samples for current class
    Xi = X(temp(1,1):temp(end,1),:);
    n = size( Xi,1 );
    mu_i = mean ( Xi ); % mean vector for current class
    Xi = Xi - repmat ( mu_i , n , 1) ;
    Sw = Sw + Xi'* Xi ;
    Sb = Sb + n * ( mu_i - mu )'*( mu_i - mu );
end
% solve general eigenvalue problem
[W , D] = eig( Sb , Sw );
% sort eigenvectors
[D , i] = sort ( diag (D) , 'descend');
W = W (: , i );
% keep at most (c -1) eigenvectors
W = W (: ,1: k);
end