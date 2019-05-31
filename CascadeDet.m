tic;
close all;
%% Train Stop Sign Detector
% Load the positive samples data from a MAT file. The file contains
% a table specifying bounding boxes for several object categories.
% The table was exported from the Training Image Labeler app.
load('valid_bbox.mat');
load ('cell_40_56.mat');
load ('cell_57_85.mat');
% load ('negs_and_pos.mat');
%%
% Select the bounding boxes for cells from the table.
A3 = horzcat(OPandIPs(:,1),OPandIPs(:,2));
A4 = OPs(1:7,:);
A2 = vertcat(A3,A4);
A2.Properties.VariableNames = {'imageFilename' 'Positives'};

A1 = cell2table(V(1:15,:),'VariableNames',{'imageFilename','Positives'});
A = cat(1,A1,A2);

%%
% Add the image directory to the MATLAB path.
imDir = fullfile('e:\','Beta Cell Detection',...
    'warwick_beta_cell_dataset','images');
addpath(imDir);
%%
% Put all the negative images in a folder.
% Specify the foler for negative images.
% Create an |imageDatastore| object containing negative images.
negativeFolder = fullfile('e:\','Beta Cell Detection',...
    'warwick_beta_cell_dataset','images','Negatives');
negativeImages = imageDatastore(negativeFolder);
%%
% Train a cascade object detector called 'Cell_detection.xml'
% using HOG features.
% NOTE: The command can take several minutes to run.
trainCascadeObjectDetector('Cell_detection_1.xml',A, ...
    negativeImages,'NumCascadeStages',30,...
    'ObjectTrainingSize',[12 12],'TruePositiveRate',0.999,...
    'FeatureType','Haar');
%%
% Use the newly trained classifier to detect cells in an image.
tic;
detector = vision.CascadeObjectDetector('Cell_detection.xml',...
    'MaxSize',[20,20],'MergeThreshold',6,'MinSize',[12,12]);
%%
% Read the test image.
im =fullfile('e:\Beta Cell Detection\warwick_beta_cell_dataset\images','IMG_0042.jpg');
img = imread(im);
%%
% Detect the coordinates of the cells.
bbox = step(detector,img); 
% x = bbox(:,1) + (bbox(:,3)/2);
% y = bbox(:,2) + (bbox(:,4)/2);
%%
% Display the detected cells as dots.
detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'Cell',...
    'TextBoxOpacity',0.1);
figure; imshow(detectedImg);
toc;
% hold on
% plot(x, y, 'g.', 'LineWidth', 1, 'MarkerSize', 8);
%%
% Remove the image directory from the path.
rmpath(imDir); 
toc;