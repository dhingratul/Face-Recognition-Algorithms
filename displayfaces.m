%% Displays the first k eigenfaces
% Input: eigennfaces, k
% Output: image
function[]=displayfaces(eigenfaces,k)
% display the eigenvectors
figure;
for n = 1:k
    subplot(2, ceil(k/2), n);
    evector = reshape(eigenfaces(:,n), [32,32]);
    imagesc(evector);
end
end