%% Comparing with the result that is provided
tic;
close all;
i4 = fullfile('e:\','Beta Cell Detection','warwick_beta_cell_dataset',...
    'result_LIPSyM','IMG_0042_result.png');
i5 = imread(i4);
figure, imshow(i5);
valid_x_ord = double.empty;
% valid_x_shift = double.empty;
% valid_y_shift = double.empty;
valid_y_ord = double.empty;
for i = 1:768
    for j =1:1024
        if i5(i,j)==255
            valid_x_ord = cat(1,valid_x_ord,i);
%             if i-8>0
%                 valid_x_shift = cat(1,valid_x_shift,i-8);
%             else
%                 valid_x_shift = cat(1,valid_x_shift,0);
%             end
            valid_y_ord = cat(1,valid_y_ord,j);
%             if j-8>0
%                 valid_y_shift = cat(1,valid_y_shift,j-8);
%             else
%                 valid_y_shift = cat(1,valid_y_shift,0);
%             end
        end
    end
end
hold on;
plot (valid_y_ord,valid_x_ord,'.r');
hold off;
valid = cat(2,valid_y_ord,valid_x_ord);
% t = 16*ones(size(valid_x,1),1);
% valid_bbox1 = cat(2,valid_y_shift,valid_x_shift,t,t);
% valid_bbox = cat(1,valid_bbox,valid_bbox1);

detectedImg = insertObjectAnnotation(i5,'rectangle',bbox2,'cell',...
    'TextBoxOpacity',0.1);
figure; imshow(detectedImg);
hold on
plot(valid_y_ord,valid_x_ord, 'w.', 'LineWidth', 1, 'MarkerSize', 20);


%% Finding out mu d and mu n
mean_dist = double.empty;
for i = 1:size(valid,1)
    dist =10000;
    for j = 1:size(centre,1)
        d = pdist2 (valid(i,:),centre(j,:));
        if d<dist
            dist = d;
        end
    end
    mean_dist = cat(1,mean_dist,dist);
end


detectedImg = insertObjectAnnotation(img,'rectangle',bbox2,'cell',...
    'TextBoxOpacity',0.1);
figure; imshow(detectedImg);
hold on
plot(x, y, 'w.', 'LineWidth', 1, 'MarkerSize', 20);
hold on 
plot(valid_y_ord,valid_x_ord,'r.');
mean_ans = mean(mean_dist);
std_ans = std(mean_dist);
diff_cells = size(centre,1)- size(valid,1);
if diff_cells<0
    diff_cells= - diff_cells;
end
fprintf('%.4f %.4f %d',mean_ans,std_ans,diff_cells);
toc;