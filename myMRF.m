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
% Last_Modified: 2014-03-24 20:46
% ========================================================================

clear all;
close all;

im = imread('1.bmp');
im = mat2gray(im);
[M,N] = size(im);

data = reshape(im,[],1);
[center, U] = fcm(data, 4);

maxU = max(U);

index1 = find(U(1,:) == max(U));
index2 = find(U(2,:) == max(U));
index3 = find(U(3,:) == max(U));
index4 = find(U(4,:) == max(U));


subplot(2,2,1), imshow(im);

im1 = zeros(M*N,1);
im1(index1) = 1;
im1 = reshape(im1,M,N);
subplot(2,2,2), imshow(im1);

im2 = zeros(M*N,1);
im2(index2) = 1;
im2 = reshape(im2,M,N);
subplot(2,2,3), imshow(im2);

im3 = zeros(M*N,1);
im3(index3) = 1;
im3 = reshape(im3, M,N);
subplot(2,2,4), imshow(im3);

im4 = zeros(M*N,1);
im4(index4) = 1;
im4 = reshape(im4, M,N);
figure, imshow(im4);

label = zeros(M,N);
label = initial_label(label);
%label(index1) = 1;
%label(index2) = 2;
%label(index3) = 3;
%label(index4) = 4;

tmp = mat2gray(label);
figure, imshow(tmp);
label1 = label;

U1 = reshape(U,4,M,N);
U2 = zeros(M,N,4);
U2(:,:,1) = U1(1,:,:);
U2(:,:,2) = U1(2,:,:);
U2(:,:,3) = U1(3,:,:);
U2(:,:,4) = U1(4,:,:);

Iter = 5;

for i=1:Iter
    label = maximize_energy(im, U2, label);
end

I = mat2gray(label);
figure, imshow(I);
label2 = label;
