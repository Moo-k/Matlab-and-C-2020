function [finalField] = generateMines(heightMines,widthMines,totalMines)

%create array of zeroes of size heightMine*widthMines
minefield = zeros(heightMines, widthMines);

%for each mine in total
for i = 1:totalMines
    filled = 0;
    while filled == 0
        %randomly generate cell, if not filled, put a mine
        randHeight = randi(heightMines);
        randWidth = randi(widthMines);
        if minefield(randHeight,randWidth) == 9
            filled = 0;
        elseif minefield(randHeight,randWidth) == 0
            minefield(randHeight,randWidth) = 9;
            filled = 1;
        end
    end
end

%initialise a matrix which shows how many mines there are surrounding each cell
markedField = [];

%create fence of zeroes (to check surrounding cells for mines)
%row/col value cant be 0

%move each element of minefield 1 row down and 1 column out
for s = 1:heightMines
    for t = 1:widthMines
        markedField(s+1,t+1) = minefield(s,t);
    end
end

%create row and column of zeroes on the end of matrix
markedField(:,size(markedField,2)+1) = 0;
markedField(size(markedField,1)+1,:) = 0;

%for each cell not on the fence or a mine, check how many mines surround it
for r = 2:(size(markedField,1)-1)
    for c = 2:(size(markedField,2)-1)
        if markedField(r,c) == 0
            count = 0;
            for i = (r-1):(r+1)
                for j = (c-1):(c+1)
                    if markedField(i,j) == 9
                        count = count+1;
                    end
                end
            end
        elseif markedField(r,c) == 9
            count = 9;
        end
        markedField(r,c) = count;
    end
end


finalField = markedField;
%remove fence of 0s
finalField(1,:) = [];
finalField(:,1) = [];
finalField(size(finalField,1),:) = [];
finalField(:,size(finalField,2)) = [];