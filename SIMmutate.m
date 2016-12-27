%% 变异操作
%%简单倒位变异（Simple Inversion Mutation， SIM）
%%author zy
function [child,start,end0]=SIMmutate(parent)
[~,N]=size(parent);
%% 产生倒位变异点
A=randperm(N,2);
start=A(1);
end0=A(2);
% 交换序号
if(start>end0)
    temp=start;
     start=end0;
    end0=temp;
end
%%倒位变异操作
part=parent(1,start:end0);
part=part(end:-1:1);
child=parent;
child(1,start:end0)=part;


