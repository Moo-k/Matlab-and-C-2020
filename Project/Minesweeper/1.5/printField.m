function [printstuff] = printField(displayedField,markedMinefield)

%for each cell
%if unopened(0), print X
%if opened(1), print true value of that cell
%if flagged(2), print F
for r = 1:size(displayedField,1)
    for c = 1:size(displayedField,2)
        if displayedField(r,c) == 0
            fprintf("X ");
        elseif displayedField(r,c) == 1
            fprintf("%d ", markedMinefield(r,c));
        elseif displayedField(r,c) == 2
            fprintf("F ");
        end
    end
    %print row value at end of each row
    fprintf("  %d\n",r);
end
fprintf("\n");

%print col values, space for single digit, no space for 2 digits
for colborder = 1:size(displayedField,2)
    if colborder <= 9
        fprintf("%d ",colborder);
    else
        fprintf("%d",colborder);
    end
end
fprintf("\n");