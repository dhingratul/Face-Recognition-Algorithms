%% Computes Eigen faces
image_dims = [32, 32];
images=train';
outlabel=[];
num_images=size(train,1);
% steps 1 and 2: find the mean image and the mean-shifted input images
mean_face = mean(images, 2);
shifted_images = images - repmat(mean_face, 1, num_images);

% steps 3 and 4: calculate the ordered eigenvectors and eigenvalues
[evectors, score, evalues] = princomp(images');

% step 5: only retain the top 'num_eigenfaces' eigenvectors (i.e. the principal components)
num_eigenfaces = 20;
evectors = evectors(:, 1:num_eigenfaces);

% step 6: project the images into the subspace to generate the feature vectors
features = evectors' * shifted_images;

% calculate the similarity of the input to each training image

for i=1:size(test,1)
    input_image=test(i,:)';
    feature_vec = evectors' * (input_image - mean_face);
    similarity_score = arrayfun(@(n) 1 / (1 + norm(features(:,n) - feature_vec)), 1:num_images);
    
    % find the image with the highest similarity
    [match_score, match_ix] = max(similarity_score);
    outlabel=[outlabel;labeltr(match_ix,1)];
end
% % display the result
% figure, imshow(uint8([reshape(input_image,[32,32]) reshape(images(:,match_ix), image_dims)]));
% title(sprintf('matches %s, score %f', filenames(match_ix).name, match_score));
