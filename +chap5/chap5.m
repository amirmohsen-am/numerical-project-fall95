%{
 Method numbers : 
    0 -> Taylor
    1 -> Euler
    2 -> Modified Euler
    3 -> Runge_Kutta Mid-Point
    4 -> Runge_Kutta 3rd-Order
    5 -> Runge_Kutta 4th-Order
    6 -> Adams_Multon 3rd-Order
    7 -> Adams_Multon 4th-Order

    8 -> 2nd order D.E By Euler method 
    9 -> Runge_Kutta 4th-Order
%}
function answerFinal = chap5(F, initial, h, n, steps, y, method) %n for taylor, steps for number of times it should apply the method
    if(method == 0) % Taylor
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / h;
        end
        answers = chap5.taylorMethod(F, initial, h, n);
        
        initial = [initial(1)+ h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        for i = 2 : steps
            answers = [answers; chap5.taylorMethod(F, initial, h, n)];
            initial = [initial(1) + h answers(length(answers))];
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
        
    elseif(method == 1) % Euler
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / h;
        end
         answers = chap5.euler(F, initial, h);
        initial = [initial(1)+ h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        for i = 2 : steps
            answers = [answers; chap5.euler(F, initial, h)];
            initial = [initial(1) + h answers(length(answers))];
        
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 2) % Modified Euler
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / h;
        end
         answers = chap5.modifiedEuler(F, initial, h);
        initial = [initial(1)+ h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        
        for i = 2 : steps
            answers = [answers; chap5.modifiedEuler(F, initial, h)];
            initial = [initial(1) + h answers(length(answers))];
            
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 3) % Runge Kutta Midpoint
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / h;
        end 
        answers = chap5.rungeKutta_Midpoint(F, initial, h);
        initial = [initial(1)+ h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        for i = 2 : steps
            answers = [answers; chap5.rungeKutta_Midpoint(F, initial, h)];
            initial = [initial(1) + h answers(length(answers))];
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 4) % Runge Kutta 3rd Order
       if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / h;
         end
        answers = chap5.rungeKutta_3rdOrder(F, initial, h);
        initial = [initial(1)+ h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        for i = 2 : steps
            answers = [answers; chap5.rungeKutta_3rdOrder(F, initial, h)];
            initial = [initial(1) + h answers(length(answers))];
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 5) % Runge Kutta 4th Order
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / h;
        end
        answers = chap5.rungeKutta_4thOrder(F, initial, h);
        initial = [initial(1)+ h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        for i = 2 : steps
            answers = [answers; chap5.rungeKutta_4thOrder(F, initial, h)];
            initial = [initial(1) + h answers(length(answers))];
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 6) % Adams Multon 3rd Order
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / (3 * h);
        end
        answers = chap5.adamsMulton_3rdOrder(F, initial, h);
        initial = [initial(1)+ 3 * h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        for i = 2 : steps
            answers = [answers; chap5.adamsMulton_3rdOrder(F, initial, h)];
            initial = [initial(1) + 3 * h answers(length(answers))];
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 7) % Adams Multon 4th Order
        if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / (4 * h);
        end
         answers = chap5.adamsMulton_4thOrder(F, initial, h);
        initial = [initial(1) + 4*h answers];
        
        newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        for i = 2 : steps
            answers = [answers; chap5.adamsMulton_4thOrder(F, initial, h)];
            initial = [initial(1) + 4*h answers(length(answers))];
            
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
            
        end
    elseif(method == 8) % 2ndOrder DE Euler Method
%          
%          length(answers)
         if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / (h);
         end
         
        answers = chap5.DE2ndOrder(F, initial, h);
        newName = strcat('y(',  num2str(initial(1) + h), ') =  ', num2str(answers( 2)), ' , y''(',  num2str(initial(1) + h), ') =  ', num2str(answers(1)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        initial = [initial(1)+ h answers(2) answers(1)];
        for i = 2 : steps
            answers = [answers; chap5.DE2ndOrder(F, initial, h)];
            initial = [initial(1) + h answers(length(answers)) answers(length(answers) - 1)];
       
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)), ' , y''(',  num2str(initial(1)), ') =  ', num2str(initial(3)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
        end
    elseif(method == 9) % 2ndOrder DE Runge Kutta 4th
         if(isnan(y) == 0) %y is perfered over steps 
            steps = (y - initial(1)) / (h);
         end
         
        answers = chap5.DE2ndOrderRunge_Kutta(F, initial, h);
        newName = strcat('y(',  num2str(initial(1) + h), ') =  ', num2str(answers( 2)), ' , y''(',  num2str(initial(1) + h), ') =  ', num2str(answers(1)));
        newNameCell = cellstr(newName);
        answerFinal = newNameCell;
        
        initial = [initial(1)+ h answers(2) answers(1)];
        for i = 2 : steps
            answers = [answers; chap5.DE2ndOrderRunge_Kutta(F, initial, h)];
            initial = [initial(1) + h answers(length(answers)) answers(length(answers) - 1)];
       
            newName = strcat('y(',  num2str(initial(1)), ') =  ', num2str(initial(2)), ' , y''(',  num2str(initial(1)), ') =  ', num2str(initial(3)));
            newNameCell = cellstr(newName);
            answerFinalCell = cellstr(answerFinal);
            answerFinal = [answerFinalCell; newNameCell];
        end
        
         
         %         initial = [initial(1)+ h answers(1) answers(2)];
%         for i = 2 : steps
%             answers = [answers; DE2ndOrderRunge_Kutta(F, initial, h)];
%             initial = [initial(1) + h answers(length(answers) - 1) answers(length(answers))];
%         end
    end
end
