%% 计算两个城市的距离
%%x，y代表不同的数据点
%%该距离我们定义为两个城市的1,伪欧几里得距离-att48或2,欧几里得距离-att280
%%author zy
function dis=distance(x,y,option)
if option==1
    dis=sqrt(((x(1,1)-y(1,1))^2+(x(1,2)-y(1,2))^2)/10);
else
    dis=sqrt(((x(1,1)-y(1,1))^2+(x(1,2)-y(1,2))^2));
end