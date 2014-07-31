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

function [out] = myMRFF(im, Iter)
    
    if nargin==1
        Iter = 5;
    end
    
    im = mat2gray(im);
    [M,N] = size(im);

    % 模糊聚类，U为隶属度矩阵
    data = reshape(im,[],1);
    [center, U] = fcm(data, 4);

    % 初始化类别标签
    label = zeros(M,N);
    label = initial_label(label);
    %label(index1) = 1;
    %label(index2) = 2;
    %label(index3) = 3;
    %label(index4) = 4;

    % 隶属度矩阵变形
    U1 = reshape(U,4,M,N);
    U2 = zeros(M,N,4);
    U2(:,:,1) = U1(1,:,:);
    U2(:,:,2) = U1(2,:,:);
    U2(:,:,3) = U1(3,:,:);
    U2(:,:,4) = U1(4,:,:);

    % 依据MRF加入约束，求解能量最大化得到新的类别标签，即分割结果
    for i=1:Iter
        label = maximize_energy(im, U2, label);
    end

    % 画出分割结果
    out = mat2gray(label);
    % figure, imshow(out);

end

