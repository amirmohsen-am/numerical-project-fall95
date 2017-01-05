classdef rootFindingMethod
    %rootFindingMethod Abstraction of iterative root finding methods
    %   Handles the basic drawing stuff but delegates the logic to
    %   subclasses
    
    properties
    end
    
    methods(Access = public)
        %TODO: cleanup walkthrough cells
        %TODO: extracting function for latex texts
        %TODO: fix getHeader for other root methods too to handle $$
        function solution = findRoot(obj, F, x0, x1, step, handles)
            global precision
            new_x=x0;
            texty=0;
            folan_step = 0.05;
            walkthrough=obj.getHeader(F);
            
            for i=1:length(walkthrough)
                axes(handles.axesLog);
                text(0.1, texty-folan_step/2, walkthrough{i}, 'Interpreter', 'latex');
                texty = texty-folan_step;
                axes(handles.axesPlot);
            end
            
            for i=1:step
                set(handles.textStep, 'String', sprintf('Step: %d',i))
                
                y0 = eval(subs(F,'x',x0));
                y1 = eval(subs(F,'x',x1));
                
                if i > 1
                    pause(0.75);
                    delete(p0);
                    delete(p1);
                end
                if abs(eval(subs(F,'x',new_x)))<eps
                    set(handles.textStep, 'String', sprintf('Step: %d Finished early',i));
                    solution={new_x, walkthrough};
                    break;
                end
                res = obj.getNext(F,x0,x1,y0,y1);
                x0=eval(vpa(res(1),digits));
                x1=eval(vpa(res(2),digits));
                
                y0 = eval(vpa(eval(subs(F,'x',x0)),digits));
                y1 = eval(vpa(eval(subs(F,'x',x1)),digits));
                p0 = plot(x0,y0,'go');
                p1 = plot(x1,y1,'go');
                
                axes(handles.axesLog);
                text(0.1, texty-folan_step/2, sprintf(sprintf('$$x_{%%d} = %%.%df$$',precision), i, res(3)), 'Interpreter', 'latex');
                texty = texty-folan_step;
                axes(handles.axesPlot);
                
%                 walkthrough{length(walkthrough)+1}=sprintf('x_%d = %.5f', i, res(3));
                solution={res(3),walkthrough};
                new_x = res(3);
                    
                
                %range = abs(x0-x1)*2;
                %xlim([(x0+x1)/2-range, (x0+x1)/2+range]);
            end
        end
    end
end

