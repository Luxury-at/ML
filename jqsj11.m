x=imread('C:\Users\13431\Desktop\zuhe.jpg');
y=imread('C:\Users\13431\Desktop\zu.jpg');
%imshow(y);
y=imresize(y,[230,360]);
[m1,n1,l1] = size(x);
[m2,n2,l2] = size(y);
t = zeros(m1,n1,l1); 
t = uint8(t);
t((m1/2-m2/2+1):(m1/2+m2/2),(n1/2-n2/2+1):(n1/2+n2/2),:) = y ;%做居中处理
im0=rgb2gray(t);
imshow(im0);
im01=imbinarize(im0,0.29);              %设定阈值二值化
im01(508:512,349:356)=1;                %细节化处理

imshow(im01);
im01=uint8(im01);
im1=x.*(1-im01);                        %对背景图片做挖空处理
imshow(im1);
C = imadd(t,im1);                       %进行拼接
imshow(C);
