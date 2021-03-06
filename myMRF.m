%
% Created by   : TMMU
% Filename     : myfcm.m
% Author       : Chen M. S.
% Version      : 0.1
% Diff Last Ver: 
% Created On   : 2014-03-24
% Description  : 模糊聚类分成四类
%                
%                
% Last_Modified: 2014-03-24 20:46
% ========================================================================

clear all;
close all;
clc;

filePath = './FLICM/brain_n.tif';
filePath = '1.bmp';
filePath = './paper_dataset/synthetic/5%-2/1_n.bmp';

im = imread(filePath);
im = mat2gray(im);
[M,N] = size(im);

% 模糊聚类，U为隶属度矩阵
data = reshape(im,[],1);
[center, U] = fcm(data, 4);

maxU = max(U);

% 找到各像素点的最大隶属度类别
index1 = find(U(1,:) == max(U));
index2 = find(U(2,:) == max(U));
index3 = find(U(3,:) == max(U));
index4 = find(U(4,:) == max(U));


%% 画出依据最大隶属度判决得到的各个类别
im1 = zeros(M*N,1);
im1(index1) = 1;
im1 = reshape(im1,M,N);
figure, subplot(2,2,1), imshow(im1);

im2 = zeros(M*N,1);
im2(index2) = 1;
im2 = reshape(im2,M,N);
subplot(2,2,2), imshow(im2);

im3 = zeros(M*N,1);
im3(index3) = 1;
im3 = reshape(im3, M,N);
subplot(2,2,3), imshow(im3);

im4 = zeros(M*N,1);
im4(index4) = 1;
im4 = reshape(im4, M,N);
subplot(2,2,4), imshow(im4);

% 画在一张图上
im5 = zeros(M*N,1);
im5(index1) = 1;
im5(index2) = 2;
im5(index3) = 3;
im5(index4) = 4;
im5 = reshape(im5, M, N);
figure, imshow( mat2gray( im5 ) );

% 初始化类别标签
label = zeros(M,N);
label = initial_label(label);
%label(index1) = 1;
%label(index2) = 2;
%label(index3) = 3;
%label(index4) = 4;

tmp = mat2gray(label);
%figure, imshow(tmp);
label1 = label;

% 隶属度矩阵变形
U1 = reshape(U,4,M,N);
U2 = zeros(M,N,4);
U2(:,:,1) = U1(1,:,:);
U2(:,:,2) = U1(2,:,:);
U2(:,:,3) = U1(3,:,:);
U2(:,:,4) = U1(4,:,:);

% 依据MRF加入约束，求解能量最大化得到新的类别标签，即分割结果
Iter = 5;
for i=1:Iter
    label = maximize_energy(im, U2, label);
end

% 画出分割结果
I = mat2gray(label);
figure, imshow(I);
label2 = label;

% 初始化各类别图像
im11 = zeros(M,N);
im22 = im11;
im33 = im11;
im44 = im11;

% 单独画出各类别图像
im11(find(label2==1)) = 1;
figure, subplot(2,2,1), imshow(im11);

im22(find(label2==2)) = 1;
subplot(2,2,2), imshow(im22);

im33(find(label2==3)) = 1;
subplot(2,2,3), imshow(im33);

im44(find(label2==4)) = 1;
subplot(2,2,4), imshow(im44);
