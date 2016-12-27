%% 变异操作
%%插入变异（Insertion Mutation， IM）
%%author zy
function [child,start,end0]=IMmutate(parent)
[~,N]=size(parent);
%% 产生两个变异点
A=randperm(N,2);
start=A(1);
end0=A(2);
% 交换序号
if(start>end0)
    temp=start;
     start=end0;
    end0=temp;
end
child=parent;
if end0-start>1
    temp1=parent(1,start);
    %temp2=parent(1,end0);
    temp3=parent(1,start+1:end0-1);
    child(1,start:end0-2)=temp3;
    child(1,end0-1)=temp1;
end
