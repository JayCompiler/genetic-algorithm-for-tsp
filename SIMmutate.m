%% �������
%%�򵥵�λ���죨Simple Inversion Mutation�� SIM��
%%author zy
function [child,start,end0]=SIMmutate(parent)
[~,N]=size(parent);
%% ������λ�����
A=randperm(N,2);
start=A(1);
end0=A(2);
% �������
if(start>end0)
    temp=start;
     start=end0;
    end0=temp;
end
%%��λ�������
part=parent(1,start:end0);
part=part(end:-1:1);
child=parent;
child(1,start:end0)=part;


