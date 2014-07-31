
function [images, Dim] = load_img(str)

h = openimage(str);
imageInfo = getimageinfo(h, 'DimSizes');
frames = imageInfo(1);
slices = imageInfo(2);
height = imageInfo(3);
width = imageInfo(4);
Dim = [frames, slices, height, width];
if 0==frames
    images1 = getimages(h, 1:slices);
    images2 = reshape(images1, width, height, slices);
    images = zeros(height, width, slices);
    for i=1:slices
        images(:,:,i) = rot90(images2(:,:,i));
    end
else
    error('frmaes not zero');
end

% viewimage(images2(:,:,floor(slices/2)));

% I = mat2gray(images2(:,:,floor(slices/2)));
% figure, imshow(rot90(I));

end
