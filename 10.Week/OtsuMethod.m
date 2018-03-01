clear;close all;clc
img=imread('1.jpg');
figure('Name','Original Image','NumberTitle','off');
imshow(img); title('Original Image');
img=rgb2gray(img);
figure('Name','Gray Image','NumberTitle','off');
imshow(img); title('Gray Image');
[U,V]=size(img);
h=zeros(1,256); 
J=zeros(1,256);
for row=1:U
    for col=1:V
        p=img(row,col); h(p+1)=h(p+1)+1;
    end
end
P=h./(U*V);
i=1:256;
NT=sum(i.*P);
for t=1:256
    W0=sum(P(1:t-1));
    W1=sum(P(t:256));
    WT=W0+W1;
    N0=sum((i(1:t-1).*P(1:t-1))/W0);
    N1=sum((i(t:256).*P(t:256))/W1);
    G0=W0*(N0-NT).^2;
    G1=W1*(N1-NT).^2;
    J(t)=G0+G1;
end
[Max,Index]=max(J);
threshold=Index-1;
disp(['Threshold Value = ' num2str(threshold)]);
img(img<threshold)=0;
img(img>=threshold)=255;
figure('Name','Otsu Method Image','NumberTitle','off');
imshow(img); title('Otsu Method Image');