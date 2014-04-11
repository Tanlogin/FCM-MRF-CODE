function [label_out] = maximize_energy(im, prob, label)
    
    [M,N,K] = size(prob);
    C1 = 10;
    C2 = 3;
    label_out = label;
    
    for i=1:M
        for j=1:N
            energy = zeros(1,K);
            for k=1:K
                % energy funciton
                energy(k) = 1/(0.1 + abs(k - ave_neighbor(label,i,j))) + ...
                    C1*prob(i,j,k) + C2*ave_neighbor(prob(:,:,k),i,j) + ...
                    energy1(im, label, i, j);
            end
            [energy_max,index] = max(energy);
            label_out(i,j) = index;
        end
    end
end


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
            if i1<M & i1>0 & j1<N & j1>0
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
