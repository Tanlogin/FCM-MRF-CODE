clc
close all
clear all

str = './paper_dataset/1.bmp';
str = 'E:\code\MRF\myMRF\paper_dataset\synthetic\5%-2\~1.bmp';
I = imread(str);
figure, subplot(1,2,1), imshow(I);
I1 = gray2rgb2(I);
subplot(1,2,2), imshow(I1);
