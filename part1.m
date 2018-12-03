
Img1 = imread('../HW3/hw3/data/part1/uttower/left.jpg');
Img2 = imread('../HW3/hw3/data/part1/uttower/right.jpg');

Img1dub = im2double(Img1);
Img2dub = im2double(Img2);

Img1gray = rgb2gray(Img1dub);
Img2gray = rgb2gray(Img2dub);

imshow(Img1gray);
imshow(Img2gray);
