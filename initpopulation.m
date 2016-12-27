%% 初始化种群  
%%author zy
%%data原始数据
%%scale种群规模

function population = initpopulation(cityData,scale)
%N城市的数量
[N,~]=size(cityData);
population=zeros(scale,N);
for i=1:scale
    population(i,:)=randperm(N);
end

