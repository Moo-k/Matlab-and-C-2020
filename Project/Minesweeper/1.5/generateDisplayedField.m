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

newDisplayed = [];
for g = 1:size(displayedField,1)
    for h = 1:size(displayedField,2)
        newDisplayed(g+1,h+1) = displayedField(g,h);
    end
end

%create row and column of zeroes on the end of matrix
newDisplayed(:,1) = 9;
newDisplayed(1,:) = 9;
newDisplayed(:,size(newDisplayed,2)+1) = 9;
newDisplayed(size(newDisplayed,1)+1,:) = 9;

newMarked = [];
for i = 1:size(markedMinefield,1)
    for j = 1:size(markedMinefield,2)
        newMarked(i+1,j+1) = markedMinefield(i,j);
    end
end

%create row and column of zeroes on the end of matrix
newMarked(:,1) = 9;
newMarked(1,:) = 9;
newMarked(:,size(newMarked,2)+1) = 9;
newMarked(size(newMarked,1)+1,:) = 9;

%if 0 open surrounding
%loop 3x
for x = 1:3
zeroesOpened = 0;
while zeroesOpened == 0
    for a = 1:size(newMarked,1)
        for b = 1:size(newMarked,2)
            if newDisplayed(a,b) == 1 && newMarked(a,b) == 0
                for c = (a-1):(a+1)
                    for d = (b-1):(b+1)
                        newDisplayed(c,d) = 1;
                    end
                end
            end
        end
    end
zeroesOpened = 1;
end
end

finalField = markedMinefield;
%remove fence of 9s on finalField
finalField(1,:) = [];
finalField(:,1) = [];
finalField(size(finalField,1),:) = [];
finalField(:,size(finalField,2)) = [];

finalDisplayed = newDisplayed;
%remove fence of 9s on finalDisplayed
finalDisplayed(1,:) = [];
finalDisplayed(:,1) = [];
finalDisplayed(size(finalDisplayed,1),:) = [];
finalDisplayed(:,size(finalDisplayed,2)) = [];

displayedField = finalDisplayed;
