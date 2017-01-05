function out = romberg(f, a, b, n,printLatex)
   function out = trapezoid(h)
        out = eval(vpa(sum(eval(subs(f,a:h:b))),digits));
        out = eval(vpa(out - sum(eval(subs(f,[a b])))/2,digits));
        out = eval(vpa(out*h,digits));
   end 
   table = zeros(n,n);
   hs = (ones(1,n)*0.5).^(0:(n-1));
   table(:,1) = arrayfun(@trapezoid,hs)';
   for col=2:n
       p=col-1;
       for row=col:n
           table(row,col) = eval(vpa((4^p * table(row,col-1) - table(row-1,col-1))/(4^p-1),digits));
           printLatex(sprintf('$$T(h_{%d},...,h_{%d}) = %.*f$$', row-col,row,digits,table(col,col)));
       end
       
   end
   out = table(n,n);
end