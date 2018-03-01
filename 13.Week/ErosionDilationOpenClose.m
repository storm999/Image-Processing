clear;clc;close all
Image=imread('openerodedilateclose.jpg');
figure('Name','Some Image Types','NumberTitle','off');
subplot(2,3,1);imshow(Image);title('Original Image');
%Image=rgb2gray(Image);
threshold=150;
Image(Image>=threshold)=255;
Image(Image<threshold)=0;
Image=im2bw(Image);
[U,V]=size(Image);
MaskSize=7;
m=floor(MaskSize/2);
Erosion=Image;
for u=1:U
    for v=1:V
        if Image(u,v) == 1
            Mask=[];
            for i=-m:m
                for j=-m:m
                    x=u+i;
                    y=v+j;
                    if(x<=U) && (x>0) && (y<=V) &&(y>0)
                        Mask=[Mask,Image(x,y)];
                        if(Mask==1)
                            Erosion(u,v)=1;
                        else
                            Erosion(u,v)=0;
                        end
                    end
                end
            end
        end
    end
end
subplot(2,3,2);imshow(Erosion);title('Eroded Image');
Dilation=Image;
for u=1:U
    for v=1:V
        if Image(u,v) == 0
            Mask=[];
            for i=-m:m
                for j=-m:m
                    x=u+i;
                    y=v+j;
                    if(x<=U) && (x>0) && (y<=V) &&(y>0)
                        Mask=[Mask,Image(x,y)];
                        if(Mask==0)
                            Dilation(u,v)=0;
                        else
                            Dilation(u,v)=1;
                        end
                    end
                end
            end
        end
    end
end
subplot(2,3,3);imshow(Dilation);title('Dilated Image');
Open=Erosion;
for u=1:U
    for v=1:V
        Mask=[];
        for i=-m:m
            for j=-m:m
                x=u+i;
                y=v+j;
                if(x<=U) && (x>0) && (y<=V) &&(y>0)
                    Mask=[Mask,Erosion(x,y)];
                    if(Mask==0)
                        Open(u,v)=0;
                    else
                        Open(u,v)=1;
                    end
                end
            end
        end
    end
end
subplot(2,3,4);imshow(Open);title('Opened Image');
Close=Dilation;
for u=1:U
    for v=1:V
        Mask=[];
        for i=-m:m
            for j=-m:m
                x=u+i;
                y=v+j;
                if(x<=U) && (x>0) && (y<=V) &&(y>0)
                    Mask=[Mask,Dilation(x,y)];
                    if(Mask==1)
                        Close(u,v)=1;
                    else
                        Close(u,v)=0;
                    end
                end
            end
        end
    end
end
subplot(2,3,6);imshow(Close);title('Closed Image');