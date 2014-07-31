close all
clear

imageFileName = './paper_dataset/synthetic/5%-2/1_n.bmp';
cNum = 4;
m = 2;
winSize = 3;
maxIter = 500;
thrE    = 0.001;

% FLICM
im = imread(imageFileName);
[imOut] = FLICM_clustering( im );

% Show results
figure, imshow( imOut )
