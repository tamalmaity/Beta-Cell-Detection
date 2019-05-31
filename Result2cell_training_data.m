

load ('Data_valid.mat');

V = cell(20,2);

V{1} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0040.jpg';
V{2} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0041.jpg';
V{3} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0042.jpg';
V{4} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0044.jpg';
V{5} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0048.jpg';
V{6} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0051.jpg';
V{7} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0053.jpg';
V{8} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0056.jpg';
V{9} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0057.jpg';
V{10} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0058.jpg';
V{11} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0060.jpg';
V{12} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0063.jpg';
V{13} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0067.jpg';
V{14} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0068.jpg';
V{15} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0070.jpg';
V{16} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0071.jpg';
V{17} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0073.jpg';
V{18} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0076.jpg';
V{19} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0082.jpg';
V{20} = 'E:\Beta Cell Detection\warwick_beta_cell_dataset\images\IMG_0085.jpg';

V{1,2} = valid_bbox(1:196,:);
V{2,2} = valid_bbox(197:363,:);
V{3,2} = valid_bbox(364:384,:);
V{4,2} = valid_bbox(385:399,:);
V{5,2} = valid_bbox(400:469,:);
V{6,2} = valid_bbox(470:477,:);
V{7,2} = valid_bbox(478:509,:);
V{8,2} = valid_bbox(510:526,:);
V{9,2} = valid_bbox(527:543,:);
V{10,2} = valid_bbox(544:620,:);
V{11,2} = valid_bbox(621:638,:);
V{12,2} = valid_bbox(639:647,:);
V{13,2} = valid_bbox(648:712,:);
V{14,2} = valid_bbox(713:727,:);
V{15,2} = valid_bbox(728:741,:);
V{16,2} = valid_bbox(742:877,:);
V{17,2} = valid_bbox(878:1074,:);
V{18,2} = valid_bbox(1075:1275,:);
V{19,2} = valid_bbox(1276:1489,:);
V{20,2} = valid_bbox(1490:1522,:);

V{14,2}(1,2)=1;
V{14,2}(2,2)=1;
V{17,2}(197,4)=10;
