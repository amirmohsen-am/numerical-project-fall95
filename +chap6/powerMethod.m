function [ dominant, dominantVector, values, vectors ] = powerMethod( A, steps, initial, printLatex)
        
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
        
        %printlatex
        z = sprintf('%s\n%s\n%s', 'dominant eigenvalue:', num2str(eval(dominant)), ' and coressponding eigenvector');
        for i = 1:n
            z = sprintf('%s\n%s',z, num2str(dominantVector(i)));
        end
        
        printLatex(z);
end

