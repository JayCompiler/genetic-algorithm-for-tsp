%% �������ݵľ������
%%author zy
%%dataָ�������ݼ�,ָ����������
function disMatrix=distanceMatrix(data,option)
[M,~]=size(data);
disMatrix=zeros(M,M);
if option==1
    for i=1:M
        for j=1:M
            disMatrix(i,j)=distance(data(i,:),data(j,:),1);
        end
    end
else
    for i=1:M
        for j=1:M
            disMatrix(i,j)=distance(data(i,:),data(j,:),2);
        end
    end
end

