%% PCA
clear all;close all;clc;
load YaleB_32x32.mat
%% Average Face
avg=sum(fea,1)/length(gnd);
% % Display average
% avg=uint8(avg);
% im=reshape(avg(1,:),[32,32])
% imshow(im);
for i=1:length(gnd)
fea(1,:)=fea(1,:)-avg;
end