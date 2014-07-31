clc;
clear all;

I = uint8(zeros(256,256));

I(1:128,129:256) = 199;
I(1:128,1:128) = 145;
I(129:256,1:128) = 100;
I(129:256,129:256) = 0;

imwrite(I,'./1.bmp');

Variance = 50; %0.06 * 256;
Noise = sqrt(Variance) * randn(256,256);
I1 = uint8( double(I) + Noise );

% 信噪比5，即添加5%的噪声
I1 = uint8( awgn(double(I), 20, 'measured') );

imwrite(I1, './1_n.bmp');
