clc
clear all

str1 = 'synthetic/10%-2/';
str2 = '~FCM.bmp';
str = [str1, str2];
I = imread(str);
figure, subplot(1,2,1), imshow(I)

[M,N,C] = size(I);

gray = listColor(I);
if C==1 
    graySort = sort(gray);
else graySort = gray;
end

if 3==C
    I1 = I;
    grayReplace = graySort;
    for i=1:size(graySort,1)
        Ir = I(:,:,1);
        Ig = I(:,:,2);
        Ib = I(:,:,3);
        R=graySort(1); G=graySort(2); B=graySort(3);
        R1=grayReplace(1); G1=grayReplace(2); B1=grayReplace(3);
        q = find( 0==(abs(Ir-R) + abs(Ig-G) + abs(Ib-B)) );
        Ir(q) = R1;
        Ig(q) = G1;
        Ib(q) = B1;
        I1(:,:,1) = Ir;
        I1(:,:,2) = Ig;
        I1(:,:,3) = Ib;
    end
end

if 1==C
    I1 = I;
    grayReplace = [0,85,170,255];

    I1(find(I==0)) = 0;
    I1(find(I==85)) = 170;
    I1(find(I==170)) = 85;
    I1(find(I==255)) = 255;
end

subplot(1,2,2), imshow(uint8(I1));
imwrite(uint8(I1), [str1,'~',str2]);
disp(['writed to ',str1]);
