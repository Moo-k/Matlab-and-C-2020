%this program reads in 5 numbers from user, stores them in a vector numVec,
%and prints the second half of the vector


%create empty storage vector
numVec = [];


%read in 5 values from user
for i = 1:5
    inputNum(i) = input("Enter number " + (i) + ":");
    %store each element into storage vector
    numVec = [numVec inputNum(i)];
end


%print second half of storage vector
%if length of vector is even
if mod(length(numVec),2)==0
    for j = 1:length(numVec)/2
        %print element in index (j + length/2)
        fprintf(" %d",numVec(j+length(numVec)/2));
    end
    fprintf("\n");
    
%if length of vector is odd
elseif mod(length(numVec), 2) ~= 0
    for k = 1:(length(numVec)+1)/2
        %print element in index (k + (length-1)/2)
        fprintf(" %d",numVec(k+(length(numVec)-1)/2));
    end
    fprintf("\n");
end