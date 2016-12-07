function [ output_args ] = lagrange( number, Xi, Fi )
    
    %Xi vector of Xs
    %Fi vector of Fs
    %number number of points
    syms x;
    P = 0;
    for i = 1: number
        L = 1;
        for j = 1: number
              if j ~= i
                  L = L*(x-Xi(j));
                  L = L / (Xi(i) - Xi(j));
              end
        end
       P = P + Fi(i)*L; 
    end
    P = simplify(P);
    output_args = vpa(P, digits);
            
                
end

