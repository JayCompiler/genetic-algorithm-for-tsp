%% �������
%%�������죨Exchange Mutation�� EM��
%%author zy
function [child,start,end0]=EMmutate(parent)
[~,N]=size(parent);
%% �������������
A=randperm(N,2);
start=A(1);
end0=A(2);

child=parent;
child(1,start)=parent(1,end0);
child(1,end0)=parent(1,start);



