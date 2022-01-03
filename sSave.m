function sSave(srv,event,h)
    sudokugui = get(h,'UserData');
    for ii = 1:9
        for jj = 1:9
            string_ij = get(sudokugui.X(ii,jj),'string');
            if(isempty(string_ij))
                A(ii,jj) = 0;
            else
                A(ii,jj) = str2double(string_ij);
            end
        end
    end

    filename ="./existingSudokus/" + get(sudokugui.name,'string') + ".csv";
    writematrix(A,filename);
    
    % Updating List Box
    bmpfiles = dir('./existingSudokus/*.csv');
    listString = cell(1, numel(bmpfiles));
    [listString{:}] = bmpfiles.name;
    set(sudokugui.select, 'String', listString);