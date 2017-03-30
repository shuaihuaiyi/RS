function [sum] = getPixelCorrelation(col)
    len = size(col,1);
    sum = 0;
    for i = 2:len
        sum = sum + abs(col(i-1) - col(i));
    end
end