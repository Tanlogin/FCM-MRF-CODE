
function [out] = gray2rgb(im)
    
    [M,N,C] = size(im);
    if C~=1
        error('Just accept gray image');
    end
    
    out = uint8(zeros(M,N,3));
    gray = listColor(im);
    color = [gray,sort(gray),sort(gray, 'descend')];
    for i=1:M
        for j=1:N
            for k=1:length(gray)
                if im(i,j)==gray(k)
                    out(i,j,:) = color(k,:);
                end
            end
        end
    end
    
end
