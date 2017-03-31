function [result] = antiRsLsb(source,rate)
    [m,n] = size(source);
    col = im2col(source, [m,n], 'distinct');
    for i = 1:m*n*rate
        t = 0;
        if(mod(col(i), 2)==0 && mod(i,2)==1)
            if(col(i) == 0)
                col(i) = col(i)+1;
            else
                for j=[i,i-1,i+1,i-m,i-m+1,i-m-1,i+m,i+m+1,i+m-1]
                    if(j>0 && j<= m*n)
                        t=t+col(j)-col(i);
                    end
                end
                if(t>0)
                    col(i) = col(i)+1;
                else
                    col(i) = col(i)-1;
                end
            end
        elseif(mod(col(i), 2)==1 && mod(i,2)==0)
            if(col(i) == 255)
                col(i) = col(i)-1;
            else
                for j=[i,i-1,i+1,i-m,i-m+1,i-m-1,i+m,i+m+1,i+m-1]
                    if(j>0 && j<= m*n)
                        t=t+col(j)-col(i);
                    end
                end
                if(t>0)
                    col(i) = col(i)+1;
                else
                    col(i) = col(i)-1;
                end
            end
        end
    end
    result = col2im(col,[m,n], [m,n],'distinct');
end