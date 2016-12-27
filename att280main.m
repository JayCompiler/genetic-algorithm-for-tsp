%% att280main 程序主入口
%%遗传算法解决tsp问题
%%author zy

clc 
clear 

%% 开启并行计算功能
% CoreNum=2; %调用的处理器个数
% if isempty(gcp('nocreate'))
%     %matlabpool('size')<=0  %之前没有打开
%     parpool('open','local',CoreNum);
% else  %之前已经打开
%     disp('matlab pool already started');
% end


%% 1.读入数据
load att280.txt;
x=att280(:,2);
y=att280(:,3);
data=[x,y];

%% 2.计算距离矩阵
disMatrix=distanceMatrix(data,2);

%% 3.初始化种群（包含编码方式）,种群规模50
popSize=40;
population = initpopulation(data,popSize);

%% 4 设定迭代次数I，变异概率pm,交叉概率pc
I=20000;
pc=0.7;
pm=0.3;
invariant=1000;
%% 遗传过程
[t,reconditera,bestfits,lengthMins,bestI,lastpopulation]=ga(I,pc,pm,population,disMatrix,popSize,invariant);
    
%% 输出最优路径
disp('最优路径：')
best=lastpopulation(1,:)
%% 输出最佳长度
disp('路径长度：')
[M,N]=size(lengthMins);
length=lengthMins(reconditera)

lengthMins=lengthMins(1:reconditera);
%% 输出算法执行时间
disp('算法执行时间：')
t
disp('最优个体出现的代数')
bestI

x=1:reconditera;
figure(2)
%% 画出最短路径逐代变化图
plot(x,lengthMins);
xlabel('迭代次数')
ylabel('最短距离')
hold on
%% 画出路径图
figure(1)
printimage(data,best)