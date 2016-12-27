%% 遗传算法函数
%% author zy
%% date：2016.12.23
%% I迭代次数，pc交叉概率，pm 变异概率，disMatrix 距离矩阵，initpopulation 初始种群
function [t,recond,bestfits,lengthMins,bestI,lastpopulation]=ga(I,pc,pm,initpopulation,disMatrix,popSize,invarian)
%保存每代的最有适应度
bestfits=zeros(1,I);
%保存每代的最短长度
lengthMins=zeros(1,I);
%最优代数bestI
bestI=0;
%记录最后迭代的次数
recond=0;
%%父代种群
oldpopulation=initpopulation;
tid=tic;
for i=1:I
    %变异概率自适应
    pm0=pm+(1-pm)*(i/I);
    %%产生新的子代，进化操作（交叉，变异）
    newpopulation=evolve(oldpopulation,pc,pm0);
    %%子代和父代合并
    pop=combine(newpopulation,oldpopulation);
    %%选择产生下一代
    [newpopulation,bestfit,lengthMin] = createNewpop(pop,popSize,disMatrix);
    %%保留每代最优适应度,以及最短距离，和最优个体出现的代数
    bestfits(i)=bestfit;
    if((i-1)~=0)
        if(bestfit>bestfits(1,i-1))
            bestI=i;
        end
    end
    %%如果种群趋于稳定，直接跳出
    if((i-bestI)>=invarian)
        break;
    end
    lengthMins(i)=lengthMin;
    %更新父代
    oldpopulation=newpopulation;
    
    recond=i;
end
lastpopulation=oldpopulation;
t=toc(tid);