clear;close all;clc
I=imread('1.jpg');
figure('Name','Original Image','NumberTitle','off');
%I=rgb2gray(I);
imshow(I); title('Original Image');
[U,V,Z]=size(I);
masksize=3;
m=floor(masksize/2);
I2=I;

    for u=1:U
        for v=1:V
            H=[];
            for i=-m:m
                for j=-m:m
                    x=u+i;
                    y=v+j;
                    if((x<=U) && (x>0) && (y<=V) &&(y>0))
                        H=[H,I(x,y,:)];
                    end
                end
            end
            I2(u,v,:)=mean(H);
        end
    end

figure('Name','Mean Image','NumberTitle','off');
imshow(I2); title('Mean Image');