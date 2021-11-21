function new_image = mean_speckle(I)
%A = imread('cameraman.tif');
A= double(I);
 w = 1/9*[1 1 1;
        1 1 1;
        1 1 1];
 k= rot90(w,2);
[m , n]=size(A);
[o , p]= size(k);
centre =floor((size(k)+1)/2);
left= centre(2)-1;
right= o-centre(2);
up= centre(1)-1;
down= p-centre(1);
temp= zeros(m+up+down,n+right+left);

for t=1+up:m+up
    for u=1+right:n+right
        temp(t,u)=A(t-up,u-right);
    end
end
      
new_image= zeros(m,n);
for i=1:m
    for j=1:n
        for s= 1:o
            for l=1:p
                q= i-1;
                r= j-1;
                new_image(i,j)=new_image(i,j)+ (temp(q+s,l+r)*k(s,l));
            end
        end
    end
end
%figure,imshow(new_image,[]);
%figure,imshow(A,[]);
end