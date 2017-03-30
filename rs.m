function[rm, sm, rm1, sm1] = rs(img)
    order = [ %z���Ͷ�ȡ����˳���
        1  9  2  3  10 17 25 18 ...
        11 4  5  12 19 26 33 41 ...
        34 27 20 13 6  7  14 21 ...
        28 35 42 49 57 50 43 36 ...
        29 22 15 8  16 23 30 37 ...
        44 51 58 59 52 45 38 31 ...
        24 32 39 46 53 60 61 54 ...
        47 40 48 55 62 63 56 64];    
    cols = im2col(img, [8 8], 'distinct');  % ��8x8 �Ŀ�ת��Ϊ��
    cols = cols(order, :);                  % ����order��˳����������
    [rm, sm, rm1, sm1] = deal(0);
    for col = cols
        pcb = getPixelCorrelation(col);
        flag = randi([1 3]);        %���ѡ��һ�ַ�ת��ʽ
        switch flag
            case 1                  %����ת
                for i = 1:64
                    x = col(i);
                    if(mod(x, 2)==0)
                        col(i) = x+1;
                    else
                        col(i) = x-1;
                    end
                end
                pca = getPixelCorrelation(col);
                if pca > pcb
                    rm = rm + 1;
                elseif pca < pcb
                    sm = sm + 1;
                end
            case 2                  %����ת
                for i = 1:64
                    x = col(i);
                    if(mod(x, 2)==0)
                        col(i) = x-1;
                    else
                        col(i) = x+1;
                    end
                end
                pca = getPixelCorrelation(col);
                if pca > pcb
                    rm1 = rm1 + 1;
                elseif pca < pcb
                    sm1 = sm1 + 1;
                end
            case 3                  %�㷭ת
        end
    end
end
