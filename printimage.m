%% ��ʾͼ��
function printimage(data,path)
[~,N]=size(path);
x=zeros(N,1);
y=zeros(N,1);
for i=1:N
    x(i)=data(path(i),1);
    y(i)=data(path(i),2);
%     c=path(i);
%     text(x(i)+1,y(i)+1,num2str(c));
%     hold on
end
%% ������·��������
plot(x,y);
hold on
line([x(1),x(N)],[y(1),y(N)]);

%% �����ʼ��
plot(x(N),y(N),'ro','MarkerFaceColor','r')
plot(x(1),y(1),'ro','MarkerFaceColor','r')
title('att280���ݼ��ó��Ľ��')