%% ����Ⱦɫ�����Ӧ��
%%disMatrix ��ʾ���о������
%%chromosomes��ʾȾɫ��
%%fitness ��ʾ��Ӧ�ȣ�������·���ܳ��ȵĵ���������
%%pathLength ·���ܳ���
function  [fitness,pathLength]=getFitness(chromosomes,disMatrix)
[~,N]=size(chromosomes);
pathLength=disMatrix(chromosomes(1,1),chromosomes(1,N));
for i=1:N-1
    pathLength=pathLength+disMatrix(chromosomes(1,i),chromosomes(1,i+1));
end
fitness=1/pathLength;
