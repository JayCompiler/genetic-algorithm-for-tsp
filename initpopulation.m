%% ��ʼ����Ⱥ  
%%author zy
%%dataԭʼ����
%%scale��Ⱥ��ģ

function population = initpopulation(cityData,scale)
%N���е�����
[N,~]=size(cityData);
population=zeros(scale,N);
for i=1:scale
    population(i,:)=randperm(N);
end

