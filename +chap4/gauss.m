function out = gauss(f, a, b, n)
    m = n+1;
    p=sym('tmp',[1,m+1]);
    x=sym('x');
    p(1)=1;
    p(2)=x;
    for i=3:m+1
        p(i) = ((2*m-1)*x*p(i-1)-(m-1)*p(i-2))/m;
    end
    xs = solve(p(m+1))';
    weights = 2./((1-xs.*xs).*(subs(diff(p(m+1),x),xs).^2));
    xs = xs*((b-a)/2) + (b+a)/2;
    out = sum(subs(f,xs).*weights)*(b-a)/2;
    out = eval(out);
end