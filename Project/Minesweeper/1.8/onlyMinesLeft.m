function [solved] = onlyMinesLeft(displayedField,markedMinefield)
%if all unopened are mines, win
minesUnopened = 1;
for r = 1:size(displayedField,1)
    for c = 1:size(displayedField,2)
        if displayedField(r,c) == 0 && markedMinefield(r,c) ~= 9
            minesUnopened = 0;
            break;
        end
    end
end

if minesUnopened == 0
    solved = 0;
elseif minesUnopened == 1
    solved = 1;
end