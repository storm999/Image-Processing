clear;close all;clc
I=imread('1.jpg');
figure('Name','Original Image','NumberTitle','off');
imshow(I); title('Original Image');
[U,V]=size(I);
masksize=3;
m=floor(masksize/2);
I2=I;
Mask=[1 2 1;2 3 2;1 2 1];
for u=1:U
    for v=1:V
        H=[];
        for i=-m:m
            for j=-m:m
                x=u+i;
                y=v+j;
                if((x<=U) && (x>0) && (y<=V) &&(y>0))
                    Weigthed=(int32(I(x,y)))*int32(Mask(i+2,j+2)); 
                    H=[H,[Weigthed;I(x,y)]];
                end
            end
        end
        A=sort(H,2);
        S=ceil(length(A(1,:))/2);
        I2(u,v)=A(2,S);
    end
end
figure('Name','Weigthed Median Image','NumberTitle','off');
imshow(I2); title('Weigthed Median Image'); 