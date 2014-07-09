
% 求下图 t1~t4 平均值
%
%     t1
% t3  x  t4
%     t2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [out] = ave_neighbor(data, i, j)
    
    t = zeros(1,4);
    [M,N] = size(data);
    k = 4;
    
    %     t1
    % t3  x  t4
    %     t2
    
    if i==1
        t(1) = 0; k=k-1;
        t(2) = data(i+1,j);
    elseif i==M
        t(1) = data(i-1,j);
        t(2) = 0; k=k-1;
    else
        t(1) = data(i-1,j);
        t(2) = data(i+1,j);
    end
    
    if j==1
        t(3) = 0; k=k-1;
        t(4) = data(i,j+1);
    elseif j==N
        t(3) = data(i,j-1);
        t(4) = 0; k=k-1;
    else
        t(3) = data(i,j-1);
        t(4) = data(i,j+1);
    end
    
    out = sum(t)/k;
end
