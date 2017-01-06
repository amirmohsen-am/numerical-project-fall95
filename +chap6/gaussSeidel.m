function [ X, answer, newA, newB, n, isSDD, singular ] = gaussSeidel( A, B, steps, initial, printLatex )
    
    n = size(B, 1);
    answer = zeros(n, steps+1);
    answer(:, 1) = initial;
    
     singular = 0;
    if (  abs(det(A)) < 1e-8   )
        singular = 1;
        errordlg('Matrix is singular', 'Input Error');
        return;
    end
    
    isSDD = chap6.checkSDD(A); %% if isDD is 1, then the matrix is strictly diagonally dominant, otherwise it's not
    
    
    if isSDD == 0
        Atranspose = transpose(A);
        A = Atranspose*A;
        B = Atranspose*B;
    end
    
    for k = 2:steps+1
        for i = 1:n
            t = 0;
            for j = 1:i-1
                t = vpa(  t + A(i, j)*answer(j, k)  );
            end
            for j = i+1:n
                t = vpa(  t + A(i, j)*answer(j, k-1)  );
            end
            answer(i, k) = vpa(  (B(i) - t)/A(i, i)  );
        end
    end
    
    X = answer(:, steps+1);
                         
    newA = A;
    newB = B;
    
        chap6.printOutput(X,n, printLatex);

    for i = 2:steps+1
               printLatex(strcat('Step ', num2str(i-1)));
            for j = 1:n
                txt1 = strcat('x_',num2str(j),'^',num2str(i-1), ' = ', num2str(answer(j,i)));
                printLatex(txt1);
            end
     end
                        

end

