function out = gauss(f, a, b, n, printLatex)
    m = n+1;
    p=sym('tmp',[1,m+1]);
    x=sym('x');
    p(1)=1;
    p(2)=x;
    for i=3:m+1
        p(i) = eval(vpa(((2*m-1)*x*p(i-1)-(m-1)*p(i-2))/m,digits));
    end
    xs = solve(p(m+1))';
    weights = 2./((1-xs.*xs).*(subs(diff(p(m+1),x),xs).^2));
    xs = eval(vpa(xs*((b-a)/2) + (b+a)/2,digits));
    fs = eval(vpa(subs(f,xs),digits));
    for i=1:length(xs)
        printLatex(sprintf('$$x_%d=%.*f , f_%d = %.*f $$', i,digits,eval(xs(i)), i ,digits,eval(fs(i))));
    end
    out = sum(subs(f,xs).*weights)*(b-a)/2;
    out = eval(out);
end