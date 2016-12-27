%% 计算整个种群的的适应度集
%% autghor zy
%%disMatrix 表示城市距离矩阵
%%population表示种群
%%fitnessMatrix 表示种群适应度集
function [fitnessMatrix,pathLength]=popFitness(population ,disMatrix)
[M,~]=size(population);
fitnessMatrix=zeros(M,1);
pathLength=zeros(M,1);
for i=1:M
    [fitness,pathL]=getFitness(population(i,:),disMatrix);
     fitnessMatrix(i,:)=fitness;
     pathLength(i,:)=pathL;
end
    
