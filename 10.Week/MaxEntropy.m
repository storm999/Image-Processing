clear;close all;clc
img=imread('1.jpg');
figure('Name','Original Image','NumberTitle','off');
imshow(img); title('Original Image');
img=rgb2gray(img);
[U,V]=size(img);
figure('Name','Gray Image','NumberTitle','off');
imshow(img); title('Gray Image');
h=zeros(1,256); 
J=zeros(1,256);
for row=1:U
    for col=1:V
        p=img(row,col);
        h(p+1)=h(p+1)+1;
    end
end
P=h/(U*V);
for t=1:256
    W0=sum(P(1:t-1));
    W1=sum(P(t:256));
    H0=0;
    H1=0;
    for j=1:t-1             
        if(W0>0)&&(P(j)>0)
            H0=H0+P(j)/W0*log(P(j)/W0);
        end
    end
    for j= t:256
        if(W1>0)&&(P(j)>0)
            H1=H1+P(j)/W1*log(P(j)/W1);
        end
    end
    H0=H0*(-1);
    H1=H1*(-1);
    J(t)=H0 + H1;
end
[Max,Index] = max(J);
threshold = Index - 1;
disp(['Threshold Value = ' num2str(threshold)]);
img(img<threshold)=0;
img(img>=threshold)=255;
figure('Name','Maximum Entropy Method Image','NumberTitle','off');
imshow(img); title('Maximum Entropy Method Image');