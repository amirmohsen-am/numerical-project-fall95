function final_string = Parentheses2(F) 
    if(isempty(F))
        final_string = '';
        return
    end
    i = 1;
     F = ['(' F ')'];
    lastOp = 1;
    while(isempty(F(i:length(F))) == 0)
%           display(F);
%           display('Now');
%           display(F(i));
%           display('start');
%           display(F(lastOp));
         if(lastOp >= i) 
            i = i + 1;
            continue;
         end
        if(F(i) == '+' || F(i) == '-' || F(i) == '*' || F(i) == '/' || F(i) == '^' || F(i) == '(' || F(i) == ')')
%             display('debug');
            if(isempty(F(lastOp + 1:i-1)) == 0)
            F = [F(1:lastOp) '(' F(lastOp + 1:i-1) ')' F(i:length(F))];
            i = i + 1;
            lastOp = i + 1;
            while(lastOp ~= length(F) && (F(lastOp+1) == '+' || F(lastOp+1) == '-' || F(lastOp+1) == '*' || F(lastOp+1) == '/' || F(lastOp+1) == '^' || F(lastOp+1) == '(' || F(lastOp+1) == ')'))
                lastOp = lastOp + 1;
            end
            i = i + 1;
            continue;
            end
            lastOp = lastOp + 1;
        end
        i = i + 1;
    end
     
    i = 1;
    pCount = 0;
    lastOp = 1;
    while(isempty(F(i:length(F))) == 0)
%          display(F);
         if(lastOp >= i) 
            i = i + 1;
            continue;
         end
        if(F(i) == '^')
%                  display(F(i));
        
            pCount = 0;
            for j = i-1 : -1 : 1
                if (F(j) == ')')
                    pCount = pCount + 1;
                elseif (F(j) == '(')
                    pCount = pCount - 1;
                end 
                
                if(pCount == 0)
                    F = [F(1:j-1) '(' F(j:length(F))];
                    
                    break;
                end
                
            end
            
            i = i + 1;
            pCount = 0;  
            for j = i+1 : length(F)
                if (F(j) == ')')
                    pCount = pCount + 1;
                elseif (F(j) == '(')
                    pCount = pCount - 1;
                end 
                
                if(pCount == 0)
                    F = [F(1:j-1) ')' F(j:length(F))];
                    break
                end
                
            end
            i = i + 1;
        end
    
        i = i + 1;
    end
     
     
    %
    i = 1;
    pCount = 0;
    lastOp = 1;
    while(isempty(F(i:length(F))) == 0)
%          display(F);
         if(lastOp >= i) 
            i = i + 1;
            continue;
         end
        if(F(i) == '*' || F(i) == '/')
%                  display(F(i));
        
            pCount = 0;
            for j = i-1 : -1 : 1
                if (F(j) == ')')
                    pCount = pCount + 1;
                elseif (F(j) == '(')
                    pCount = pCount - 1;
                end 
                
                if(pCount == 0)
                    F = [F(1:j-1) '(' F(j:length(F))];
                    
                    break;
                end
                
            end
            
            i = i + 1;
            pCount = 0;  
            for j = i+1 : length(F)
                if (F(j) == ')')
                    pCount = pCount + 1;
                elseif (F(j) == '(')
                    pCount = pCount - 1;
                end 
                
                if(pCount == 0)
                    F = [F(1:j-1) ')' F(j:length(F))];
                    break
                end
                
            end
            i = i + 1;
        end
    
        i = i + 1;
     end
    %
    
    %
    i = 1;
    pCount = 0;
    lastOp = 1;
    while(isempty(F(i:length(F))) == 0)
%          display(F);
         if(lastOp >= i) 
            i = i + 1;
            continue;
         end
        if(F(i) == '+' || F(i) == '-')
%            display(F(i));
            pCount = 0;
            for j = i-1 : -1 : 1
                if (F(j) == ')')
                    pCount = pCount + 1;
                elseif (F(j) == '(')
                    pCount = pCount - 1;
                end 
                
                if(pCount == 0)
                    F = [F(1:j-1) '(' F(j:length(F))];
                    
                    break;
                end
                
            end
            
            i = i + 1;
            pCount = 0;  
            for j = i+1 : length(F)
                if (F(j) == ')')
                    pCount = pCount + 1;
                elseif (F(j) == '(')
                    pCount = pCount - 1;
                end 
                
                if(pCount == 0)
                    F = [F(1:j-1) ')' F(j:length(F))];
                    break
                end
                
            end
            i = i + 1;
        end
    
        i = i + 1;
     end
    %
    
    
     final_string = F;
end
 