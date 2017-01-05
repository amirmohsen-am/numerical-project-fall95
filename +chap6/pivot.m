function [ P ] = pivot( A )
    
    n = size(A, 1);
    P = eye(n);
    
    for i = 1: n-1
       
        [t, j] = max(abs(A(i:n, i)));
        temp = A(i, :);
        A(i, :) = A(j, :);
        A(j, :) = temp;
        temp = P(i, :);
        P(i, :) = P(j, :);
        P(j, :) = temp;
    end
    

end

