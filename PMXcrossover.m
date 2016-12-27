%% PMX交叉操作(部分匹配交叉)
%%parent1,parent2两个父代个体
%%child1,child2两个子代个体
%%author zy
function  [child1,child2,start,end0]=PMXcrossover(parent1,parent2)
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

% PMX交叉操作
p1 = parent1;
p2 = parent2;
%matlabpool local 2;

for j = start : end0
    index = find(p2 == p1(j));
    p2(index) = p2(j);
    p2(j) = p1(j);
end
child1(1,end0+1:N)=p2(1,end0+1:N);
child1(1,1:start-1)=p2(1,1:start-1);
p1 = parent1;
p2 = parent2;
for j = start : end0
    if p2(j) ~= p1(j)
        index = find(p1 == p2(j));
        p1(index) = p1(j);
        p1(j) = p2(j);
    end
end
child2(1,end0+1:N)=p1(1,end0+1:N);
child2(1,1:start-1)=p1(1,1:start-1);
t=toc;
%matlabpool close 


















