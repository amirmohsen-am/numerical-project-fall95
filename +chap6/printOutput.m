function [ X, n ] = printOutput( X, n, printLatex )
    

    printLatex('Answers:')
    for i = 1:n
       txt =  strcat('x',num2str(i), ' = ', num2str( X(i)));
         printLatex( txt );
    end
    
end

