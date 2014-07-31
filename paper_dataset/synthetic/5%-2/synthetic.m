clc;
clear all;

N = 128;
I = uint8(zeros(N,N));
N1 = N/2;
I(1:N1,N1+1:N) = 199;
I(1:N1,1:N1) = 145;
I(N1+1:N,1:N1) = 100;
I(N1+1:N,N1+1:N) = 0;

imwrite(I,'./1.bmp');

Variance = 50; %0.06 * 256;
Noise = sqrt(Variance) * randn(N,N);
I1 = uint8( double(I) + Noise );

% 信噪比5，即添加5%的噪声
I1 = uint8( awgn(double(I), 20, 'measured') );

imwrite(I1, './1_n.bmp');
