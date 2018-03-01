clc;close all;clear
I=imread('1.jpg');
figure('Name','Some Image Types','NumberTitle','off');
subplot(1,3,1);imshow(I);title('Original Image');
I=rgb2gray(I);
subplot(1,3,2);imshow(I);title('Gray Image');
[U,V,Z]=size(I);
masksize=3;
m=floor(masksize/2);
MaskX=[-1 -2 -1;0 0 0;1 2 1];
MaskY=[-1 0 1;-2 0 2;-1 0 1];
I2=I;
for u=1:U
    for v=1:V
        GX=0; GY=0;
         for i=-m:m
                for j=-m:m
                    x=u+i;
                    y=v+j;
                    if(x<=U) && (x>0) && (y<=V) &&(y>0)
                         GX=GX+int32(I(x,y))*MaskX(i+2,j+2);
                         GY=GY+int32(I(x,y))*MaskY(i+2,j+2);
                         G=sqrt(double(GX^2+GY^2));
                    end
                end
         end
         I2(u,v)=G;
    end
end
subplot(1,3,3);imshow(I2);title('Sobel Edge Detection Image');

