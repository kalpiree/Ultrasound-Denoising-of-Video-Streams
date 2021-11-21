function z1 = fourier_speckle(I)
%CLEARING PREVIOUS OUTPUT
%clc
%close all
%clear all
%CENTRAL SHIFTING
f = I;
%figure(1),imshow(f)
[M, N] = size(f);
for m = 1:M-1
   for n = 1:N-1
       f(m, n) = f(m, n).* (-1)^(m + n);
   end
 end

 
% FAST FOURIER TRANSFORM
wM        = zeros(M, M);
wN        = zeros(N, N);
 
for u = 0 : (M - 1)
    for x = 0 : (M - 1)
        wM(u+1, x+1) = wM(u+1, x+1)+ exp(-2 * pi * 1i / M * x * u);
    end    
end
 
for v = 0 : (N - 1)
    for y = 0 : (N - 1)
        wN(y+1, v+1) = wN(y+1, v+1)+ exp(-2 * pi * 1i / N * y * v);
    end    
end
G = im2double(f);

F = (wM * G );
F = (F * wN);

%CONVOLUTING LOW PASS FILTER WITH FOURIER TRANSFORM OF IMAGE
D0 = 50; 
  

u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;
  

[V, U] = meshgrid(v, u);
  
% Calculating Euclidean Distance
D = sqrt(U.^2+V.^2);
  
% Comparing with the cut-off frequency and 
% determining the filtering mask
H = double(D > D0);
  
% Convolution between the Fourier Transformed
% image and the mask
G = H.*F;
% OUTPUT OF FAST FOURIER TRANSFORM

%H = wM * im2double(f) * wN/255;
%output = im2uint8(log(1 + abs(H)));
%figure(1),imshow(output);




%INVERSE FAST FOURIER TRANSFORM

[M, N] = size(G);

wM        = zeros(M, M);
wN        = zeros(N, N);





 
for x = 0 : (M - 1)
    for u = 0 : (M - 1)
        wM(x+1,u+1) =  wM(x+1,u+1)+ exp(2 * pi * 1i / M * x * u);
    end    
end
 
for y = 0 : (N - 1)
    for v = 0 : (N - 1)
        wN( v+1,y+1) =  wN( v+1,y+1)+ exp(2 * pi * 1i / N * y * v);
    end    
end
 
g= abs(wM * im2double(G) * wN);
%figure(2),imshow(g,[])

[x y]=size(g);
z = ones(x,y);
z1 = 1+ g;
%figure(2),imshow(z1,[])
end
