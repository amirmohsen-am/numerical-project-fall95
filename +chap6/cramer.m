function [ X, detA, Ai, detAi, n, singular ] = cramer( A, B, printLatex)

    n = size(B,1);
    X = zeros(n, 1);
    detA = vpa(  det(A)  );
    detAi = zeros(n, 1);
    Ai = zeros(n, n, n);
    
    singular = 0;
    if (  abs(detA) < 1e-5   )
        singular = 1;
        errordlg('Matrix is singular', 'Input Error');
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
    
    
    %printlatex
    chap6.printOutput(X,n, printLatex);
    printLatex('Steps:');
    
    printLatex( strcat('det(A) = ',num2str(eval(detA))));
    for i = 1:n
%         printLatex('');
%         printLatex('');
%         printLatex('');
%         printLatex('');
        txt1 = strcat( 'A_', num2str(i),' :', latex(sym(Ai(:,:,i), 'd')),'\\\rightarrow ');
        txt2 = strcat(' det A_', num2str(i),' = ', num2str(detAi(i)) );
        printLatex(strcat(txt1, txt2));
%         printLatex('');
%         printLatex('');
%         printLatex('');
%         printLatex('');
%         printLatex(    );
    end
    
    
end

