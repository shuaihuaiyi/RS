clear all;
img = imread('lena.bmp');
data = zeros(9,11);
j = -0.1;
for i=1:11
    j = j+0.1;
    data(1,i) = j;
    newimg = lsb(img,j);
    [data(2,i),data(3,i),data(4,i),data(5,i)]=rs(newimg);
    newimg = antiRsLsb(img,j);
    [data(6,i),data(7,i),data(8,i),data(9,i)]=rs(newimg);
end
% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.11 0.263229166666667 0.815]);
hold(axes1,'on');

% ʹ�� plot �ľ������봴������
plot1 = plot(data(1,:),data(2:5,:),'Parent',axes1);
set(plot1(1),'DisplayName','R+');
set(plot1(2),'DisplayName','S+');
set(plot1(3),'DisplayName','R-');
set(plot1(4),'DisplayName','S-');

% ���� xlabel
xlabel({'��д��'});

% ���� title
title({'LSB��д��ʽ'});

% ���� ylabel
ylabel({'R,S����'});

box(axes1,'on');
% ���� legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.349001735862759 0.699247595483372 0.0371093752483527 0.147998299671803]);

% ���� axes
axes2 = axes('Parent',figure1,...
    'Position',[0.584427083333334 0.105741056218058 0.263229166666665 0.815]);
hold(axes2,'on');

% ʹ�� plot �ľ������봴������
plot2 = plot(data(1,:),data(6:9,:));
set(plot2(1),'DisplayName','R+');
set(plot2(2),'DisplayName','S+');
set(plot2(3),'DisplayName','R-');
set(plot2(4),'DisplayName','S-');

% ���� xlabel
xlabel({'��д��'});

% ���� title
title({'��RS��������д����'});

% ���� ylabel
ylabel({'R,S����'});

box(axes2,'on');
% ���� legend
legend2 = legend(axes2,'show');
set(legend2,...
    'Position',[0.802126735862759 0.608957987306201 0.0371093752483526 0.147998299671803]);