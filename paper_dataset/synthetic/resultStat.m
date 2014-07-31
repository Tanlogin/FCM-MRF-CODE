clc
clear all
close all

filePath = './10%-2/';
I1 = imread([filePath,'~1.bmp']);
I_fcm = imread([filePath, '~FCM.bmp']);

G = [0,85,170,255];
AnB = [0,0,0,0];
A = [0,0,0,0];
B = [0,0,0,0];
[M,N] = size(I1);
for i=1:M
    for j=1:N
        for k=1:length(G)
            if I1(i,j)==G(k)
                A(k) = A(k)+1;
            end
            if I_fcm(i,j)==G(k)
                B(k) = B(k)+1;
            end
            if (I1(i,j)==G(k)) && (I_fcm(i,j)==G(k))
                AnB(k) = AnB(k)+1;
            end
        end
    end
end

rho = 2.*AnB ./ (A + B);
Rfp = (B - AnB) ./ A;
Rfn = (A - AnB) ./ A;

rho,Rfp,Rfn

k=2;
R1='B';
R2='E';
xlsFile = [filePath, 'stat.xls'];
xlswrite(xlsFile, G, 'Sheet1', [R1,num2str(k),':',R2,num2str(k)]);
xlswrite(xlsFile, rho, 'Sheet1', [R1,num2str(k+1),':',R2,num2str(k+1)]);
xlswrite(xlsFile, Rfp, 'Sheet1', [R1,num2str(k+2),':',R2,num2str(k+2)]);
xlswrite(xlsFile, Rfn, 'Sheet1', [R1,num2str(k+3),':',R2,num2str(k+3)]);

