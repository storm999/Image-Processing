clear;close all;clc
I=imread('1.jpg');
figure('Name','Original Image','NumberTitle','off');
imshow(I); title('Original Image');
[U,V,Z]=size(I);
x0=round(U/2);
y0=round(V/2);
theta=pi/2;

I2=uint8(zeros(U,V,Z));

for x1=1:U
    for y1=1:V
        x2=round(cos(theta)*(x1-x0)-sin(theta)*(y1-y0))+x0;
        y2=round(sin(theta)*(x1-x0)+cos(theta)*(y1-y0))+y0;
        if(x2<U && y2<V && x2>0 && y2>0)
            I2(x2,y2,:)=I(x1,y1,:);
        end
    end
end

figure('Name','Rotate Image','NumberTitle','off');
imshow(I2); title('Rotate Image');