%% 计算染色体的适应度
%%disMatrix 表示城市距离矩阵
%%chromosomes表示染色体
%%fitness 表示适应度，这里以路径总长度的导数来评价
%%pathLength 路径总长度
function  [fitness,pathLength]=getFitness(chromosomes,disMatrix)
[~,N]=size(chromosomes);
pathLength=disMatrix(chromosomes(1,1),chromosomes(1,N));
for i=1:N-1
    pathLength=pathLength+disMatrix(chromosomes(1,i),chromosomes(1,i+1));
end
fitness=1/pathLength;
