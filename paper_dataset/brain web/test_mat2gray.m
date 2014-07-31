
% 测试 mat2gray 函数是否会损失灰度深度

str = 'E:\MR Image\database\brainWeb\brainweb.mnc';
[images, Dim] = load_img(str);
frames = Dim(1);
slices = Dim(2);
height = Dim(3);
width = Dim(4);
viewimage(images(:,:,floor(slices/2)));
I = images(:,:,floor(slices/2));
N1 = listColor(I);
I1 = mat2gray(I);
N2 = listColor(I1);
figure, imshow(I1);

segImg = FCMseg(I);
figure, imshow(segImg);
