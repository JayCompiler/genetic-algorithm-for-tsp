%% ��������
%% author zy
function children=evolve(pop,pc,pm)
[M,~]=size(pop);

%% �������
%%���ɽ���������
seqcross=randperm(M);
%%��ԣ������������һ�����岻��ԣ���ż��ȫ�����
r=rem(M,2);
t=fix(M/2);
if(r==1)
    seqcross=seqcross(1,1:M-1);
end

children=[];
%%�����Ӵ���children��ʾ
for i=1:t
    p=rand(1);
    if(p<pc)
       %[child1,child2,~,~]=PMXcrossover(pop(seqcross(1,2*i-1),:),pop(seqcross(1,2*i),:));
        [child1,child2,~,~]=OXcrossover(pop(seqcross(1,2*i-1),:),pop(seqcross(1,2*i),:));
        %[child1,child2]=CXcrossover(pop(seqcross(1,2*i-1),:),pop(seqcross(1,2*i),:));
        children=[children;child1;child2];
    end
end

%% �������
for i=1:M
    p=rand(1);
    if(p<pm)
        [child,~,~]=SIMmutate(pop(i,:));
        %[child,~,~]=EMmutate(pop(i,:));
        %[child,~,~]=IMmutate(pop(i,:));
        children=[children;child];
    end
end
