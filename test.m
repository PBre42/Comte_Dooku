function sOpen(src,event,h)
    sudokugui = get(h,'UserData');
    % Get the selected file
    nfile = get(sudokugui.select,'value');
    files = get(sudokugui.select,'string');
    filepath = "./existingSudokus/" + files(nfile);
    A = readmatrix(filepath);

    print("ha");