clear all
close all
clc

str = 'E:\code\MRF\myMRF\paper_dataset\synthetic\5%-2\1_n.bmp';
I = imread(str);
figure, subplot(2,2,1), imshow(I);
%I = mat2gray(I);
OriginalFCM = FCMseg(I);
subplot(2,2,2), imshow(OriginalFCM);
I1 = FGFCM_GenImage(I);
subplot(2,2,3), imshow(I1);
%imwrite(I1,'FGFCM_Gen.bmp');
out = FCMseg(I1);
subplot(2,2,4), imshow(out)
imwrite(out, 'FGFCM.bmp');

