function [solved] = checkSolved(displayedField,totalMines,markedMinefield,rowCoord,colCoord,flag)
%count number of 0s
count = 0;
for r = 1:size(displayedField,1)
    for c = 1: size(displayedField,2)
        if displayedField(r,c) == 0
            count = count + 1;
        end
    end
end
%count number of flags
flagCount = 0;
for r = 1:size(displayedField,1)
    for c = 1: size(displayedField,2)
        if displayedField(r,c) == 2
            flagCount = flagCount + 1;
        end
    end
end

%if flags + 0s == totalMines, implies solved
if count+flagCount == totalMines
    solved = 1;
%if chosen cell is mine, solved = 2 (boom)
elseif markedMinefield(rowCoord,colCoord) == 9 && flag == 1
    solved = 2;
%otherwise, keep going
else
    solved = 0;
end