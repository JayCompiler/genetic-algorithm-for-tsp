%% �����������еľ���
%%x��y����ͬ�����ݵ�
%%�þ������Ƕ���Ϊ�������е�1,αŷ����þ���-att48��2,ŷ����þ���-att280
%%author zy
function dis=distance(x,y,option)
if option==1
    dis=sqrt(((x(1,1)-y(1,1))^2+(x(1,2)-y(1,2))^2)/10);
else
    dis=sqrt(((x(1,1)-y(1,1))^2+(x(1,2)-y(1,2))^2));
end