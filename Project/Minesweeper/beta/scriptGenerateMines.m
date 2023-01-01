clear all;clc;

heightMines = input("input height of minefield: ");
widthMines = input("input width of minefield: ");
totalMines = input("input number of mines: ");

minefield = zeros(heightMines, widthMines);

for i = 1:totalMines
    filled = false;
    while filled == false
        randHeight = randi(heightMines);
        randWidth = randi(widthMines);
        if minefield(randHeight,randWidth) == 0
            minefield(randHeight,randWidth) = 9;
            filled = true;
        elseif minefield(randHeight,randWidth) == 9
            filled = false;
        end
    end
end

disp(minefield);