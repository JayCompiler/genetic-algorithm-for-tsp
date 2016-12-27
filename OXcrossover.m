%% OX交叉操作(顺序交叉)
%%parent1,parent2两个父代个体
%%child1,child2两个子代个体
%%author zy
%%date:2016.12.15
function  [child1,child2,start,end0]=OXcrossover(parent1,parent2)
 [~,N]=size(parent1);
  tic
%% 产生两个交叉点位置
A=randperm(N,2);
start=A(1);
end0=A(2);
% 交换序号
if(start>end0)
    temp=start;
     start=end0;
    end0=temp;
end

child1  = zeros(size(parent1));
child2  = zeros(size(parent2));

% 交叉片段
child1(:, start:end0) = parent1(:, start:end0);
child2(:, start:end0) = parent2(:, start:end0);

part1=parent1(1, start:end0);
part2=parent2(1, start:end0);
%OX交叉操作
% p1 = parent1;
% p2 = parent2;
temp1=zeros(1,N-end0+start-1);
temp2=zeros(1,N-end0+start-1);
j=1;
 m=1;
for i=1:N
    if isempty(find(part1==parent2(1,i), 1))
        temp1(1,j)=parent2(1,i);
        j=j+1;
    end
    if isempty(find(part2==parent1(1,i), 1))
        temp2(1,m)=parent1(1,i);
        m=m+1;
    end
end
% child1=temp1;
% child2=temp2;
child1(1,1:start-1)=temp1(1,1:start-1);
child1(1,start:end0)=part1;
child1(end0+1:N)=temp1(1,start:N-end0+start-1);

child2(1,1:start-1)=temp2(1,1:start-1);
child2(1,start:end0)=part2;
child2(end0+1:N)=temp2(1,start:N-end0+start-1);
