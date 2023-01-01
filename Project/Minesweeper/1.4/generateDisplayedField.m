function [displayedField] = generateDisplayedField(rowCoord,colCoord,displayedField,markedMinefield,flag)
%if in open mode, if mine(9) selected, return, else open cell(1)
if flag == 1
    if markedMinefield(rowCoord,colCoord) == 9
        return;
    else
        displayedField(rowCoord,colCoord) = 1;
    end
%if in flag mode, mark selected cell as flag(2)
elseif flag == 2
    displayedField(rowCoord,colCoord) = 2;
end