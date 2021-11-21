function PSNR_val=  PSNR(I,ref)
I = I;
%ref = im2double(ref);
n = size(I);
M = n(1);
N = n(2);
MSE_val = sum(sum((I-ref).^2)) / (M*N);
PSNR_val = abs(10*log10((256*256) / MSE_val));
end
