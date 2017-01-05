function [ dominant, dominantVector, values, vectors ] = powerMethod( A, steps, initial)
        
        n = size(A, 1);
        
        X = initial;
        values = zeros(1, steps);
        vectors = zeros(n, steps);
        for i = 1:steps
           Y = vpa(  A*X  );
           c = max(abs(Y));
           X = vpa(  Y/c  );
           values(i) = c;
           vectors(:, i) = X;   
        end
        dominant = c;
        dominantVector = vectors(:, i);
    

end

