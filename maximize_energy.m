%
% Created by   : TMMU
% Filename     : maximize_energy.m
% Author       : Chen M. S.
% Version      : 0.1
% Diff Last Ver: 
% Created On   : 2014-06-24
% Description  : �������������
%                
% input
%   im      -   ԭʼͼ��
%   prob    -   �����Ⱦ���
%   label   -   ����ǩ
% output
%   label_out   -   ����������󻯵õ����о���ǩ
%
% Last_Modified: 2014-06-24 10:21
% ========================================================================

function [label_out] = maximize_energy(im, prob, label)
    
    [M,N,K] = size(prob);
    C1 = 7;
    C2 = 7;
    C3 = 0;%2;
    C4 = 4;
    C5 = 0;%0.5;
    C6 = 0;
    label_out = label;
    
    for i=1:M
        for j=1:N
            energy = zeros(1,K);
            for k=1:K
                % energy funciton
                % ��Χ����ǩԼ�� + ������ + ��Χ������Լ�� + ��Χ��ǩԼ
                % ��
                energy(k) = C1*prob(i,j,k) + (C2-C2)*ave_neighbor(prob(:,:,k),i,j) + C2*CalOnNeighbors2(prob(:,:,k),i,j) + C3*energy1(im, label, i, j) + C4*1/(1 + abs(k - ave_neighbor(label,i,j))) + C5*CalOnNeighbors(prob(:,:,k),i,j) + C6*CalOnNeighbors(label,i,j);
            end
            [energy_max,index] = max(energy);
            label_out(i,j) = index;
        end
    end
end

% �����ǩ��ͬ���������������ػҶȲ���ĵ�����������ֵ
% �����ǩ����ͬ���������������ػҶȲ��쵹���ĸ�����������ֵ
function [out] = energy1(im, label, i, j)
    
    L = label(i,j);
    I = im(i,j);
    [M,N] = size(label);
    k = 0;
    out = 0;
    for m=[-1,1]
        for n=[-1,1]
            i1 = i+m;
            j1 = j+n;
            if i1<M+1 & i1>0 & j1<N+1 & j1>0
                out = out + energy1_1(I,im(i1,j1),L,label(i1,j1));
                k = k+1;
            end
        end
    end
    out = out / k;
end

function [out] = energy1_1(I1,I2,L1,L2)
    
    out = 1/(abs(I1-I2) + 0.1);
    if L1~=L2
        out = -out;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [out] = process1(I,i,j,nI,ni,nj)
    distance = sqrt( (i-ni)^2 + (j-nj)^2 );
    out = 1 / ( distance * (abs((I(i,j) - nI(ni,nj))) + 0.01) );
end


function [out] = CalOnNeighbors(I,i,j)
    out = 0;
    [M,N] = size(I);
    k = 0;
    T = 1;
    for m=[-T:T]
        for n=[-T:T]
            if m==0 & n==0 continue; end % ������(i,j)�Լ�
            i1 = i+m;
            j1 = j+n;
            if i1<M+1 & i1>0 & j1<N+1 & j1>0
                out = out + process1(I,i,j,I,i1,j1);
                k = k+1;
            end
        end
    end
    out = out/k;
end


function [out] = process2(I,i,j,nI,ni,nj)
    distance = sqrt( (i-ni)^2 + (j-nj)^2 );
    out = nI(ni,nj) / distance;
end

function [out] = CalOnNeighbors2(I,i,j)
    out = 0;
    [M,N] = size(I);
    k = 0;
    T = 1;
    for m=[-T:T]
        for n=[-T:T]
            if m==0 & n==0 continue; end
            i1 = i+m;
            j1 = j+n;
            if i1<M+1 & i1>0 & j1<N+1 & j1>0
                out = out + process2(I,i,j,I,i1,j1);
                k = k+1;
            end
        end
    end
    out = out/k;
end
