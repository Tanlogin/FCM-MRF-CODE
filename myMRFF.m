%
% Created by   : TMMU
% Filename     : myfcm.m
% Author       : Chen M. S.
% Version      : 0.1
% Diff Last Ver: 
% Created On   : 2014-03-24
% Description  : ģ������ֳ�����
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

    % ģ�����࣬UΪ�����Ⱦ���
    data = reshape(im,[],1);
    [center, U] = fcm(data, 4);

    % ��ʼ������ǩ
    label = zeros(M,N);
    label = initial_label(label);
    %label(index1) = 1;
    %label(index2) = 2;
    %label(index3) = 3;
    %label(index4) = 4;

    % �����Ⱦ������
    U1 = reshape(U,4,M,N);
    U2 = zeros(M,N,4);
    U2(:,:,1) = U1(1,:,:);
    U2(:,:,2) = U1(2,:,:);
    U2(:,:,3) = U1(3,:,:);
    U2(:,:,4) = U1(4,:,:);

    % ����MRF����Լ�������������󻯵õ��µ�����ǩ�����ָ���
    for i=1:Iter
        label = maximize_energy(im, U2, label);
    end

    % �����ָ���
    out = mat2gray(label);
    % figure, imshow(out);

end

