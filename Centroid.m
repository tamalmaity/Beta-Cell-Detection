tic;


x = double.empty;
y = double.empty;

Il0 =fullfile('e:\Beta Cell Detection\warwick_beta_cell_dataset\images','IMG_0042.jpg');
I=imread(Il0);


for i = 1:size(bbox,1)
im = imcrop(I,bbox(i,:));
im1 = histeq(im);
I1 = im2bw(im1,0.5);
I12 = imcomplement(I1);
fullim = imfill(I12,'holes');
stats = regionprops(fullim, 'Centroid','Area');
Ar = cat(1,stats.Area);
S = cat(1,stats.Centroid);
tf = isempty(S);
if tf==1
    x = cat(1,x,(bbox(i,1)+(bbox(i,3)/2)));
    y = cat(1,y,(bbox(i,2)+(bbox(i,4)/2)));
    continue;
end
[A_max,A_ind] = max(Ar(:));
x = cat(1,x,(S(A_ind,1)+bbox(i,1)));
y = cat(1,y,(S(A_ind,2)+bbox(i,2)));
end


detectedImg = insertObjectAnnotation(I,'rectangle',bbox,'Cell',...
    'TextBoxOpacity',0.1);
figure; imshow(detectedImg);
hold on
plot(x, y, 'w.', 'LineWidth', 1, 'MarkerSize', 20);


toc;

