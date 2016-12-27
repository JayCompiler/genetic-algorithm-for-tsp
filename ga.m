%% �Ŵ��㷨����
%% author zy
%% date��2016.12.23
%% I����������pc������ʣ�pm ������ʣ�disMatrix �������initpopulation ��ʼ��Ⱥ
function [t,recond,bestfits,lengthMins,bestI,lastpopulation]=ga(I,pc,pm,initpopulation,disMatrix,popSize,invarian)
%����ÿ����������Ӧ��
bestfits=zeros(1,I);
%����ÿ������̳���
lengthMins=zeros(1,I);
%���Ŵ���bestI
bestI=0;
%��¼�������Ĵ���
recond=0;
%%������Ⱥ
oldpopulation=initpopulation;
tid=tic;
for i=1:I
    %�����������Ӧ
    pm0=pm+(1-pm)*(i/I);
    %%�����µ��Ӵ����������������棬���죩
    newpopulation=evolve(oldpopulation,pc,pm0);
    %%�Ӵ��͸����ϲ�
    pop=combine(newpopulation,oldpopulation);
    %%ѡ�������һ��
    [newpopulation,bestfit,lengthMin] = createNewpop(pop,popSize,disMatrix);
    %%����ÿ��������Ӧ��,�Լ���̾��룬�����Ÿ�����ֵĴ���
    bestfits(i)=bestfit;
    if((i-1)~=0)
        if(bestfit>bestfits(1,i-1))
            bestI=i;
        end
    end
    %%�����Ⱥ�����ȶ���ֱ������
    if((i-bestI)>=invarian)
        break;
    end
    lengthMins(i)=lengthMin;
    %���¸���
    oldpopulation=newpopulation;
    
    recond=i;
end
lastpopulation=oldpopulation;
t=toc(tid);