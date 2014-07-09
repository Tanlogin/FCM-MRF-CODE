
function [out] = FGFCM_GenImage(I)
    
    [M,N] = size(I);
    % for 3x3 neighbor, max(|pi-pj|,|qi-qj|)==1, Nr = 8
    T = 1;
    lambdaS = 3.0;
    lambdaG = 1.0;
    delta = zeros(M,N);
    S = zeros(8,M,N);
    newI = zeros(M,N);
    I = double(I);
    for i=1:M
        for j=1:N
            neighbors = 0;
            for m=[-T:T]
                for n=[-T:T]
                    if m==0 & n==0 continue; end % 不包含(i,j)自己
                    i1 = i+m;
                    j1 = j+n;
                    if i1<M+1 & i1>0 & j1<N+1 & j1>0
                        if size(neighbors,1) == 1 
                            neighbors = I(i1,j1);
                        else
                            neighbors = [neighbors(:);I(i1,j1)];
                        end
                    end
                end
            end
            Nr = size(neighbors,1);
            dist = (ones(Nr,1)*I(i,j) - neighbors).^2;
            delta(i,j) = sum(dist) / Nr + 0.1 ;
            for m1=1:Nr
                S(m1,i,j) = exp( (-1/3.0) - (I(i,j)-neighbors(m1)).^2 / ...
                                 (lambdaG*delta(i,j)));
            end
            %S(1:Nr,i,j) = exp( (-1/lambdaS) - (I(i,j)-neighbors).^2/(lambdaG*delta(i,j)) );
            newI(i,j) = S(1:Nr,i,j)'*neighbors / sum(S(:,i,j));
        end
    end
    out  = uint8(newI);
    
end

