%this program declares a 2d array A of size n x n, and prints out every other
%value of the left diagonal of A


%declare array A
A = [5,4,6,7; 1,2,3,4; 5,6,4,2; 4,5,3,2];


%create vector of all values in left diagonal of A
diagLeft = [];


%for each element in A
%for each row
for r = 1:size(A,1)
    %for each column
    for c = 1:size(A,2)
        %if row value = column value (aka left diagonal)
        if r == c
            %add element at r,c to vector of left diagonal values
            diagLeft = [diagLeft A(r,c)];
        end
    end
end


%for each odd index of diagLeft, print its value
for i = 1:length(diagLeft)
    if mod(i,2)~=0
        fprintf("%d ", diagLeft(i));
    end
end
fprintf("\n");