%clear all values in previous program
%functions used: generateMines generateDisplayedField printField checkSolved
clear all; clc;

%input size of minefield & how many mines
heightMines = input("input height of minefield: ");
widthMines = input("input width of minefield: ");
totalMines = input("input number of mines: ");
%if 0 or negative mines, reprompt or if 0 empty spaces or more mines than there is space, reprompt
while totalMines <= 0 || totalMines >= (heightMines*widthMines)
    totalMines = input("input number of mines: ");
end

%starting cell
initialRow = input("input row coord: ");
initialCol = input("input col coord: ");

%minefield with full information(9 == mine)since cell can't show 9 mines surrounding
markedMinefield = generateMines(heightMines,widthMines,totalMines,initialRow,initialCol);

%array of 0s, 1s  (0 hidden 1 shown) shown to player
displayedField = zeros(heightMines,widthMines);
%initial cell picked is opened
displayedField(initialRow,initialCol) = 1;

%print initial field
printField(displayedField,markedMinefield);

%while not solved, run loop
solved = 0;
while solved == 0
    %input coordinates to check
    rowCoord = input("input row coord: ");
    colCoord = input("input col coord: ");
    %open or flag
    flag = input("open(1) or flag(2): ");
    %update displayedField
    displayedField = generateDisplayedField(rowCoord,colCoord,displayedField,markedMinefield,flag);
    %print to player referencing displayedField to markedField
    printField(displayedField,markedMinefield);
    %check if solved (or exploded) (win == 1,lose == 2,keep going == 0)
    solved = checkSolved(displayedField,totalMines,markedMinefield,rowCoord,colCoord,flag);
    %if no boom
    if solved ~= 2
    %if all flags are mines and all mines are flagged, solved = 1
        minesFlagged = checkFlagged(displayedField,markedMinefield);
        if minesFlagged == 1
            solved = 1;
        elseif minesFlagged == 0
            solved = 0;
        end
    end
    %win==1,lose==2,keep going==0
    if solved == 1
        fprintf("YOU WIN!\n");
        return;
    elseif solved == 2
        fprintf("GAME OVER!\n");
        return;
    end
end