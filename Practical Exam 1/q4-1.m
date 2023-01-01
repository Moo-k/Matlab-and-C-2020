%this program asks a user to specify the dimensions and values of a
%matrix, then sums every other value of the left diagonal

%ask user to specify dimensions of matrix
rows = input('How many rows?: ');
cols = input('How many columns?: ');


%create empty matrixA
matrixA = [];


%for each row and column
for r = 1:rows
    for c = 1:cols
        %ask for user input
        matrixA(r,c) = input("Enter value for row "+(r)+", column "+(c)+":");
    end
end


%create empty vector of left diagonal values
diagLeft = [];

%for each element in matrixA
for i = 1:size(matrixA,1)
    for j = 1:size(matrixA,2)
        %if row value = column value (aka left diagonal)
        if i == j
            %add element at i,j to vector of left diagonal values
            diagLeft = [diagLeft matrixA(i,j)];
        end
    end
end


%create sum value of every other left diagonal value, starting at 0
sumDiagLeft = 0;

%for each odd index of diagLeft, add its value to sumDiagLeft
for k = 1:length(diagLeft)
    if mod(k,2)~=0
        sumDiagLeft = sumDiagLeft + diagLeft(k);
    end
end

%print sum of all elements in alternate values of left diag
fprintf("The sum of all elements of the alternate values of the left diagonal is: %d\n", sumDiagLeft);