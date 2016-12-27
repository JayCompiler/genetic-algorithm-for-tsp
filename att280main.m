%% att280main ���������
%%�Ŵ��㷨���tsp����
%%author zy

clc 
clear 

%% �������м��㹦��
% CoreNum=2; %���õĴ���������
% if isempty(gcp('nocreate'))
%     %matlabpool('size')<=0  %֮ǰû�д�
%     parpool('open','local',CoreNum);
% else  %֮ǰ�Ѿ���
%     disp('matlab pool already started');
% end


%% 1.��������
load att280.txt;
x=att280(:,2);
y=att280(:,3);
data=[x,y];

%% 2.����������
disMatrix=distanceMatrix(data,2);

%% 3.��ʼ����Ⱥ���������뷽ʽ��,��Ⱥ��ģ50
popSize=40;
population = initpopulation(data,popSize);

%% 4 �趨��������I���������pm,�������pc
I=20000;
pc=0.7;
pm=0.3;
invariant=1000;
%% �Ŵ�����
[t,reconditera,bestfits,lengthMins,bestI,lastpopulation]=ga(I,pc,pm,population,disMatrix,popSize,invariant);
    
%% �������·��
disp('����·����')
best=lastpopulation(1,:)
%% �����ѳ���
disp('·�����ȣ�')
[M,N]=size(lengthMins);
length=lengthMins(reconditera)

lengthMins=lengthMins(1:reconditera);
%% ����㷨ִ��ʱ��
disp('�㷨ִ��ʱ�䣺')
t
disp('���Ÿ�����ֵĴ���')
bestI

x=1:reconditera;
figure(2)
%% �������·������仯ͼ
plot(x,lengthMins);
xlabel('��������')
ylabel('��̾���')
hold on
%% ����·��ͼ
figure(1)
printimage(data,best)