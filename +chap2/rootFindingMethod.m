classdef rootFindingMethod
    %rootFindingMethod Abstraction of iterative root finding methods
    %   Handles the basic drawing stuff but delegates the logic to
    %   subclasses
    
    properties
    end
    
    methods(Access = public)
        
        function solution = findRoot(obj, F, x0, x1, step,stepHandle)
            new_x=x0;
            walkthrough=obj.getHeader(F);
            for i=1:step
                set(stepHandle, 'String', sprintf('Step: %d',i))
                
                y0 = eval(subs(F,'x',x0));
                y1 = eval(subs(F,'x',x1));
                
                if i > 1
                    pause(1);
                    delete(p0);
                    delete(p1);
                end
                if abs(eval(subs(F,'x',new_x)))<eps
                    set(stepHandle, 'String', sprintf('Step: %d Finished early',i));
                    solution={new_x, walkthrough};
                    break;
                end
                res = obj.getNext(F,x0,x1,y0,y1);
                x0=res(1);
                x1=res(2);
                
                y0 = eval(subs(F,'x',x0));
                y1 = eval(subs(F,'x',x1));
                p0 = plot(x0,y0,'go');
                p1 = plot(x1,y1,'go');
                
                walkthrough{length(walkthrough)+1}=sprintf('x_%d = %.5f', i, res(3));
                solution={res(3),walkthrough};
                new_x = res(3);
                    
                
                %range = abs(x0-x1)*2;
                %xlim([(x0+x1)/2-range, (x0+x1)/2+range]);
            end
        end
    end
end

