function [minesFlagged] = checkFlagged(displayedField,markedMinefield)
%check if all mines are flagged and if all flags are mines
minesFlagged = 1;
for a = 1:size(displayedField,1)
    for b = 1:size(displayedField,2)
        if markedMinefield(a,b) == 9 && displayedField(a,b) ~= 2
            minesFlagged = 0;
            return;
        elseif markedMinefield(a,b) ~= 9 && displayedField(a,b) == 2
            minesFlagged = 0;
            return;
        end
    end
end