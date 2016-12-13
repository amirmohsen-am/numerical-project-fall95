function [newF, inputNames2, values2, errors2] =  Calcualte_error_2(F, inputNames, values, errors)
i = 1;   
format long
F(isspace(F)) = [];
F = chap1.Parentheses2(F);
while(isempty(F(i:length(F))) == 0)
%     errors
%     values
    firstOpIndex = 0;
    secondOpIndex = 0;
    if(F(i) == ')')
            for j = i - 1 : -1 : 1
                if(F(j) == '(')
                    for  k = j : i 
                        if(F(k) == '+')
                            firstOp = char(F(j + 1 : k - 1));
                            secondOp = char(F(k + 1 : i - 1));
                            if(isnan(str2double(firstOp)) == 0)
                                firstOpValue = str2double(firstOp);
                                firstOpError = 0;
                            else
                                 for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,firstOp))
%                                         display(l);
                                        firstOpValue = values(l);
                                        firstOpError = errors(l);
                                    end
                                 end
                            end
                            if(isnan(str2double(secondOp)) == 0)
                                secondOpValue = str2double(secondOp);
                                secondOpError = 0;
                            else
                               for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,secondOp))
%                                         display(l);
                                        secondOpValue = values(l);
                                        secondOpError = errors(l);
                                    end
                                 end 
                            end
      
                            values = [values; (firstOpValue + secondOpValue)];
                            errors = [errors; (firstOpError + secondOpError)];
                            newName = strcat('op', num2str(length(inputNames)));
                            newNameCell = cellstr(newName);
                            inputNamesCell = cellstr(inputNames);
                            inputNames = [inputNamesCell; newNameCell];
                            F = char(strcat(F(1:j-1), inputNames(length(inputNames)), F(i + 1 : length(F))));
                            i = 1;
                            break
                        elseif(F(k) == '-')
                          
                             firstOp = char(F(j + 1 : k - 1));
                            secondOp = char(F(k + 1 : i - 1));
                            if(isnan(str2double(firstOp)) == 0)
                                firstOpValue = str2double(firstOp);
                                firstOpError = 0;
                            else
                                 for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,firstOp))
%                                         display(l);
                                        firstOpValue = values(l);
                                        firstOpError = errors(l);
                                    end
                                 end
                            end
                            if(isnan(str2double(secondOp)) == 0)
                                secondOpValue = str2double(secondOp);
                                secondOpError = 0;
                            else
                               for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,secondOp))
%                                         display(l);
                                        secondOpValue = values(l);
                                        secondOpError = errors(l);
                                    end
                                 end 
                            end
      
                            values = [values; (firstOpValue - secondOpValue)];
                            errors = [errors; (firstOpError + secondOpError)];
                            newName = strcat('op', num2str(length(inputNames)));
                            newNameCell = cellstr(newName);
                            inputNamesCell = cellstr(inputNames);
                            inputNames = [inputNamesCell; newNameCell];
                            F = char(strcat(F(1:j-1), inputNames(length(inputNames)), F(i + 1 : length(F))));
                            i = 1;
%                             display(i);
                            break
                        elseif(F(k) == '*')
                           
                             firstOp = char(F(j + 1 : k - 1));
                            secondOp = char(F(k + 1 : i - 1));
                            if(isnan(str2double(firstOp)) == 0)
                                firstOpValue = str2double(firstOp);
                                firstOpError = 0;
                            else
                                 for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,firstOp))
%                                         display(l);
                                        firstOpValue = values(l);
                                        firstOpError = errors(l);
                                    end
                                 end
                            end
                            if(isnan(str2double(secondOp)) == 0)
                                secondOpValue = str2double(secondOp);
                                secondOpError = 0;
                            else
                               for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,secondOp))
%                                         display(l);
                                        secondOpValue = values(l);
                                        secondOpError = errors(l);
                                    end
                                 end 
                            end
      
                            values = [values; (firstOpValue * secondOpValue)];
                            errors = [errors; (abs(firstOpError * secondOpValue) + abs(secondOpError * firstOpValue))];
                            newName = strcat('op', num2str(length(inputNames)));
                            newNameCell = cellstr(newName);
                            inputNamesCell = cellstr(inputNames);
                            inputNames = [inputNamesCell; newNameCell];
                            F = char(strcat(F(1:j-1), inputNames(length(inputNames)), F(i + 1 : length(F))));
                            i = 1;
                            break
                        elseif(F(k) == '/')
                         
                            firstOp = char(F(j + 1 : k - 1));
                            secondOp = char(F(k + 1 : i - 1));
                            if(isnan(str2double(firstOp)) == 0)
                                firstOpValue = str2double(firstOp);
                                firstOpError = 0;
                            else
                                 for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,firstOp))
%                                         display(l);
                                        firstOpValue = values(l);
                                        firstOpError = errors(l);
                                    end
                                 end
                            end
                            if(isnan(str2double(secondOp)) == 0)
                                secondOpValue = str2double(secondOp);
                                secondOpError = 0;
                            else
                               for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,secondOp))
%                                         display(l);
                                        secondOpValue = values(l);
                                        secondOpError = errors(l);
                                    end
                                 end 
                            end
      
                            values = [values; (firstOpValue / secondOpValue)];
                            errors = [errors; ((abs(firstOpError * secondOpValue) + abs(secondOpError * firstOpValue)) / (secondOpValue ^ 2))];
                            newName = strcat('op', num2str(length(inputNames)));
                            newNameCell = cellstr(newName);
                            inputNamesCell = cellstr(inputNames);
                            inputNames = [inputNamesCell; newNameCell];
                            F = char(strcat(F(1:j-1), inputNames(length(inputNames)), F(i + 1 : length(F))));
                            i = 1;
%                             display(i);
                            break    
                            elseif(F(k) == '^')
                         
                            firstOp = char(F(j + 1 : k - 1));
                            secondOp = char(F(k + 1 : i - 1));
                            if(isnan(str2double(firstOp)) == 0)
                                firstOpValue = str2double(firstOp);
                                firstOpError = 0;
                            else
                                 for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,firstOp))
%                                         display(l);
                                        firstOpValue = values(l);
                                        firstOpError = errors(l);
                                    end
                                 end
                            end
                            if(isnan(str2double(secondOp)) == 0)
                                secondOpValue = str2double(secondOp);
                                secondOpError = 0;
                            else
                               for  l = 1 : length(inputNames)
                                  in = char(inputNames(l));
                                    if(strcmp(in,secondOp))
%                                         display(l);
                                        secondOpValue = values(l);
                                        secondOpError = errors(l);
                                    end
                                 end 
                            end
      
                            values = [values; (firstOpValue ^ secondOpValue)];
                            errors = [errors; (abs((firstOpError) * ((firstOpValue) ^ ((secondOpValue) - 1)) * secondOpValue))];
                            newName = strcat('op', num2str(length(inputNames)));
                            newNameCell = cellstr(newName);
                            inputNamesCell = cellstr(inputNames);
                            inputNames = [inputNamesCell; newNameCell];
                            F = char(strcat(F(1:j-1), inputNames(length(inputNames)), F(i + 1 : length(F))));
                            i = 1;
%                             display(i);
                            break
                        elseif(F(k) == ')')
%                             display('done');
                            F = char(strcat(F(1:j-1), F(j+1:i-1), F(i + 1 : length(F))));
                            i = 1;
                            break
                        end
                    end
                    break
                end
            end
        end
        i = i + 1;
end
    

    values2 = values;
    errors2 = errors;
    inputNames2 = inputNames;
    newF = F;
end