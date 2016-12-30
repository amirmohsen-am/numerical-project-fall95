function out = trapezoidal(f, a, b, h)
    format long
    out = sum(eval(subs(f,a:h:b)));
    out = out - sum(eval(subs(f,[a b])))/2;
    out = out*h;
end