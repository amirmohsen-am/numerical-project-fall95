function [ vectors, values] = eigen( A, printLatex)
        
        n = size(A,1);
        syms v;
        newA = sym(zeros(n));
        vectors = zeros(n,n);
        for i = 1:n
            for j = 1:n
                newA(i, j) = A(i, j);
            end
        end
        for i = 1:n
           newA(i, i) = newA(i, i) - v;
        end
        deter = vpa(  det(newA)  );
        values = vpa(  solve(deter)  );
        
       % distinctVal = unique(values);
       % s = size(distinctVal,1)
%         for i = 1:n
           % for j = 1:n
           %     newA(j,j) = A(j,j) - values(i);
%            % end
%            newA = A - values(i)*eye(n);
%             newA
%             m = vpa(  rref(newA)  ) 
%             vectors(n,i) = 1;
%             for j = n-1:-1:1
%                 t = 0;
%                 for k = j+1:n
%                     t = vpa(  t - m(j,k) );
%                 end
%                 vectors(j,i) = t;
%             end
%         end
     

    %printLatex
    z = mat2str(eval(values));
    printLatex(z)
                
            
            
        
        
        
        
    

end

