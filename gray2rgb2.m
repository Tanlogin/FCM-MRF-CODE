
function [out] = gray2rgb2(im)
    
    [M,N,C] = size(im);
    if C~=1
        error('Just accept gray image');
    end
    
    out = uint8(zeros(M,N,3));
    gray1 = [0,85,170,255];
    gray2 = listColor(im);
    gray = gray2;
    cmap = round(hsv(length(gray))*255);
    Ir = zeros(M,N); Ig = Ir; Ib = Ir;
    for i=1:length(gray)
        q = find( im==gray(i) );
        Ir(q) = cmap(i,1);
        Ig(q) = cmap(i,2);
        Ib(q) = cmap(i,3);
    end
    out(:,:,1)=Ir;
    out(:,:,2)=Ig;
    out(:,:,3)=Ib;
end
