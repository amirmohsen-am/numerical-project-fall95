function out = trapezoidal(f, a, b, h, printLatex)
    counter=0;
    for i=a:h:b
        printLatex(sprintf('f_{%d} = %.4f',counter,eval(subs(f,i))))
        counter=counter+1;
    end
    
    out = sum(eval(subs(f,a:h:b)));
    out = out - sum(eval(subs(f,[a b])))/2;
    out = out*h;
end