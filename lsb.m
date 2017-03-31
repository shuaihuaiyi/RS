function [result] = lsb(source,rate)
    [m,n] = size(source);
    col = im2col(source, [m,n], 'distinct');
    for i = 1:m*n*rate
        if(mod(col(i), 2)==0 && ~(mod(col(i), 2)==mod(i,2)))
            col(i) = col(i)+1;
        elseif(mod(col(i), 2)==1 && ~(mod(col(i), 2)==mod(i,2)))
            col(i) = col(i)-1;
        end
    end
    result = col2im(col,[m,n], [m,n], 'distinct');
end