function [ isSDD ] = checkSDD( A )
    
    n = size(A, 1);
    
    isSDD = 1;
    
    
    for i = 1:n
        t = 0;
        for j = 1:n
            if (i~=j)
                t = vpa(  t+ abs( A(i, j) )  );
            end
        end
        if abs(A(i,i)) <= t
            isSDD = 0;
            break;
        end
    end
            
    
    

end

