function [N,SudokuGrille] = Identifier_Nombre(I_crop)

Taille_1=size(I_crop,1);
Taille_2=size(I_crop,2);
%load TEMPLATEDATA
compt=0;
SudokuGrille = zeros(9);
for i=1:9
    for j=1:9
        compt=compt+1;
        I_Nbr= imcrop(I_crop,[round((i-1)*Taille_1/9) round((j-1)*Taille_2/9) round(Taille_1/9) round(Taille_2/9)]);
        L=size(I_Nbr,1);
        C=size(I_Nbr,2);
        Lin=floor(0.15*L);
        Col=floor(0.15*C);
        N1=I_Nbr(Lin:(L-Lin), Col:C-Col-3);

        %I_Bw = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
        % Resize to be 20x20
        %N1= rgb2gray(I_Nbr);
        %N1=imbinarize(N1);
        N =imresize(N1,[32 32]);
        %Deep Leaning
        imwrite(N,sprintf('data/MonNombre%d.png',compt));
        SudokuGrille(i,j)=2;
    end 
end
