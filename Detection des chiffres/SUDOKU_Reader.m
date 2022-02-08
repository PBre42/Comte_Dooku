function Sudoku_Grille = SUDOKU_Reader(Img_sudoku)

%% Charge l'image de SUDOKU
%I_sudoku =imread('test2.jpg');
%figure(1)
%imshow(I_sudoku,[]);title('Grille sudoku a remplir');

%% Resize de l'image 
% On change la taille de l'image a 460x460
%I_size = imresize(I_sudoku, [460 460]); 
%figure(2)
%imshow(I_size,[]);title('Grille sudoku a remplir');

%% Passage en N&B
BW = ~imbinarize(rgb2gray(Img_sudoku),'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
%figure (3)
%subplot (1,3,1); imshow(BW); title('BW');


% Enleve bruit
I_bwN = bwareaopen(BW,40);
%subplot (1,3,2); imshow(I_bwN); title('I_bwN');
%hold on

% Nettoie les bordures
I_clear = imclearborder(I_bwN);
%subplot(1,3,3); imshow(I_clear); title('I_clear');

%% Recherche du contour de la grille
Donnees = regionprops(I_clear,'Area','BoundingBox','PixelList');
[maxValue,index] = max([Donnees.Area]);

xMin = ceil(Donnees(index).BoundingBox(1));
xMax = xMin + (Donnees(index).BoundingBox(3)) - 1;
yMin = ceil(Donnees(index).BoundingBox(2));
yMax = yMin + (Donnees(index).BoundingBox(4)) - 1;

%figure (4)
%imshow (I_clear); hold on 

DIAG1 = sum(Donnees(index).PixelList,2);
DIAG2 = diff(Donnees(index).PixelList,[],2);

[m,dUL] = min(DIAG1);    
[m,dDR] = max(DIAG1);
[m,dDL] = min(DIAG2);
[m,dUR] = max(DIAG2);

%pts = Donnees(index).PixelList([dUL dDL dDR dUR dUL],:);
%h_pts = plot(pts(:,1),pts(:,2),'','linewidth',3);

%% Crop l'image pour l'affichage
Width = (xMax-xMin);
Height =(yMax-yMin);
I_crop = imcrop(Img_sudoku,[xMin yMin Width Height]);
%figure
%imshow(I_crop);

%% Remplir chiffre 
[Plocal Sudoku_Grille]=Identifier_Nombre(I_crop);
%figure
%subplot(1,2,1);imshow(Plocal);
%subplot(1,2,2);imshow(Img_sudoku);


end

