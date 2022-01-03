function sOpen(src,event,h)
    sudokugui = get(h,'UserData');
    % Get the selected file
    nfile = get(sudokugui.select,'value');
    files = get(sudokugui.select,'string');
    filepath = "./existingSudokus/" + files(nfile);
    A = readmatrix(filepath);

    % Write the file in our grid
    for ii = 1:9
        for jj = 1:9
            if(A(ii,jj) == 0)
                set(sudokugui.X(ii,jj),'String','');
            else
                set(sudokugui.X(ii,jj),'String',A(ii,jj));
            end
            
        end
    end
    print("ha");