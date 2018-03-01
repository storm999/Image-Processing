clear;clc;close all
URL='1.jpg';
I=imread(URL);
figure('Name','Original Image','NumberTitle','off');
imshow(I); title('Original Image');
I=rgb2gray(I);
figure('Name','Gray Image','NumberTitle','off');
imshow(I); title('Gray Image');
[U,V,Z]=size(I);
MaskSize=3;
m=floor(MaskSize/2);
Mask=[-1 -1 -1;-1 8 -1;-1 -1 -1];
I2=I;
for u=1:U 
    for v=1:V
        Temp=0;
        for i=-m:m
            for j=-m:m
                x=i+u;
                y=j+v;
                if(x>0)&&(x<=U)&&(y>0)&&(y<=V)
                    Temp=Temp+int32(I(x,y))*Mask(i+2,j+2);
                end
            end
        end
        I2(u,v)= Temp;
    end
end
figure('Name','Edge Detection Image','NumberTitle','off');
imshow(I2); title('Edge Detection Image');