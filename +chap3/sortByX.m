function [ Xi, Fi ] = sortByX( number, Xi, Fi)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    
    for i=1:number
        for j=i+1:number
            if ( Xi(j) < Xi(i) )
                tempX = Xi(i);
                Xi(i) = Xi(j);
                Xi(j) = tempX;
                tempY = Fi(i);
                Fi(i) = Fi(j);
                Fi(j) = tempY;
            end
        end
    end

end

