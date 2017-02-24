clear all;
close all;
load YaleB_32x32.mat
[h,w,n] = size(fea);
d = h*w;
% vectorize images
x = reshape(fea,[d n]);
x = double(x);
%subtract mean
x=bsxfun(@minus, x, mean(x,2));
% calculate covariance
s = cov(x');
% obtain eigenvalue & eigenvector
[V,D] = eig(s);
eigval = diag(D);
% sort eigenvalues in descending order
eigval = eigval(end:-1:1);
V = fliplr(V);
% show 0th through 15th principal eigenvectors
eig0 = reshape(mean(x,2), [h,w]);
figure,subplot(4,4,1)
imagesc(eig0)
colormap gray
for i = 1:15
subplot(4,4,i+1)
imagesc(reshape(V(:,i),h,w))
end