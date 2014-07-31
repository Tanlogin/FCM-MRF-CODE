
function [out] = FGFCM(im)
    
%I = mat2gray(I);
im1 = FGFCM_GenImage(im);
out = FCMseg(im1);

end
