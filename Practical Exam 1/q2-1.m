%this program declares a vector A and outputs the amount of even numbers


%declare vector A of n numbers
A = [5, 4, 6, 7, 3];


%count total number of even numbers in vector A
%start count at 0
totalEven = 0;


%for each element of A
for i = 1:length(A)
    %if element in index i of A is even
    if mod(A(i),2) == 0
        %add 1 to total count
        totalEven = totalEven + 1;
    end
end


%display total amount of even numbers
fprintf("The total amount of even numbers is %d.\n", totalEven);