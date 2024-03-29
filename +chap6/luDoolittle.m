function [ X, L, U, P, Y, PA, PB, n, singular ] = luDoolittle( A, B, printLatex )

    n = size(B, 1);
    X = zeros(n, 1);
    L = zeros(n);
    U = zeros(n);
    Y = zeros(n, 1);
    P = eye(n);
    
     singular = 0;
    if (  abs(det(A)) < 1e-8   )
        singular = 1;
        errordlg('Matrix is singular', 'Input Error');
        return;
    end
    
    
    for i = 1:n
        L(i,i) = 1;
    end
    
    
  %   for i = 1:n %% calc permutation matrix P
  %     if A(i,i)==0 
  %         for j = 1:n
  %             if A(j,i)~=0 &&  A(i,j)~=0
  %                  temp = P(i, :); %%swap rows
  %                  P(i, :) = P(j, :);
  %                  P(j, :) = temp;
  %                 break;
  %             end
  %         end
  %     end         
  %   end
  
  P = chap6.pivot(A);
    
    A = P*A;
    
    for i = 1: n   %%calc L and U
        for j = 1: n
            if (j < i)
                t = 0;
                for k = 1:j-1
                    t = vpa(   t + L(i,k)* U(k, j)  );
                end
                L(i, j) = vpa(   (A(i, j) - t) / U(j, j)  );
            else 
                t = 0;
                for k = 1:i-1
                    t = vpa(   t + L(i, k)* U(k, j)   );
                end
                U(i, j) = vpa(   A(i, j) - t     );
            end
        end
    end
    
    B = P*B;
    
    for i = 1:n %%calc Y
        t = 0;
        for j = 1:i-1
            t = vpa(  t + L(i, j)*Y(j) );
        end 
        Y(i) = vpa(  B(i)- t  );
    end
    
        
    for i = n:-1:1  %% calc X
       t = 0;
       for j = i+1:n
          t = vpa(  t + U(i, j)*X(j));
       end
       X(i) = vpa(   ( Y(i) - t ) / U(i, i)  );
    end
    
    
    PA = A;
    PB = B;
    
    %print latex
    
        chap6.printOutput(X,n, printLatex);
        printLatex('Steps: ');
        printLatex( strcat('L = ', latex(sym(L,'d')))  );
%         printLatex('');
%         printLatex('');
%         printLatex('');
%         printLatex('');
        printLatex(strcat('U = ', latex(sym(U,'d')))  );
%         printLatex('');
%         printLatex('');
%         printLatex('');
%         printLatex('');
        printLatex(strcat('Y = ', latex(sym(Y,'d')))  );
        
        

end

