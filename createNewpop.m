%% 产生下一代种群
%%author zy
function [newpopulation,bestfit,lengthmin] = createNewpop(population,popsize,disMatrix)

%%计算适应度
[fitnessMatrix,pathLength]=popFitness(population ,disMatrix);
%%排序适应度
[fitsort,index]=sort(fitnessMatrix,'descend');
[pathlengthsort,~]=sort(pathLength);
newpopulation=population(1:popsize,:);
%% 前一半保留最优，后一半随机生成
[~,N]=size(population);
pre=fix(popsize/2);
la=popsize-pre;

for i=1:pre
    newpopulation(i,:)=population(index(i,1),:);
end

for j=pre+1:popsize
    newpopulation(j,:)=randperm(N);
end

% for i=1:popsize
%     newpopulation(i,:)=population(index(i,1),:);
% end
bestfit=fitsort(1,1);
lengthmin=pathlengthsort(1,1);