

I = imread('IMG_0076.jpg');
%Split into RGB Channels
num =0;
bbox1 = double.empty; 
for i = 1:612
    im = imcrop(I,bbox(i,:));
    Red = im(:,:,1);
    Green = im(:,:,2);
    Blue = im(:,:,3);

%Get histValues for each channel
[yRed, x1] = imhist(Red);
[yGreen, x1] = imhist(Green);
[yBlue, x1] = imhist(Blue);
%Plot them together in one plot
% plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');

if max(yRed)>0.75*max(yBlue)
    bbox1=cat(1,bbox1,bbox(i,:));
    num = num+1;
end
end

detectedImg = insertObjectAnnotation(img,'rectangle',bbox1,'cell',...
    'TextBoxOpacity',0.1);
figure; imshow(detectedImg);
hold on
plot(x, y, 'w.', 'LineWidth', 1, 'MarkerSize', 20);
