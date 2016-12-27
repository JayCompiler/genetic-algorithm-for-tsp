%% CX交叉操作(循环交叉)
%%parent1,parent2两个父代个体
%%child1,child2两个子代个体
%%author zy
%%date:2016.12.15
%function  [child1,child2,start,end0]=CXcrossover(parent1,parent2)
function  [child1,child2]=CXcrossover(parent1,parent2)
[~,N]=size(parent1);
tic

%% 找循环序列
start=[];
start=[start,parent1(1)];
index1=[];
index1=[index1,1];
end0=parent2(1);
while isempty(find(start==end0, 1))
    temp=find(parent1==end0);
    start=[start,end0];
    index1=[index1,temp];
    end0=parent2(temp);
end
index1=sort(index1);
child1=parent1;
for i=1:N
    if isempty(find(index1==i, 1))
        child1(i)=parent2(i);
    end
end


start1=[];
start1=[start1,parent2(1)];
index2=[];
index2=[index2,1];
end1=parent1(1);
while isempty(find(start1==end1, 1))
    temp=find(parent2==end1);
    start1=[start1,end1];
    index2=[index2,temp];
    end1=parent1(temp);
end
index2=sort(index2);
child2=parent2;
for i=1:N
    if isempty(find(index2==i, 1))
        child2(i)=parent1(i);
    end
end
        
        
        
        
        