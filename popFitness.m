%% ����������Ⱥ�ĵ���Ӧ�ȼ�
%% autghor zy
%%disMatrix ��ʾ���о������
%%population��ʾ��Ⱥ
%%fitnessMatrix ��ʾ��Ⱥ��Ӧ�ȼ�
function [fitnessMatrix,pathLength]=popFitness(population ,disMatrix)
[M,~]=size(population);
fitnessMatrix=zeros(M,1);
pathLength=zeros(M,1);
for i=1:M
    [fitness,pathL]=getFitness(population(i,:),disMatrix);
     fitnessMatrix(i,:)=fitness;
     pathLength(i,:)=pathL;
end
    
