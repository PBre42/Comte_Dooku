function [out] = sEntry(src,event,h,ii,jj)
    % Ecriture des chiffres en gras
    sudokugui = get(h,'UserData');    
    set(sudokugui.X(ii,jj),'FontWeight','bold');