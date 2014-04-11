function [label_out] = maximize_energy(prob, label)
    
    [M,N,K] = size(prob);
    C1 = 10;
    C2 = 3;
    label_out = label;
    
    for i=1:M
        for j=1:N
            energy = zeros(1,K);
            for k=1:K
                energy(k) = 1/(0.1 + abs(k - ave_neighbor(label,i,j))) + C1*prob(i,j,k) + C2*ave_neighbor(prob(:,:,k),i,j);
            end
            [energy_max,index] = max(energy);
            label_out(i,j) = index;
        end
    end
end
