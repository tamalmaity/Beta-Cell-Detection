% % close all;
% 
% % rng(1,'twister');
% 
% f= fullfile('e:\Beta Cell Detection\warwick_beta_cell_dataset\images','IMG_0060.jpg');
% he = imread(f);
% % he = imcrop(he1,bbox(549,:));
% % figure, imshow(he), title('H&E image');
%  
% cform = makecform('srgb2lab');
% lab_he = applycform(he,cform);
% 
% ab = double(lab_he(:,:,2:3));
% nrows = size(ab,1);
% ncols = size(ab,2);
% ab = reshape(ab,nrows*ncols,2);
% 
% nColors = 3;
% % repeat the clustering 3 times to avoid local minima
% [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
%                                       'Replicates',3);
%                                   
% pixel_labels = reshape(cluster_idx,nrows,ncols);
% figure, imshow(pixel_labels,[]), title('image labeled by cluster index');
% 
% 
% p_lab = zeros(768,1024,'double');
% for i=1:768
%     for j=1:1024
%         if pixel_labels(i,j) == 2
%             p_lab(i,j) = 1;
%         end
%     end
% end
% 
% % figure, imshow(p_lab);
% 
% %% Calculation of the percentage of DAB stain
% perc_arr = double.empty;
% for i= 1: size(bbox,1)
%     fiog = imcrop(p_lab,bbox(i,:));
%     num=0;
%     for i1= size(fiog,1)
%         for j1 = size(fiog,2)
%             if fiog(i1,j1)==1
%                 num = num+1;
%             end
%         end
%     end
%     perc_arr = cat(1,perc_arr,(num/(size(bbox,1)*size(bbox,2))));
% end
% 
% % plotting after the result
% centre_x = double.empty();
% centre_y = double.empty();
% bbox2 = double.empty;
% for i = 1:size(perc_arr,1)
%    if  perc_arr(i)>0
%        bbox2 = cat(1,bbox2,bbox(i,:));
%        centre_x = cat(1,centre_x,x(i,:));
%        centre_y = cat(1,centre_y,y(i,:));
%    end
% end
% 
% detectedImg = insertObjectAnnotation(img,'rectangle',bbox2,'cell',...
%     'TextBoxOpacity',0.1);
% figure; imshow(detectedImg);
% hold on
% plot(x, y, 'w.', 'LineWidth', 1, 'MarkerSize', 20);
% 
% centre = cat(2,centre_x,centre_y);
% centre = sortrows(centre,1);
% % scurr = rng


tic;

%% New code coz the old one just won't work.Only God knows why!!
f= fullfile('e:\Beta Cell Detection\warwick_beta_cell_dataset\images','IMG_0042.jpg');
he = imread(f);
bbox2 = double.empty;
centre_x = double.empty();
centre_y = double.empty();
for i = 1:size(bbox,1)
%     img_crop = imcrop(he,bbox(i,:));
%     if mean(mean(img_crop(:,:,1)))- mean(mean(img_crop(:,:,3)))>80
%         bbox2 = cat(1,bbox2,bbox(i,:));
%         centre_x = cat(1,centre_x,x(i,:));
%         centre_y = cat(1,centre_y,y(i,:));
%     end
        imbw_crop1 = imcrop(imageHDAB(:,:,2),bbox(i,:));
        imbw_crop2 = imcrop(imageHDAB(:,:,1),bbox(i,:));
        wp =0;
%         imbw_crop = rgb2gray(imbw_crop1);
%         for i = 1:size(imbw_crop1)
%             for j=1:size(imbw_crop1)
%                 if imbw_crop2(i,j)>=imbw_crop1(i,j)...
%                         && imbw_crop1(i,j)<0.75
%                     wp =wp+1;
%                 end
%                 j=j+1;
%             end
%             i=i+1;
%         end
        wp = sum (imbw_crop1(:)<0.75);
        if wp<(bbox(i,3)^2-10) || sum(imbw_crop2(:))<sum(imbw_crop1(:))
            continue;
        end
        bbox2 = cat(1,bbox2,bbox(i,:));
        centre_x = cat(1,centre_x,x(i,:));
        centre_y = cat(1,centre_y,y(i,:));
end

detectedImg = insertObjectAnnotation(img,'rectangle',bbox2,'Cell',...
    'TextBoxOpacity',0.1);
figure; imshow(detectedImg);
hold on
plot(x, y, 'w.', 'LineWidth', 1, 'MarkerSize', 20);

centre = cat(2,centre_x,centre_y);
centre = sortrows(centre,1);


toc;


