%ask user for input of height, width & total no. of mines
heightMines = input("input height of minefield: ");
widthMines = input("input width of minefield: ");
totalMines = input("input number of mines: ");

%create minefield of size height*width
minefield = zeros(heightMines, widthMines);
%fill with totalMines mines randomly
for i = 1:totalMines
    filled = false;
    while filled == false
        %if random value is empty, put mine, else generate another rand
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

%needs fence of 0s to check for mines since row/col value must be positive
%otherwise can detect for edge and corner values
%start fencing with 0s
playingField = [];

for s = 1:heightMines
    for t = 1:widthMines
        playingField(s+1,t+1) = minefield(s,t);
    end
end


playingField(:,size(playingField,2)+1) = 0;
playingField(size(playingField,1)+1,:) = 0;
%end of fencing with 0s

%while solved = 0, run loop to check a square
solved = 0;
while solved == 0
row = input("row: ");
col = input("col: ");

if playingField(row,col)==9
    %lose if bomb
    fprintf("YOU LOSE");
    return;
elseif playingField(row,col) == 0
    count = 0;
    %show surrounding number of mines
    for s = row:(row+2)
        for t = col:(col+2)
            if playingField(s,t) == 9
                count = count + 1;
            end
        end
    end
    playingField(row+1,col+1) = count;
end
disp(playingField);
countzeroes = 0;
for r = 2:(size(playingField,1)-1)
    for c = 2:(size(playingField,2)-1)
        if playingField(r,c) == 0
            countzeroes = countzeroes + 1;
        end
    end
end

if countzeroes ~= 0
    solved = 0;
else
    fprintf("YOU WIN!");
    return;
end
end