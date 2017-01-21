function out = diff(f, p, degree, error, h, printLatex)
    function out = ev(delta)
        out = eval(vpa(eval(subs(f,sym('x'),p+delta*h)),digits));
    end
    function ez_print(xs)
        for i=1:length(xs)
            delta=xs(i);
            if delta<0
                printLatex(sprintf('f_{i%d} = %.*f',delta,digits,ev(delta)))
            else
                printLatex(sprintf('f_{i+%d} = %.*f',delta,digits,ev(delta)))
            end
        end
    end
    if error==2
        sum = 0;
        sgn = 1;
        j=floor((degree+1)/2);
        for i = 0:degree
            delta = j;
            ez_print([delta])
            sum = eval(vpa(sum + nchoosek(degree,i)*ev(delta)*sgn,digits));
            sgn = sgn*-1;
            j=j-1;
            if j==0 && mod(degree,2)==1
                j=j-1;
            end
        end
        sum = sum / h^degree;
        if mod(degree,2)==1 % degree is odd
            sum = sum /2;
        end
        out = sum;
    end
    if error==4
        if degree==1
            out = (-ev(2) + 8*ev(1) - 8*ev(-1) + ev(-2))/(12*h);
            out_3point = (-3*ev(0) + 4*ev(1) - ev(2))/(2*h);
            best = eval(subs(diff(f,sym('x')),p));
            if abs(out_3point-best) < abs(out-best)
                printLatex('.$Using 3point method$.');
                ez_print([0 1 2]);
                out=out_3point;
            else
                ez_print([2 1 -1 -2]);
            end
        elseif degree==2
            out = (-ev(2) + 16*ev(1) -30*ev(0) + 16*ev(-1) - ev(-2))/(12*h^2);
            ez_print([2 1 0 -1 -2]);
        elseif degree==3
            out = (-ev(3) + 8*ev(2) - 13*ev(1) + 13*ev(-1) -8*ev(-2)+ev(-3))/(8*h^3);
            ez_print([3 2 1 -1 -2 -3]);
        elseif degree==4
            out = (-ev(3) + 12*ev(2) - 39*ev(1) + 56*ev(0) -39*ev(-1) + 12*ev(-2) - ev(-3))/(6*h^4);
            ez_print([3 2 1 0 -1 -2 -3]);
        else
            out = 'Only degree 1 to 4 is supported for error of O(h^4)';
        end
    end
    if ~ischar(out)
        out = eval(vpa(out,digits));
    end
end