function [sor_] = sorozat(A,k)

for I = 0:k
    ind_(I+1) = 2^(2*I);    
end;

sor_(1) = A(1,1);
for I = 1:k
    sor_(sum(ind_(1:I))+1:sum(ind_(1:I+1)))=A(1:ind_(I+1),I+1);
end;
end

