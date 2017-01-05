function [ X, n ] = printOutput( X, n, printLatex )
    
z = 'x1 = ';
    z = strcat(z, num2str( X(1)) , ' ');
    for i = 2:n
       txt =  strcat('x',num2str(i), ' = ', num2str( X(i)));
       z = sprintf('%s\n%s', z, txt); 
    end
    printLatex( z );

end

