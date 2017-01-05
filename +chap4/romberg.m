function out = romberg(f, a, b, n,printLatex)
   function out = trapezoid(h)
        out = sum(eval(subs(f,a:h:b)));
        out = out - sum(eval(subs(f,[a b])))/2;
        out = out*h;
   end 
   table = zeros(n,n);
   hs = (ones(1,n)*0.5).^(0:(n-1));
   table(:,1) = arrayfun(@trapezoid,hs)';
   for col=2:n
       p=col-1;
       for row=col:n
           table(row,col) = (4^p * table(row,col-1) - table(row-1,col-1))/(4^p-1);
           printLatex(sprintf('$$T(h_{%d},...,h_{%d}) = %.4f$$', row-col,row,table(col,col)));
       end
       
   end
   out = table(n,n);
end