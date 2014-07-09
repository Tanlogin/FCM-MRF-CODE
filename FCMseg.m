
function [out] = FCMseg(im)
    
[M,N] = size(im);

% 模糊聚类，U为隶属度矩阵
data = reshape(mat2gray(im),[],1);
[center, U] = fcm(data, 4);

maxU = max(U);

% 找到各像素点的最大隶属度类别
index1 = find(U(1,:) == max(U));
index2 = find(U(2,:) == max(U));
index3 = find(U(3,:) == max(U));
index4 = find(U(4,:) == max(U));


%% 画出依据最大隶属度判决得到的各个类别
if 0
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
end

% 画在一张图上
im5 = zeros(M*N,1);
im5(index1) = 1;
im5(index2) = 2;
im5(index3) = 3;
im5(index4) = 4;
im5 = reshape(im5, M, N);
%figure, imshow( mat2gray( im5 ) );

out = mat2gray(im5);
end
