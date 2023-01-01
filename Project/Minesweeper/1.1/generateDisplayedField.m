function [displayedField] = generateDisplayedField(rowCoord,colCoord,displayedField,markedMinefield)
%if in open mode, if mine(9) selected, return, else open cell(1)
if markedMinefield(rowCoord,colCoord) == 9
    return;
else
    displayedField(rowCoord,colCoord) = 1;
end