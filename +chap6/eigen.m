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
                
        B = zeros(n,1);
%         
        for i = 1:n
            newA = A - values(i)*eye(n);
            for j = 1:n
                B(j) = -newA(j,1);
            end
            nums = 1:n;
            for j = 1:n
                nums = setdiff(nums, nums(j));
                newMat = newA(nums, 2:n);
                if abs(det(newMat)) > 1e-5
                    break;
                end
            end
            B = setdiff(B, B(j));
          
            vectors(:,i) = [1;chap6.cramer2(newMat,B)];
        end


            
            
                
       

    %printLatex
    
    for i = 1:n
        z = sprintf('%s%s', 'Value :', num2str(i));
        printLatex(z);
        z = num2str(eval(values(i)));
        printLatex(z);
        z = 'Corresponding Vector :';
        printLatex(z);
        for j = 1:n
            z = num2str(vectors(j,i));
            printLatex(z);
        end
    end
                
            
            
        
        
        
        
    

end

