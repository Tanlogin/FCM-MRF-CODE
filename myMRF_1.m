%
% Created by   : TMMU
% Filename     : myfcm.m
% Author       : Chen M. S.
% Version      : 0.1
% Diff Last Ver: 
% Created On   : 2014-03-24
% Description  : 模糊聚类分成三类
%                
%                
% Last_Modified: 2014-06-24 10:18
% ========================================================================

clear all;
close all;
clc;

filePath = './FLICM/brain_n.tif';
filePath1 = '1.bmp';
im = imread(filePath);
im = mat2gray(im);
[M,N] = size(im);

data = reshape(im,[],1);
[center, U] = fcm(data, 3);

maxU = max(U);

index1 = find(U(1,:) == max(U));
index2 = find(U(2,:) == max(U));
index3 = find(U(3,:) == max(U));

im1 = zeros(M*N,1);
im1(index1) = 1;
im1 = reshape(im1,M,N);
subplot(2,2,1), imshow(im1);

im2 = zeros(M*N,1);
im2(index2) = 1;
im2 = reshape(im2,M,N);
subplot(2,2,2), imshow(im2);

im3 = zeros(M*N,1);
im3(index3) = 1;
im3 = reshape(im3, M,N);
subplot(2,2,3), imshow(im3);

label = zeros(M,N);
label = initial_label(label);
%label(index1) = 1;
%label(index2) = 2;
%label(index3) = 3;
%label(index4) = 4;

tmp = mat2gray(label);
%figure, imshow(tmp);
label1 = label;

U1 = reshape(U,3,M,N);
U2 = zeros(M,N,3);
U2(:,:,1) = U1(1,:,:);
U2(:,:,2) = U1(2,:,:);
U2(:,:,3) = U1(3,:,:);

Iter = 5;

for i=1:Iter
    label = maximize_energy(im, U2, label);
end

I = mat2gray(label);
figure, imshow(I);
label2 = label;


im11 = zeros(M,N);
im22 = im11;
im33 = im11;
im44 = im11;

im11(find(label2==1)) = 1;
figure, subplot(2,2,1), imshow(im11);

im22(find(label2==2)) = 1;
subplot(2,2,2), imshow(im22);

im33(find(label2==3)) = 1;
subplot(2,2,3), imshow(im33);
