function absolute_error = calculate_absolute_error(varStr, errVarStr, isChopping)
    if(isempty(varStr) == 0)
        if(isempty(errVarStr))
            index_of_point = strfind(varStr, '.');
            if(isempty(index_of_point))
                if(isChopping == 1)
                 absolute_error = 1;
                    return
                else
                    absolute_error = 0.5;
                    return
                end  
            end
            floating_count = length(varStr) - index_of_point;
            if(isChopping == 1)
                absolute_error = 1 * power(10, (-1) * floating_count);
            else
               absolute_error = 0.5 * power(10, (-1) * floating_count);
            end
        else
            absolute_error = str2double(errVarStr);
        end
    else
       absolute_error = -1;
    end
end