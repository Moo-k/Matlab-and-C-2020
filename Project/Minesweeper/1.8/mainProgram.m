%clear all values in previous program
%functions used: generateMines generateDisplayedField printField checkSolved
clear all; clc;

%input size of minefield & how many mines
heightMines = input("Input minefield height: ");
while heightMines <= 0
    heightMines = input("Input minefield height: ");
end
widthMines = input("Input minefield width: ");
while widthMines <= 0
    widthMines = input("Input minefield width: ");
end
totalMines = input("Input number of mines: ");
%if 0 or negative mines, reprompt or if 0 empty spaces or more mines than there is space, reprompt
while totalMines <= 0 || totalMines >= (heightMines*widthMines)
    totalMines = input("Input number of mines: ");
end

%starting cell
initialRow = input("Input row coordinate: ");
while ~(initialRow>0) || ~(initialRow<=heightMines)
    initialRow = input("Input row coordinate: ");
end
initialCol = input("Input column coordinate: ");
while ~(initialCol>0) || ~(initialCol<=widthMines)
    initialCol = input("Input column coordinate: ");
end

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
    rowCoord = input("Input row coordinate: ");
    while ~(rowCoord>0) || ~(rowCoord<=heightMines)
        rowCoord = input("Input row coordinate: ");
    end
    colCoord = input("Input column coordinate: ");
    while ~(colCoord>0) || ~(colCoord<=widthMines)
        colCoord = input("Input column coordinate: ");
    end
    %open or flag
    flag = input("Open(1) or Flag(2): ");
    while ~(flag == 1 || flag == 2)
        flag = input("Open(1) or Flag(2): ");
    end
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
        if solved ~= 1
        %if all unopened are mines
        solved = onlyMinesLeft(displayedField,markedMinefield);
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