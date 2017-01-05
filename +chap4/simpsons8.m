function out = simpsons8(f, a, b, h, printLatex)
    n = round((b-a)/h);
    if mod(n,3)~=0
        out='N must be multiple of 3 for simpson 3/8';
        return
    end
    m=[1 repmat([3 3 2],1,n/3)];
    m(n+1)=1;
    out = eval(subs(f,a:h:b));
    
    cnt = 0;
    for i=a:h:b
        cnt=cnt+1;
        printLatex(sprintf('%df_{%d} = %.4f',m(cnt), cnt-1,m(cnt)*out(cnt)))
    end
    
    out = m.*out;
    out = sum(out)*h*3/8;
end