close all;
clear all;
clc

str = 'E:\code\MRF\myMRF\paper_dataset\synthetic\5%-2\1_n.bmp';
I = imread(str);
figure, subplot(2,3,1), imshow(I);

I1 = mat2gray(I);

% 均值滤波
I1 = filter2(fspecial('average',3),I1);
subplot(2,3,2), imshow(I1);
title('均值');

% 中值滤波
I2 = medfilt2(I1,[3,3]);
subplot(2,3,3), imshow(I2);

% 二维自适应除噪
[I3, noise] = wiener2(I1,[5,5]);
subplot(2,3,4), imshow(I3);

% 高斯低通
I4 = filter2(fspecial('gaussian',3),I1);
subplot(2,3,5), imshow(I4);

% Sobel
I5 = filter2(fspecial('sobel'), I1);
I51 = im2bw(I5,graythresh(I5));
I52 = edge(I1, 'sobel');
subplot(2,3,6), imshow(I52);
