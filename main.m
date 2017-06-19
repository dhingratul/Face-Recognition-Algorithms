%% Main file
clear all;close all;clc;
outlabel=[]; count=0;
k=50; % Number of principle components
load YaleB_32x32.mat;
[train,test,labeltr,labelte]=datapartition(fea,gnd,0.01);
addpath(genpath('/home/dhingratul/Dropbox/Academics/Spring2016/ECE-539/Project/Mid-Term/Code/References'));
