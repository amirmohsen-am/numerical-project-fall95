function [ X ] = cramer2( A,B )
    
        
    n = size(B,1);
    X = zeros(n, 1);
    detA = vpa(  det(A)  );
    detAi = zeros(n, 1);
    Ai = zeros(n, n, n);
    
    singular = 0;
    if (  abs(detA) < 1e-5   )
        singular = 1;
        return;
    end
    
    for i = 1: n
        Ai(:,:,i) = A;
        for j = 1 : n
            Ai(j, i, i) = B(j);
        end
        detAi(i) = vpa(  det(Ai(:,:,i) ) );
    end
    
    for i = 1:n
       X(i) = vpa(  detAi(i)/ detA  ); 
    end

end

