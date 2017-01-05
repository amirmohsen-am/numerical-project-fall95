function out = trapezoidal(f, a, b, h, printLatex)
    counter=0;
    for i=a:h:b
        printLatex(sprintf('f_{%d} = %.*f',counter,digits,eval(subs(f,i))))
        counter=counter+1;
    end
    
    out = eval(vpa(sum(eval(subs(f,a:h:b))),digits));
    out = eval(vpa(out - sum(eval(subs(f,[a b])))/2,digits));
    out = eval(vpa(out*h,digits));
end