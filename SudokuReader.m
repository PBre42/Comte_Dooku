function Sudoku_Grille = SudokuReader(Img_sudoku)
%% Passage en N&B
BW = ~imbinarize(rgb2gray(Img_sudoku),'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

% Enleve bruit
I_bwN = bwareaopen(BW,40);

% Nettoie les bordures
I_clear = imclearborder(I_bwN);

%% Recherche du contour de la grille
Donnees = regionprops(I_clear,'Area','BoundingBox','PixelList');
[maxValue,index] = max([Donnees.Area]);

xMin = ceil(Donnees(index).BoundingBox(1));
xMax = xMin + (Donnees(index).BoundingBox(3)) - 1;
yMin = ceil(Donnees(index).BoundingBox(2));
yMax = yMin + (Donnees(index).BoundingBox(4)) - 1;

%% Crop l'image pour l'affichage
Width = (xMax-xMin);
Height =(yMax-yMin);
I_crop = imcrop(Img_sudoku,[xMin yMin Width Height]);

%% Remplir chiffre 
[Plocal, Sudoku_Grille]=IdentifierNombre(I_crop);
end

