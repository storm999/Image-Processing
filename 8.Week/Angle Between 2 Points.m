clear;clc;close all

A=[0 4];
B=[3 0];

dis=sqrt((A(1)-B(1))^2 + (A(2)-B(2))^2);
disA=sqrt((A(1)-0)^2 + (A(2)-0)^2);
disB=sqrt( (0-B(1))^2 + (0-B(2))^2);

angle = acos((((dis^2 - disA^2-disB^2) / -2*disA*disB)))*180/pi;
