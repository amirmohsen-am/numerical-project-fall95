classdef bisection < chap2.rootFindingMethod
    methods(Access = public)
        function res = getHeader(obj, F)
            F=char(simplify(subs(F,sym('x'))));
            res = { sprintf('f(x) = %s = 0',texlabel(F)),...
                'x_{i+1} = \frac{x_i+x_{i-1}}{2}'};
        end
        
        function res = getNext(obj,F, x0, x1,y0,y1)
            x2 = (x1+x0)/2;
            y2 = eval(subs(F,'x',x2));
            plot(x0:0.01:x1,eval(subs(F,'x',x0:0.01:x1)),'r');
            
            if(y2*y0<0)
                x1=x2;
                
            else
                x0=x2;
            end
            plot(x0:0.01:x1,eval(subs(F,'x',x0:0.01:x1)),'g');
            
            res=[x0,x1,x2];
        end
    end
end