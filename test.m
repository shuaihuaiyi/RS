clear all;
img = imread('lena.bmp');
data = zeros(9,11);
j = -0.1;
for i=1:11
    j = j+0.1;
    data(1,i) = j;
    newimg = lsb(img,j);
    [data(2,i),data(3,i),data(4,i),data(5,i)]=rs(newimg);
    newimg = antiRsLsb(img,j);
    [data(6,i),data(7,i),data(8,i),data(9,i)]=rs(newimg);
end
