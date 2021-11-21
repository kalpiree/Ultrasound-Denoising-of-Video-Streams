function Y = recursive_temp(Y)
T=5;
a=0.32; 
[height,width,nframes] = size(Y);
h=double(zeros(height,width));
for f=2:nframes 
    current=Y(:,:,f);
    previous=Y(:,:,f-1);
    k=current-previous;
    [row, col]=size(current);
   for i=1:row
       for j=1:col
           if abs(k(i,j))<T 
           h(i,j)=a*current(i,j)+(1-a)*previous(i,j);
           else
           h(i,j)=current(i,j);
           end
       end
       
   end
   Y(:,:,f)=h;
end
