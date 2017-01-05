function [ X, reduced, n, singular] = gauss( A, B, printLatex )

    n = size(B, 1);
    X = zeros(n,1);
    Aug = [A B];
    reduced = zeros(n, n+1, n);
    
     singular = 0;
    if (  abs(det(A)) < 1e-8   )
        singular = 1;
        return;
    end
    
%    for i = 1:n %% after this no entry on main diagonal is zero
%       if Aug(i,i)==0 
%           for j = 1:n
%               if Aug(j,i)~=0 &&  Aug(i,j)~=0
%                    temp = Aug(i, :); %%swap rows
%                    Aug(i, :) = Aug(j, :);
%                    Aug(j, :) = temp;  
%                   break;
%               end
%           end
%       end         
%    end
    P = chap6.pivot(Aug);
    Aug = P*Aug;
    reduced(:,:,1) = Aug;
    
    
    for i=1:n    %% backward Gaussian
       for j = i+1:n
           t = vpa(   Aug(j,i) / Aug(i,i)  );
          Aug(j, :) = vpa(  Aug(j, :) - t*Aug(i,:)  ) ;
       end
       if (i~=n)
        reduced(:,:,i+1) = Aug;
       end
    end
    
    
    for i = n:-1:1
        t = 0;
        for j = i+1:n
            t = vpa(  t + X(j)*Aug(i, j)  );
        end
        X(i) = vpa(  (Aug(i, n+1) - t)/Aug(i,i)  );
    end
    
    
    %print latex
    
        printOutput(X,n, printLatex);

    
end

