function [N Sudoku] = Identifier_Nombre(I_crop)

Taille_1=size(I_crop,1);
Taille_2=size(I_crop,2);
compt=0;
for i=1:1
    for j=1:1
        compt=compt+1;
        I_RGB= imcrop(I_crop,[round((i-1)*Taille_1/9) round((j-1)*Taille_2/9) round(Taille_1/9) round(Taille_2/9)]);
        %N1=I_Nbr(Lin:(L-Lin), Col:C-Col-3);

        %I_Bw = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
        % Resize to be 20x20
        I_g= rgb2gray(I_RGB);
        I_BW=~imbinarize(I_g);
        I_border=uint8((imclearborder(I_BW)));
        Img_write=~I_border;
        N =imresize(Img_write,[32 32]);
        %Deep Leaning
        imwrite(N,sprintf('data/MonNombre%d.png',compt));
    end 
end
system("python3 Sudoku_DP.py")
Data=fopen("data/data.txt",'r');
Sudoku_Grille= fscanf(Data,'%d');
compt=0;
for i=1:9
    for j=1:9
        compt=compt+1;
        Sudoku(j,i)=Sudoku_Grille(compt);
    end
end 
fclose(Data);


