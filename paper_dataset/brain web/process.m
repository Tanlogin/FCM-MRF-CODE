clc
clear all
close all

str = 'E:\MR Image\database\brainWeb\brainweb.mnc';
[images, Dim] = load_img(str);
frames = Dim(1);
slices = Dim(2);
height = Dim(3);
width = Dim(4);
viewimage(images(:,:,floor(slices/2)));
I = images(:,:,floor(slices/2));
I1 = mat2gray(images(:,:,floor(slices/2)));
figure, imshow(I1);

segImg = FCMseg(I);
figure, imshow(segImg);

