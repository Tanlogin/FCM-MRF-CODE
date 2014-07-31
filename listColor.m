function [color] = listColor(I)
    [M,N,C] = size(I);
    if C==1 
        color = -1;
    else color = [-1,-1,-1];
    end
    for i=1:M
        for j=1:N
            L = 0;
            tmp = reshape(I(i,j,:),1,C);
            for k=1:size(color,1)
                if tmp==color(k,:)
                    L = 1;
                end
            end
            if L==0
                if color(1)==-1
                    color = tmp;
                else
                    color = [color; tmp];
                end
            end
        end
    end
end

