

function New_Image = median_speckle(I)
New_Image=double(I);
[r c]=size(I);
for i=2:r-1
    for j=2:c-1
        matrix=[I(i-1,j-1),I(i-1,j),I(i-1,j+1),I(i,j-1),I(i,j),...
            I(i,j+1),I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
        matrix=sort(matrix);
        New_Image(i,j)=matrix(5);
    end
end
end