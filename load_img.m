
clear all

% NIFTI_20130306

str_seg = 'E:\MR Image\database\IBSR_V2.0_nifti_stripped\IBSR_nifti_stripped\IBSR_01\IBSR_01_segTRI_fill_ana.nii';

str_org = 'E:\MR Image\database\IBSR_V2.0_nifti_stripped\IBSR_nifti_stripped\IBSR_01\IBSR_01_ana.nii';

I_nii_org = load_nii(str_org);                     % nii structure
I_nii_seg = load_nii(str_seg);

I_org = I_nii_org.img;                            % nii.img
I_seg = I_nii_seg.img;
[M,S,N] = size(I_org);

I = I_org;

I_f = reshape(I(:,S/2,:),M,N); % 冠状面
I1 = mat2gray(I_f);
subplot(2, 2, 1), imshow(I1);
%imwrite(I1, './11.bmp');

I_h = reshape(I(:,:,N/2+5), M,S); % 水平面
subplot(2,2,2), imshow(uint8(I_h));
I1 = I_h;
I1(find(I_h~=1)) = 0;
%imshow(I1);
%imwrite(I1, './11_1.bmp');

I_s = reshape(I(M/2,:,:), S,N); % 矢状面
subplot(2,2,3), imshow(uint8(I_s));
