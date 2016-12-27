%% ������һ����Ⱥ
%%author zy
function [newpopulation,bestfit,lengthmin] = createNewpop(population,popsize,disMatrix)

%%������Ӧ��
[fitnessMatrix,pathLength]=popFitness(population ,disMatrix);
%%������Ӧ��
[fitsort,index]=sort(fitnessMatrix,'descend');
[pathlengthsort,~]=sort(pathLength);
newpopulation=population(1:popsize,:);
%% ǰһ�뱣�����ţ���һ���������
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